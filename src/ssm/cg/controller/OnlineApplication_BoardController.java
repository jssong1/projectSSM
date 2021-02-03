package ssm.cg.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.cg.common.CgCommon;
import ssm.cg.paging.Paging;
import ssm.cg.service.OnlineApplication_BoardService;
import ssm.cg.vo.OnlineApplication_BoardVO;
import ssm.common.utils.UserSession;

@Controller
@RequestMapping(value="/onlineApplication")
public class OnlineApplication_BoardController {

	Logger logger = Logger.getLogger(OnlineApplication_BoardController.class);
	
	@Autowired
	private OnlineApplication_BoardService onlineApplication_BoardService;
	
	
	/*상담창구 메인화면*/
	@RequestMapping(value="/cgMain")
	public String cgMain(HttpSession session){
		logger.info("(log)CGMAIN START >>>");
		String url ="";
		String sessionAU= (String) session.getAttribute("USERAUTHORIRY");
			if (sessionAU.equals("1")){
				url="main/cgMain_S";
			}else{
				url="main/cgMain_T";
			};
		logger.info("(log)CGMAIN END<<<");
		return url;
	}
	
	/*온라인상담 - 학생*/////////////////////
	/*온라인상담리스트*/
	@RequestMapping(value="/oaBoardList", method=RequestMethod.GET)
	public String oaBoardList(@ModelAttribute OnlineApplication_BoardVO oaVo, Model model, HttpSession session){
		
		logger.info("(log)Controller.oaBoardList() start >>>");
		String ssNo = (String)session.getAttribute("USERNO");
		oaVo.setSsNo(ssNo);
		if(oaVo.getOrderSc()==null) {oaVo.setOrderBy("oaNo");}
		if(oaVo.getOrderSc()==null) {oaVo.setOrderSc("ASC");}
		
		
		logger.info("(log)orderBy : " + oaVo.getOrderBy());
		logger.info("(log)orderSc : " + oaVo.getOrderSc());
		
		logger.info("(log)search : " + oaVo.getSearch());
		logger.info("(log)keyword : " + oaVo.getKeyword());
		
		
		int total = onlineApplication_BoardService.oaBoardListCnt(oaVo);
		logger.info("(log)total : " + total);
		
		Paging.oaSetPage(oaVo);
		
		List<OnlineApplication_BoardVO> oaList = onlineApplication_BoardService.oaBoardList(oaVo);
		
		model.addAttribute("data", oaVo);
		model.addAttribute("oaBoardList", oaList);
		model.addAttribute("pageSize", oaVo.getPageSize());
		model.addAttribute("page", oaVo.getPage());
		model.addAttribute("total", total);
		model.addAttribute("ssNo", ssNo);

		logger.info("(log)Controller.oaBoardList() end <<<");
		return "cg/online/oaBoardList";
	} // oaBoardList()
	
	/*온라인상담글 상세보기*/
	@RequestMapping(value="/oaDetailForm")
	public String oaBoardDetail(@ModelAttribute OnlineApplication_BoardVO oaVo, Model model){
		logger.info("(log)Controller.oaBoardDetail() start >>>");
		
		OnlineApplication_BoardVO oa_Vo = onlineApplication_BoardService.oaBoardDetail(oaVo);
		oa_Vo.setOaField(CgCommon.oaFieldCode(oa_Vo.getOaField()));
		model.addAttribute("oaDetailList", oa_Vo);
		
		logger.info("(log)Controller.oaBoardDetail() end <<<");
		
		return "cg/online/oaBoardDetail";
	}

	
	/*온라인상담 신청폼*/
	@RequestMapping(value="/oaInsertForm")
	public String oaInsertForm(){		
		logger.info("(log)Controller.oaInsertForm() start >>>");
		logger.info("(log)Controller.oaInsertForm() end <<<");
		return "cg/online/oaStudent/oaInsertForm";
	}
	
	/*온라인상담 수정폼*/
	@RequestMapping(value="/oaUpdateForm")
	public String oaUpdateForm(@ModelAttribute OnlineApplication_BoardVO oaVo, Model model){
		logger.info("(log)Controller.oaUpdateForm() statrt >>>");
		OnlineApplication_BoardVO oa_Vo = onlineApplication_BoardService.oaBoardDetail(oaVo);		
		model.addAttribute("oaUpdateList", oa_Vo);
		logger.info("(log)Controller.oaUpdateForm() end <<<");
		return "cg/online/oaStudent/oaUpdateForm";
	}
	
	
	/*온라인상담 글 등록*/
	@RequestMapping(value="/oaBoardInsert")
	public String oaBoardInsert(@ModelAttribute OnlineApplication_BoardVO oaVo, Model model, HttpServletRequest req, HttpSession session){
		
		logger.info("(log)Controller.oaBoardInsert() start >>>");
		logger.info("(log)multipart : " + req.getContentType());
		String url = "";
		int result = 0;
		
		int size = 10*1024*1024;
		
		String oaField = "";
		String ttNo = "";
		String ssNo = "";
		String oaTitle = "";
		String oaContents = "";
		String oaFile = "";
		String oaFileName = "";
		String uploadPath = req.getSession().getServletContext().getRealPath("/uploadStorage");
		File isDir = new File(uploadPath);
		if(!isDir.isDirectory()){

			logger.info("디렉토리가 없습니다. 디렉토리를 새로 생성합니다.");
	    	isDir.mkdir();

	    }
		logger.info(uploadPath);
		
		try{
			MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			
			oaField = multi.getParameter("oaField");
			ttNo = multi.getParameter("ttNo");
			//ssNo = multi.getParameter("ssNo");
			oaTitle = multi.getParameter("oaTitle");
			oaContents = multi.getParameter("oaContents");
			//oaFile = multi.getParameter("oaFile");
			String ssNo_ = (String)session.getAttribute("USERNO");
			logger.info("(log)oaContents : " + oaContents);
			
			Enumeration file = multi.getFileNames();
			oaFile = (String)file.nextElement();
			oaFileName = multi.getFilesystemName(oaFile);

			
			logger.info("(log)oaFileName : " + oaFileName);
			logger.info("(log)oaFile : " + oaFile);
			logger.info("(log)oaTitle : " + oaTitle);
			
			OnlineApplication_BoardVO Chaebun = onlineApplication_BoardService.oaChaebun(oaVo.getOaNo());
			//oaVo = onlineApplication_BoardService.oaChaebun(oaVo.getOaNo());
			String oaNo = Chaebun.getOaNo();
			oaNo = CgCommon.oaChaebun(oaNo);
			logger.info(oaNo);
			oaVo.setOaNo(oaNo);
			
			oaVo.setOaField(oaField);
			oaVo.setTtNo(ttNo);
			oaVo.setSsNo(ssNo_);
			oaVo.setOaTitle(oaTitle);
			oaVo.setOaContents(oaContents);
			oaVo.setOaFile(oaFileName);
			
			
			result = onlineApplication_BoardService.oaBoardInsert(oaVo);
			boolean bResult = result != 0;
			logger.info("(log)bResult : " + bResult);
			if(bResult) url = "/onlineApplication/oaBoardList.ssm";
				
		} catch(Exception e){
			e.printStackTrace();
			logger.info("(log)Controller 에러  : " + e.getMessage());
		}
		
		logger.info("(log)Controller.oaBoardInsert() end <<<");
		return "redirect:" + url;
	} // oaBoardInsert()
	
	/*온라인상담 글수정*/
	@RequestMapping(value="/oaBoardUpdate")
	public String oaBoardUpdate(@ModelAttribute OnlineApplication_BoardVO oaVo, Model model){
		
		logger.info("(log)Controller.oaBoardUpdate() start >>>");
		int result = 0;
		String url = "";
		
		result = onlineApplication_BoardService.oaBoardUpdate(oaVo);
		boolean bResult = result != 0;
		
		if(bResult) url = "/onlineApplication/oaBoardList.ssm";
		
		
		logger.info("(log)Controller.oaBoardUpdate() end <<<");
		return "redirect:" + url;
	}
	
	/*온라인상담 글 삭제*/
	@RequestMapping(value="/oaBoardDelete")
	public String oaBoardDelete(@ModelAttribute OnlineApplication_BoardVO oaVo, Model model){
		
		logger.info("(log)Controller.oaBoardDelete() start >>>");
		int result = 0;
		String url = "";
		
		result = onlineApplication_BoardService.oaBoardDelete(oaVo);
		boolean bResult = result != 0;
		
		if(bResult) url = "/onlineApplication/oaBoardList.ssm";
		
		logger.info("(log)Controller.oaBoardDelete() end <<<");
		return "redirect:" + url;
	}
	
	/*온라인상담 파일다운로드*/
	@RequestMapping("/oaFileDownload")
	public String oaFiledownload(@ModelAttribute OnlineApplication_BoardVO oaVo, Model model, HttpServletRequest req){
		
		logger.info("(log)Controller.oaFiledownload() start >>>");
		String downloadPath = req.getSession().getServletContext().getRealPath("/uploadStorage");
		
		String fileName = (String) req.getParameter("fileName");
		logger.info("(log)fileName : " + fileName);
		model.addAttribute("fileName", fileName);
		logger.info("(log)Controller.oaFiledownload() end <<<");
		return "cg/etc/fileDownload";
	}
	

	
	/*온라인상담 - 담임교사*/////////////////////
	/* 담임교사의 학급 학생정보 */
	@RequestMapping(value="/oaListCLT", method=RequestMethod.GET)
	public String oaListCLT(@ModelAttribute OnlineApplication_BoardVO oaVo, Model model,HttpSession session){	
		logger.info("(log)Controller.oaListCLT() start >>>");
		
		//세션으로 선생님 정보받기 학년,반
		String SessionNo = (String) session.getAttribute("USERNO");
		oaVo.setTtNo(SessionNo);
		
		List<OnlineApplication_BoardVO> oaListCLT = onlineApplication_BoardService.oaListCLT(oaVo);
		model.addAttribute("oaListCLT", oaListCLT);

		
		logger.info("(log)Controller.oaListCLT() end <<<");
		return "cg/online/oaCLT/oaListCLT";
	} // oaBoardList()
	
	/* 학생의 답변대기 상담글 조회(온라인상담-담임교사) */
	@RequestMapping(value="/ssOaList", method=RequestMethod.POST)
	public String ssOaList(@ModelAttribute OnlineApplication_BoardVO oaVo, Model model){	
		logger.info("(log)Controller.pendingOaList() start >>>");
		
		List<OnlineApplication_BoardVO> ssOaList = onlineApplication_BoardService.ssOaList(oaVo);
		model.addAttribute("ssOaList", ssOaList);
		
		logger.info("(log)Controller.pendingOaList() end <<<");
		return "cg/online/oaCLT/ssOaList";
	} // oaBoardList
	
} // OnlineApplication_BoardController
