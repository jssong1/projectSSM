package ssm.mi.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.cg.vo.Edu_ScheduleVO;
import ssm.cg.vo.VisitCounsel_RsvVO;
import ssm.common.utils.ChaebunClass;
import ssm.common.utils.FilePath;
import ssm.mi.service.AdminService;
import ssm.mi.vo.TMemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	Logger log = Logger.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;

	/*관리자의 가입 교사 정보 전체조회 (교사 정보관리)*/
	@RequestMapping(value="/listTMember",method={RequestMethod.GET,RequestMethod.POST})
	public String listTMember(@ModelAttribute TMemberVO param, Model model){
		log.info("listTMember START>>>>>>>>>");		
		return "admin/tMember";
	}
	
	@RequestMapping(value="/listTMemberAll",method={RequestMethod.GET,RequestMethod.POST})
	public String listTMemberAll(@ModelAttribute TMemberVO param, Model model){
		log.info("START");		
		List<TMemberVO> list = adminService.listTMemberAll(param);
		log.info("list>>> : " + list);

		model.addAttribute("tmemberList",list);
		return "admin/tMemberAll";
	}
	
	/*관리자의 미가입 교사 정보 전체조회*/
	@RequestMapping(value="/listTMemberN",method={RequestMethod.GET,RequestMethod.POST})
	public String listTMemberN(@ModelAttribute TMemberVO param, Model model){
		log.info("START");		
		List<TMemberVO> list = adminService.listTMemberN(param);
		log.info("list>>> : " + list);

		model.addAttribute("tmemberList",list);
		return "admin/tMemberN";
	}
	
	/*관리자의 가입 교사 정보 전체조회 (교사 정보관리)*/
	@RequestMapping(value="/listTMemberY",method={RequestMethod.GET,RequestMethod.POST})
	public String listTMemberY(@ModelAttribute TMemberVO param, Model model){
		log.info("START");		
		List<TMemberVO> list = adminService.listTMemberY(param);
		log.info("list>>> : " + list);

		model.addAttribute("tmemberList",list);
		return "admin/tMemberY";
	}
	
	//관리자글쓰기폼
	@RequestMapping(value="/insertFormTMember", method=RequestMethod.GET)
	public String tMemInsertForm(){
		log.info("tMemInsertForm ȣ�� ����");
		return "admin/tMemInsertForm";
	}
	
	//관리자교사정보입력
	@RequestMapping(value="/tMemberInsert", method=RequestMethod.POST)
	public String tMemberInsert(@ModelAttribute TMemberVO tvo){
		log.info("tMemberInsert ȣ�� ����");
		log.info("tvo >> : " +tvo);
//		TMemberVO tmvo0 = (TMemberVO)tvo.gettMemberList().get(0);
//		log.info("tvo.gettMemberList().get(0).getTtName >>> : " + tmvo0.getTtName());	
//		TMemberVO tmvo1 = (TMemberVO)tvo.gettMemberList().get(1);
//		log.info("tvo.gettMemberList().get(1).getTtName >>> : " + tmvo1.getTtName());
		
		int result=0;
		String url="";
		for(int i=0; i<tvo.gettMemberList().size(); i++){
			TMemberVO tmvo = (TMemberVO)tvo.gettMemberList().get(i);
			log.info("["+i+"] ttName >>> : " +tmvo.getTtName());
			log.info("["+i+"] ttBirth >>> : " +tmvo.getTtTransferyear());
			log.info("["+i+"] ttGender >>> : " +tmvo.getTtGender());
			
			/***********chaebun logic*********/
			//transferyear/gender확인
			String tgcode = ChaebunClass.TchaeunNo1(tmvo);
			log.info("year/gender code>>>: " +tgcode);
			
			//chaebun service로 max값확인
			TMemberVO pvo = adminService.selectChaebun(tgcode);
			String chNo = pvo.getTtNo();
			log.info("(log)Controller_chNo >> : " +chNo);
			
			//문자열붙이기
			tmvo.setTtNo(chNo);
			tgcode = ChaebunClass.TchaeunNo2(tmvo);
			tmvo.setTtNo(tgcode);
			
			
//			String b_file =FileUploadUtil.fileUpload(bvo.getFile(), request);
//			tmvo.setB_file(b_file);
			result = adminService.tMemberInsert(tmvo);
		}
		
		if(result == 1){
			url = "/admin/listTMemberN.ssm";
		}
		return "redirect:" + url;
	}//tMeminsert
	
	
	//교사 권한 업데이트
	@RequestMapping(value="/updateYTMember", method=RequestMethod.POST)
	public String updateYTMember(@ModelAttribute TMemberVO tvo, Model model) {
		log.info("updateYTMembers 호출 성공");
		log.info("tvo >> : " +tvo);
		int result=0;
		String resultStr = "";
		String url="";
		log.info(">>> : "+ tvo.toString());
		for(int i=0; i<tvo.gettMemberList().size(); i++){
			TMemberVO tmvo = (TMemberVO)tvo.gettMemberList().get(i);
			log.info("["+i+"] ttNo >>> : " +tmvo.getTtNo());
			log.info("["+i+"] ttAuthority >>> : " +tmvo.getTtAuthority());
			result = adminService.tMemberYUpdate(tmvo);
			log.info("result CONTROLLER>> : " +result);
		}
		
		if(result>0){
			resultStr="권한 수정 완료";
		}else{
			resultStr="권한 수정 실패"; 
		}
		url="forward:/member/listTMemberY.ssm";
		log.info("resultStr" + resultStr);
		model.addAttribute("result",resultStr);
		return url;
	}

	//관리자의 교사 상세보기
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="tMemberDetail", method=RequestMethod.POST)
	public Object tMemberDetail(@RequestBody TMemberVO tvo, Model model){
		
		log.info("(log)Controller.tMemberDetail() start >>>");
		
		//String resultStr = "";
		// �Ѿ�� ������ Ȯ��
		log.info("(log)vrNo : " + tvo.getTtNo());
		//esvo.setVrNo("VR0008");
		TMemberVO tmvo = adminService.tMemberDetail(tvo);
		
		log.info("(log)getTtNo : " + tmvo.getTtNo());
		log.info("(log)getTtName : " + tmvo.getTtName());
		log.info("(log)getTtBirth : " + tmvo.getTtBirth());
		log.info("(log)getTtAuthority : " + tmvo.getTtAuthority());
		log.info("(log)getSjtCode : " + tmvo.getSjtCode());
		log.info("(log)getTtId : " + tmvo.getTtId());
		log.info("(log)getTtTransferyear : " + tmvo.getTtTransferyear());
		log.info("(log)getTtGrade : " + tmvo.getTtGrade());

		JSONObject jObj = new JSONObject();
		
		jObj.put("ttNo", tmvo.getTtNo());
		jObj.put("ttName", tmvo.getTtName());
		jObj.put("ttBirth", tmvo.getTtBirth());
		jObj.put("ttGender", tmvo.getTtGender());
		jObj.put("ttAuthority", tmvo.getTtAuthority());
		jObj.put("sjtCode", tmvo.getSjtCode());
		jObj.put("ttId", tmvo.getTtId());
		jObj.put("ttPw", tmvo.getTtPw());
		jObj.put("ttTransferyear", tmvo.getTtTransferyear());
		jObj.put("ttPn", tmvo.getTtPn());
		jObj.put("ttEmail", tmvo.getTtEmail());
		jObj.put("ttImage", tmvo.getTtImage());
		jObj.put("ttGrade", tmvo.getTtGrade());
		jObj.put("ttClass", tmvo.getTtClass());
		jObj.put("ttDeleteyn", tmvo.getTtDeleteyn());
		jObj.put("ttInsertdate", tmvo.getTtInsertdate());
		jObj.put("ttUpdatedate", tmvo.getTtUpdatedate());
		jObj.put("ttAdmindate", tmvo.getTtAdmindate());
		
		
		model.addAttribute("tmvo", tmvo);
		
		log.info("(log)Controller.tMemberDetail() end <<<");
		
		//return "cg/visit/rsvDetailModal";
		return jObj;
	}
	
	
	@RequestMapping(value="/ttUpdate", method=RequestMethod.POST)
	public String ttUpdate(@ModelAttribute TMemberVO tvo, Model model, HttpServletRequest request) {
		log.info("(log) Controller.ttUpdate START");
		String uploadPath = FilePath.SSM_FILEPATH;
		int size = 10* 1024*1024;
		String url = "";
		try{
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
			String ttName =multi.getParameter("ttName");
			String ttGender =multi.getParameter("ttGender");
			String sjtCode =multi.getParameter("sjtCode");				
			String ttId =multi.getParameter("ttId");
			String ttPw =multi.getParameter("ttPw");
			String ttPn =multi.getParameter("ttPn");
			String ttGrade =multi.getParameter("gradeId");
			String ttClass =multi.getParameter("classId");
			String ttEmail =multi.getParameter("ttEmail");
			Enumeration jfiles = multi.getFileNames();
			String ttImage =(String)jfiles.nextElement();			
			String imagefilename = multi.getFilesystemName(ttImage);

			log.info("(log) ttName >>> : " + ttName);
			log.info("(log) ttGender >>> : " + ttGender);
			log.info("(log) classId >>> : " + ttClass);
			log.info("(log) ttGrade1 >>> : " + ttGrade);
			if(ttGrade.equals("01")){ttGrade ="FM";}
			else if(ttGrade.equals("02")){ttGrade ="JR";}
			else{ttGrade ="SR";}
			log.info("(log) ttGrade2 >>> : " + ttGrade);
			TMemberVO ttvo = new TMemberVO();
			ttvo.setTtName(ttName);
			ttvo.setTtPn(ttPn);
			ttvo.setTtId(ttId);
			ttvo.setTtPw(ttPw);
			ttvo.setSjtCode(sjtCode);
			ttvo.setTtGrade(ttGrade);
			ttvo.setTtClass(ttClass);
			ttvo.setTtEmail(ttEmail);
			ttvo.setTtImage(imagefilename);
			
			String resultStr="";
			int result = adminService.ttUpdate(tvo);
			log.info("(log)tmemberService.ttUpdate(param)>>>" +result );
			
			if(result >0){ 
				resultStr="등록 완료"; 
				url="forward:/admin/listTMemberAll.ssm";
			}else{
				 resultStr = "등록실패";
				 url="forward:/admin/listTMemberAll.ssm";
			}
			
			log.info("resultStr" + resultStr);
			model.addAttribute("result",resultStr);

			log.info("(log) Controller.ttUpdate END");
			
			
		}catch(Exception e){
			log.info("에러가 >>> : " + e );
		}
		return url;	
	}//ttUpdate
	
	
	
	

	
	@ResponseBody
	@RequestMapping(value="/{ttNo}.ssm",method = {RequestMethod.PUT, RequestMethod.PATCH,RequestMethod.POST})
	public ResponseEntity<String> ttDelete(@PathVariable("ttNo") String ttNo, @RequestBody TMemberVO tvo){
		log.info("ttDelete 호출성공");
		log.info("ttDelete>>: " + ttNo);
		ResponseEntity<String> entity = null;
		
		try{
			tvo.setTtNo(ttNo);
			int result = adminService.ttDelete(tvo);
			log.info(">>>>"+result);

			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
}
