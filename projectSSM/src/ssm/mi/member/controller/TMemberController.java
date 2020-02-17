package ssm.mi.member.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.common.utils.ChaebunClass;
import ssm.common.utils.FilePath;
import ssm.mi.member.service.TMemberService;
import ssm.mi.member.vo.TMemberVO;

@Controller
@RequestMapping(value = "/tMember")
public class TMemberController {
	private static final String CONTEXT_PATH = "tMember";
	Logger log = Logger.getLogger(TMemberController.class);
	
	@Autowired
	private TMemberService 	tmemberService;

	
	/*관리자의 교사 정보 전체조회*/
	@RequestMapping(value="/listTMember",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listTMember(@ModelAttribute TMemberVO param){
		log.info("START");
		
		List<TMemberVO> list = tmemberService.listTMember(param);
		log.info("list>>> : " + list);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("tmemberList",list);
		mav.setViewName(CONTEXT_PATH+"/tMember");
		
		log.info("(log) return : mav >>>" +mav);
		return mav;
	}
	
	//관리자글쓰기폼
	@RequestMapping(value="/insertFormTMember", method=RequestMethod.GET)
	public String tMemInsertForm(){
		log.info("tMemInsertForm 호출 성공");
		return "tMember/tMemInsertForm";
	}
	
	//관리자교사정보입력
	@RequestMapping(value="/tMemberInsert", method=RequestMethod.POST)
	public String tMemberInsert(@ModelAttribute TMemberVO tvo){
		log.info("boardInsert 호출 성공");
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
			TMemberVO pvo = tmemberService.selectChaebun(tgcode);
			String chNo = pvo.getTtNo();
			log.info("(log)Controller_chNo >> : " +chNo);
			
			//문자열붙이기
			tmvo.setTtNo(chNo);
			tgcode = ChaebunClass.TchaeunNo2(tmvo);
			tmvo.setTtNo(tgcode);
			
			
//			String b_file =FileUploadUtil.fileUpload(bvo.getFile(), request);
//			tmvo.setB_file(b_file);
			result = tmemberService.tMemberInsert(tmvo);
		}
		
		if(result == 1){
			url = "/tMember/listTMember.ssm";
		}
		return "redirect:" + url;
	}//tMeminsert
	
	//교사 체크 폼
	@RequestMapping(value="/checkFormTMember")
	public String checkFormTMember(){
		log.info("/checkFormTMember 호출 성공");
		return "tMember/checkForm";
	}
		
	//교사 가입유무 조회
	@RequestMapping(value="/joinTMemCheck", method=RequestMethod.POST)
	public String joinTMemCheck(@ModelAttribute TMemberVO tmvo, Model model){
		System.out.println("/joinTMemCheck 호출 성공");
		String url = "";
//		System.out.println("tmvo.getTtName()"+tmvo.getTtName());
//		System.out.println("tmvo.getTtBirth()"+tmvo.getTtBirth());
//		System.out.println("tmvo.getTtGender()"+tmvo.getTtGender());
//		System.out.println("tmvo.getSjtCode()"+tmvo.getSjtCode());
//		System.out.println("tmvo.getTtPn()"+tmvo.getTtPn());
		
		TMemberVO tvo = tmemberService.joinTMemberCheck(tmvo);//joinCheck폼과 db정보 일치확인
//		System.out.println("controller tvo>>>" +tvo);
//		System.out.println("tvo.getSjtCode"+tvo.getSjtCode());
//		System.out.println("tvo.getTtId()"+tvo.getTtId());
		
		
		if(tvo != null){//일치 정보 있음
			String ttId = tvo.getTtId();
			log.info("ttId >> : " + ttId);
			if(ttId == null){ //일치하는 정보 있지만 가입은 안한 상태
				model.addAttribute("data", tvo);//joinCheck폼에 입력한 기본데이터를 가지고
				url="tMember/tMemJoinForm"; //회원가입jsp로 이동
			}else{//일치하는 정보있고 이미 가입한 상태
				url="tMemberLogin";//로그인페이지로 이동
			}
			
		}else{//일치하는 정보가 없음
			log.info("failed");
			model.addAttribute("mode","failed");//alert로 메세지를 가지고
			//url="forward:checkFormTMember.ssm";
			url="tMember/checkForm";//joinCheck폼으로 반환
		}
			
		return url;
	}	
	//교사 가입 폼
	@RequestMapping(value="/joinFormTMember", method=RequestMethod.GET)
	public String joinFormTMember(){
		log.info("/joinFormTMember 호출 성공");
		return "tMember/tMemJoinForm";
	}
	
	//교사가입
		@RequestMapping(value="/joinTMember", method=RequestMethod.POST)
		public ModelAndView joinTMember(@ModelAttribute TMemberVO tvo, HttpServletRequest request) {
			String uploadPath = FilePath.SSM_FILEPATH;
			int size = 10* 1024*1024;
			ModelAndView mav = new ModelAndView();
			try{
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "EUC-KR", new DefaultFileRenamePolicy());
				String ttName =multi.getParameter("ttName");
				String ttBirth =multi.getParameter("ttBirth");
				String ttGender =multi.getParameter("ttGender");
				String sjtCode =multi.getParameter("sjtCode");				
				String ttId =multi.getParameter("ttId");
				String ttPw =multi.getParameter("ttPw");
				String ttTransferyear =multi.getParameter("ttTransferyear");
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
				
				if(result >0) resultStr="등록 완료";
				else resultStr = "등록실패";
				
				mav.addObject("result", resultStr);
				mav.setViewName("/result");
				
				log.info("(log) return : mav >>>" +mav);
				log.info("(log) Controller.insertMember END");
				
				
			}catch(Exception e){
				System.out.println("에러가 >>> : " + e );
			}
			return mav;	

		}//tMeminsert
	
	
}//controller