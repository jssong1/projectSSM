package ssm.cg.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.cg.vo.OnlineApplication_BoardVO;
import ssm.cg.vo.Online_CommentVO;
import ssm.common.utils.ChaebunClass;
import ssm.cg.service.Online_CommentService;




@Controller
@RequestMapping(value="/oaComment")
public class Online_CommentController {

	Logger logger = Logger.getLogger(Online_CommentController.class);

	@Autowired
	private Online_CommentService online_CommentService;
	
	@ResponseBody
	@RequestMapping(value="/listAll/{oaNo}.ssm", method =RequestMethod.GET)
	public ResponseEntity<List<Online_CommentVO>> octList(@PathVariable("oaNo")String oaNo){
		
		logger.info(">>>>>>LIST 호출 성공");
		logger.info("controller oaNo>>> : " +oaNo);
		
		ResponseEntity<List<Online_CommentVO>> entity = null;
		try{
			entity= new ResponseEntity<>(online_CommentService.ocList(oaNo),HttpStatus.OK);
			logger.info("controller entity >>> :"+entity);
		}catch(Exception e){
			e.printStackTrace();
			entity= new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	

	  /**
   * 게시물 댓글 불러오기(Ajax)
   * @param boardVO
   * @param request
   * @return
   * @throws Exception
   */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/commentList", method= {RequestMethod.GET, RequestMethod.POST})
    public JSONArray ajax_commentList(@ModelAttribute("OnlineApplication_BoardVO") OnlineApplication_BoardVO obVO, HttpServletRequest request) throws Exception{
		logger.info("(log)Controller.ajax_commentList() START");
        HttpHeaders responseHeaders = new HttpHeaders();
      
        // 해당 게시물 댓글
        List<Online_CommentVO> commentVO = online_CommentService.selectBoardCommentByCode(obVO);
        // json객체, 배열 생성
		JSONObject jObj = new JSONObject();
		JSONArray jArr = new JSONArray();
     		
		ArrayList<Online_CommentVO> ccList = (ArrayList<Online_CommentVO>)commentVO;	
        if(ccList.size() > 0){
            for(int i=0; i<ccList.size(); i++){
            	
            	jObj = new JSONObject();
               
                jObj.put("ocNo", ccList.get(i).getOcNo());
                jObj.put("ttNo", ccList.get(i).getTtNo());
                jObj.put("ocInsertdate",ccList.get(i).getOcInsertdate());
                jObj.put("ocTitle", ccList.get(i).getOcTitle());
                jObj.put("ocContents", ccList.get(i).getOcContents());
                jObj.put("oaStatus", ccList.get(i).getOaStatus());
                jObj.put("ttNo", ccList.get(i).getTtNo());
                jArr.add(jObj);
            }//for         
        }//if
        
		logger.info("(log)Controller.ajax_commentList() END >>>");
      return jArr;        
    }
	
	/**********
	 * 댓글 글쓰기 구현하기
	 * @return String
	 * 참고: @RequestBody
	 * @throws UnsupportedEncodingException 
	 * ********/
	@RequestMapping(value="/commentInsert")
	public ResponseEntity<String> commentInsert(Online_CommentVO ocvo, HttpServletRequest req) throws UnsupportedEncodingException{
		
		req.setCharacterEncoding("utf-8");
		logger.info("commentInsert 호출 성공");
		ResponseEntity<String> entity= null;
		int result;
		int size = 10*1024*10;
		String chNo="";
		String ttNo = "";
		String oaNo = "";
		String ocTitle = "";
		String ocContents = "";
		String ocFile = "";
		String ocFileName = "";
		String uploadPath  = req.getSession().getServletContext().getRealPath("/uploadStorage_T");
		File isDir = new File(uploadPath);
		
		if(!isDir.isDirectory()){

			logger.info("디렉토리가 없습니다. 디렉토리를 새로 생성합니다.");

	    	isDir.mkdir();

	    }
		
		try{
			MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			
			// 답변 제목, 내용
			ocTitle = multi.getParameter("ocTitle");
			ocContents = multi.getParameter("ocContents");
			ttNo = multi.getParameter("ttNo");
			oaNo = multi.getParameter("oaNo");
			// 업로드 파일
			Enumeration file = multi.getFileNames();
			ocFile = (String)file.nextElement();
			ocFileName = multi.getFilesystemName(ocFile);
			// set vo
			ocvo.setTtNo(ttNo);
			ocvo.setOaNo(oaNo);
			ocvo.setOcTitle(ocTitle);
			ocvo.setOcContents(ocContents);
			ocvo.setOcFile(ocFileName);
			
			logger.info(">>>:"+ocTitle);
			logger.info("(log)ttNo : " + ttNo);
			logger.info("(log)oaNo : " + oaNo);
			logger.info("(log)ocTitle : " + ocTitle);
			logger.info("(log)ocContents : " + ocContents);
			logger.info("(log)ocFileName : " + ocFileName);

			Online_CommentVO chaebun = online_CommentService.selectChaebun(ocvo);
			logger.info("Service chaebun >>>> : "+chaebun);
			chNo= chaebun.getOcNo();
			logger.info("chNo >>> : " +chNo);
			ocvo.setOcNo(ChaebunClass.OCchaeunNo(chNo));

			
			result = online_CommentService.commentInsert(ocvo);
			logger.info("controller insert result>>> " + result);
			if(result==1){
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
				logger.info("controller insert entity>>> " + entity);
			}		
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/*********
	 * 댓글 수정 구현하기
	 * @return
	 * 참고 : REST 방식에서 UPDATE 작업은 PUT,PATCH 방식을 이용해서 처리
	 * 		전체 데이터를 수정하는 경우에는 PUT을 이용하고,
	 * 		일부의 데이터를 수정하는 경우에는 PATCH를 이용
	 * ********/
	@ResponseBody
	@RequestMapping(value="/{ocNo}.ssm",method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> commentUpdate(@PathVariable("ocNo") String ocNo, @RequestBody Online_CommentVO ocVo){
		logger.info("commentUpdate 호출 성공");
		ResponseEntity<String> entity = null;
		
		try{
			ocVo.setOcNo(ocNo);
			online_CommentService.commentUpdate(ocVo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/************
	 * 댓글 삭제 구현하기
	 * @return
	 * 참고:REST방식에서 DELETE 작업은 DELETE방식을 이용해서 처리
	 * ***********/
	@ResponseBody
	@RequestMapping(value="/{ocNo}.ssm",method = RequestMethod.DELETE)
	public ResponseEntity<String> commentDelete(@PathVariable("ocNo") String ocNo){
		logger.info("replyDelete ȣ�� ����");
		ResponseEntity<String> entity = null;
		try{
			online_CommentService.commentDelete(ocNo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
