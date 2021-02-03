package ssm.mi.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.common.utils.ChaebunClass;
import ssm.common.utils.FilePath;
import ssm.mi.service.TMemberService;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

@Controller
@RequestMapping(value = "/tMember")
public class TMemberController {
	private static final String CONTEXT_PATH = "member";
	Logger log = Logger.getLogger(TMemberController.class);
	
	@Autowired
	private TMemberService 	tmemberService;
		
	//교사 가입유무 조회
	@RequestMapping(value="/joinTMemCheck", method=RequestMethod.POST)
	public String joinTMemCheck(@ModelAttribute TMemberVO tmvo, Model model){
		System.out.println("/joinTMemCheck ȣ�� ����");
		String url = "";
		TMemberVO tvo = tmemberService.joinTMemberCheck(tmvo);//joinCheck폼과 db정보 일치확인
				
		if(tvo != null){//일치 정보 있음
			String ttId = tvo.getTtId();
			String ttA = tvo.getTtAuthority(); // 가입승인 대기중인지 확인
			
			if(ttId != null && ttId.length() > 0){		//일치하는 정보있고 이미 가입한 상태
				if(ttA.equals("Y")){
					model.addAttribute("alert","가입승인 대기중입니다.");
					url = "member/signCheck";

				}else{ 
					model.addAttribute("alert","이미 가입된 회원입니다.");    // 가입되어 있으면 문자열을 가지고 checkForm으로 리턴
					url="redirect:../main_1.jsp";
				}
			}else{ //일치하는 정보 있지만 가입은 안한 상태
				model.addAttribute("data", tvo);                    // 학번, 이름, 생년월일, 성별, 휴대폰번호를 가지고					
				url = "member/tMembJoinForm"; 
			}
			
		}else{//일치하는 정보가 없음
			log.info("failed");
			model.addAttribute("mode","failed");//alert로 메세지를 가지고
			url="member/joinCheckForm";//joinCheck폼으로 반환
		}
			
		return url;
	}	
	
	
	//교사 가입 폼
		@RequestMapping(value="/joinFormTMember", method=RequestMethod.GET)
		public String joinFormTMember(){
			log.info("/joinFormTMember 호출 성공");
			return "member/tMemJoinForm";
		}
	
	// 아이디 중복체크 함수
		@RequestMapping("ajaxIdCheck")
		public ResponseEntity ajaxIdCheck(@RequestParam("ttId") String ttId,Model model){
			log.info("ajaxIdCheck() start");
			log.info("ttId >>> : "+ttId);
			ttId = ttId.toUpperCase().trim();
			log.info("ttId >>> : "+ttId);
			ResponseEntity entity = null;
			TMemberVO tvo = null;
			tvo = new TMemberVO();

			try{
				tvo.setTtId(ttId);
				TMemberVO tmvo = tmemberService.ajaxIdCheck(tvo);
				if(tmvo != null && tmvo.getTtId() != null){
					entity = new ResponseEntity("false",HttpStatus.OK);
				}else{
					entity = new ResponseEntity("true",HttpStatus.OK);
				}
				
			}catch(Exception e){
				log.info("error >>> : "+e.getMessage());
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			
			log.info("ajaxIdCheck() end");
			return entity;
		}// end of ajaxIdCheck()
	
		//교사가입
		@RequestMapping(value="/joinTMember", method=RequestMethod.POST)
		public String joinTMember(@ModelAttribute TMemberVO tvo, Model model, HttpServletRequest request) {
			String uploadPath = FilePath.SSM_FILEPATH;
			int size = 10* 1024*1024;
			String url = "";
			try{
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
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
				int result = tmemberService.joinTMember(ttvo);
				log.info("(log)tmemberService.joinTMember(param)>>>" +result );
				
				if(result >0){ 
					resultStr="등록 완료"; 
					url="forward:/admin/listTMemberY.ssm";
				}else{
					 resultStr = "등록실패";
					 url="member/tMemJoinForm";
				}
				
				
				log.info("resultStr" + resultStr);
				model.addAttribute("result",resultStr);

				log.info("(log) Controller.insertMember END");
				
				
			}catch(Exception e){
				log.info("에러가 >>> : " + e );
			}
			return url;	
		}//tMeminsert

		
}//controller