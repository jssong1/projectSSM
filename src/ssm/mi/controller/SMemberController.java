package ssm.mi.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.common.utils.UserSession;
import ssm.common.utils.GR_Chaebun;
import ssm.mi.service.SMemberService;
import ssm.mi.vo.BasicInformationVO;
import ssm.mi.vo.SMemberGrVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

@Controller
@RequestMapping("/smember")
public class SMemberController {
	public final String UPLOADPATH = "C:/java142/D/java142_Luna_ProjectSSM/Project_SSM/WebContent/images";
	Logger log = Logger.getLogger(SMemberController.class);
	
	@Autowired
	private SMemberService sMemberService;
	
//		 학생이 회원가입 버튼을 클릭 했을 때 성명,생년월일,휴대폰번호를 체크하는 폼으로가는 함수
//		@RequestMapping(value="/checkForm")
//		public String checkForm(){
//			log.info("checkForm() start");
//			
//			String url = "";
//			url= "member/checkForm";     
//			
//			log.info("checkForm() end");
//			return url;
//		}// end of checkForm()
		
		
//		사용자(학생)이 이름,생년월일을 입력하면 학생정보테이블에 있는 정보인지 체크하는 함수
		@RequestMapping(value="/checkInfo",method=RequestMethod.POST)
		public String checkInfo(@ModelAttribute SMemberVO smvo,Model model){
			log.info("checkInfo() start"); 
			log.info("smvo.getSsName() >>> : "+smvo.getSsName());
			log.info("smvo.getSsBirth() >>> : "+smvo.getSsBirth());
			log.info("smvo.getSsPn() >>> : "+smvo.getSsPn());
			String url = "";                             // select 여부에 따라 url이 바뀜
			SMemberVO svo  = sMemberService.checkInfo(smvo);  // 학생정보확인 DB갔다오기
			log.info("svo >>> : "+svo);
			if(svo != null){
				String ssId = svo.getSsId();
				String ssA = svo.getSsAuthority(); // 가입승인 대기중인지 확인
				if(ssId != null && ssId.length() > 0){					// 학생정보가 확인되면 가입되어 있는지 체크하고
					if(ssA.equals("Y")){
						model.addAttribute("alert","가입승인 대기중입니다.");
						url = "member/signCheck";
					}else{
						model.addAttribute("alert","이미 가입된 회원입니다.");    // 가입되어 있으면 문자열을 가지고 checkForm으로 리턴
						url="redirect:../main_1.jsp";
					}
				}else{
//					SMemberGrVO mg = SMemberService.checkFM_Member(svo);     // 1학년테이블 조회 
//					String gr = "fm";
//					if(mg == null){ 
//							  mg = SMemberService.checkJR_Member(svo);      // 2학년테이블 조회
//							  gr = "jr";
//						if(mg == null){
//							  mg = SMemberService.checkSR_Member(svo);      // 3학년테이블 조회
//							  gr = "sr";
//						}
//					}
//					model.addAttribute(gr, mg);                         // 회원정보는 확인되지만 가입되어 있지 않으면
					model.addAttribute("data", svo);                    // 학번, 이름, 생년월일, 성별, 휴대폰번호를 가지고					
					url = "member/sMemberJoinForm";                          // insertForm으로 간다.
				}											 	               
			}else{
				log.info("failed");
				model.addAttribute("mode","failed");//alert로 메세지를 가지고
				url="member/joinCheckForm";//joinCheck폼으로 반환                           
			}
			
			log.info("checkInfo() end");
			return url;
		}// end of checkInfo()
		
		// 아이디 중복체크 함수
		@RequestMapping("ajaxIdCheck")
		public ResponseEntity ajaxIdCheck(@RequestParam("ssId") String ssId,Model model){
			log.info("ajaxIdCheck() start");
			log.info("ssId >>> : "+ssId);
			ssId = ssId.toUpperCase().trim();
			log.info("ssId >>> : "+ssId);
			ResponseEntity entity = null;
			SMemberVO svo = null;
			svo = new SMemberVO();

			try{
				svo.setSsId(ssId);
				SMemberVO smvo = sMemberService.ajaxIdCheck(svo);
				if(smvo != null && smvo.getSsId() != null){
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
		
		// 사용자(학생)가 가입신청 했을 때 테이블에 정보를 입력하는 함수
		@RequestMapping(value="/joinSMember")
		public String insertInfo(HttpServletRequest request,Model model){
			log.info("insertInfo() start");
			String uploadPath = UPLOADPATH;
			int size = 10*1024*1024;
			try{
				MultipartRequest mt = new MultipartRequest(request,
														   uploadPath,
														   size,
														   "UTF-8",
														   new DefaultFileRenamePolicy());
				
				String ssImage = mt.getFilesystemName("ssImage");
				String ssNo = mt.getParameter("ssNo");
				String ssId = mt.getParameter("ssId");
				String ssPw = mt.getParameter("ssPw");
				String ssGender = mt.getParameter("ssGender");
				String ssEmail = mt.getParameter("ssEmail");
				String grGrade = mt.getParameter("grGrade");
				String grClass = mt.getParameter("grClass");
				String grNum = mt.getParameter("grNum");
				
				log.info("ssImage >>> : "+ssImage);
				log.info("ssNo >>> : "+ssNo);
				log.info("ssId >>> : "+ssId);
				log.info("ssPw >>> : "+ssPw);
				log.info("ssEmail >>> : "+ssEmail);
				log.info("grGrade >>> : "+grGrade);
				log.info("grClass >>> : "+grClass);
				log.info("grNum >>> : "+grNum);
				
				SMemberVO smvo = null;
				smvo = new SMemberVO();
				
				smvo.setSsImage(ssImage);
				smvo.setSsNo(ssNo);
				smvo.setSsId(ssId);
				smvo.setSsPw(ssPw);
				smvo.setSsGender(ssGender);
				smvo.setSsEmail(ssEmail);
				smvo.setSsGrade(grGrade);
				int result = sMemberService.insertInfo(smvo);
				log.info("result >>> : "+result);
				SMemberGrVO sgvo = null;
				sgvo = new SMemberGrVO();
				
				if(grGrade.equals("FM")){
					log.info("FM >>> ");
					sgvo.setFmGrade(grGrade);
					sgvo.setFmClass(grClass);
					sgvo.setFmNum(grNum);
					sgvo.setSsNo(ssNo);
					log.info("grade : "+grGrade+" class : "+grClass+" num : "+grNum+" ssNo : "+ssNo);
					int chaebun = sMemberService.chaebunGr(sgvo);
					String fmNo = GR_Chaebun.chaebun(chaebun,"FM");
					sgvo.setFmNo(fmNo);
					
					TMemberVO tvo = sMemberService.teacherInfo(sgvo);
					String fmTeacher = tvo.getTtNo();
					sgvo.setTtNo(fmTeacher);
					int result2 = sMemberService.insertGr(sgvo);
					log.info("result2 >>> : "+result2);
				}else if(grGrade.equals("JR")){
					log.info("JR >>> ");
					sgvo.setJrGrade(grGrade);
					sgvo.setJrClass(grClass);
					sgvo.setJrNum(grNum);
					sgvo.setSsNo(ssNo);
					log.info("grade : "+grGrade+" class : "+grClass+" num : "+grNum+" ssNo : "+ssNo);
					
					int chaebun = sMemberService.chaebunGr(sgvo);
					String jrNo = GR_Chaebun.chaebun(chaebun,"JR");
					sgvo.setJrNo(jrNo);
					
					TMemberVO tvo = sMemberService.teacherInfo(sgvo);
					String jrTeacher = tvo.getTtNo();
					log.info("teacher >>> : "+jrTeacher);
					sgvo.setTtNo(jrTeacher);
					int result2 = sMemberService.insertGr(sgvo);
					log.info("result2 >>> : "+result2);
				}else{
					log.info("SR >>> ");
					sgvo.setSrGrade(grGrade);
					sgvo.setSrClass(grClass);
					sgvo.setSrNum(grNum);
					sgvo.setSsNo(ssNo);
					log.info("grade : "+grGrade+" class : "+grClass+" num : "+grNum+" ssNo : "+ssNo);
					
					int chaebun = sMemberService.chaebunGr(sgvo);
					String srNo = GR_Chaebun.chaebun(chaebun,"SR");
					sgvo.setSrNo(srNo);
					
					TMemberVO tvo = sMemberService.teacherInfo(sgvo);
					String srTeacher = tvo.getTtNo();
					sgvo.setTtNo(srTeacher);
					int result2 =  sMemberService.insertGr(sgvo);
					log.info("result2 >>> : "+result2);
				}
				
			}catch(Exception e){
				log.info("오류>>> : "+e.getMessage());
				e.printStackTrace();
			}
			
			
			
			log.info("insertInfo() end");
			return "mainForm";
		}// end of insertInfo
		
	
		// 가입승인 페이지로 가는 함수
		@RequestMapping(value="/approveForm")
		public String approveForm(Model mod){
			log.info("approveForm() start"); 
			
			List<SMemberVO> list = sMemberService.smListAll();
			mod.addAttribute("list", list);
			String url = "/admin/approveForm";
			
			log.info("approveForm() end");
			return url;
		}
		//기초조사 페이지로 가는함수
		@RequestMapping("basicInformation")
		public String basicInformation(HttpServletRequest request,Model model){
			log.info("basicInformation() start");
			String sessionNO        = "";
			List list               = null;
			BasicInformationVO bivo = null;
			SMemberVO svo           = null;
			String isud             = "";
			String url              = "";
			isud = request.getParameter("ISUD_TYPE");
			try {
				sessionNO = UserSession.getSessionNO(request);
				bivo = new BasicInformationVO();
				bivo.setSsNo(sessionNO);
				list = sMemberService.basicInformation(bivo);
				if(list != null && list.size() > 0){
					model.addAttribute("list",list);
					if(isud != null){
						url = "BI/BIInsert";
					}else{
						url = "BI/basicInformation";
					}
				}else{
					svo = new SMemberVO();
					svo.setSsNo(sessionNO);
					SMemberVO svo2 = sMemberService.selectPn(svo);
					model.addAttribute("svo", svo2);
					model.addAttribute("ssNo", sessionNO);
					if(isud != null){
						url = "BI/BIInsert";
					}else{
						url = "BI/basicInformation";
					}
				}
				
			} catch (Exception e) {
				log.info("error >>> : "+e.getMessage());
			}
			log.info("model >>> : "+model);
			log.info("basicInformation() end");
			return url;
		}
		
		// 기초조사 정보 insert or update함수
		@RequestMapping("/BIInsert")
		public String BIInsert(@ModelAttribute BasicInformationVO bivo,HttpServletRequest req, Model model){
			log.info("BIInsert() start");
			String isud = "";
			String url  = "";
			List list   = null;
			isud = req.getParameter("ISUD_TYPE");
			log.info("isud >>> : "+isud);
			if(isud.equals("U")){
				int result = sMemberService.BIUpdate(bivo);
				
			}else if(isud.equals("I")){
				String biChaebun = sMemberService.biChaebun();
				biChaebun = "000"+biChaebun;
				if(biChaebun.length()>4){
					for(int j=0;j<biChaebun.length();j++){
						if(biChaebun.length()>4){
							biChaebun=biChaebun.substring(1);
						}else{
							break;
						}
					}
				}
				biChaebun = "BI"+biChaebun;
				log.info("biChaebun >>> : "+biChaebun);
				bivo.setBiNo(biChaebun);
				int result = sMemberService.BIInsert(bivo);
			}
			list = sMemberService.basicInformation(bivo);
			model.addAttribute("list",list);
			url = "BI/basicInformation";
			
			log.info("BIInsert() end");
			return url;
		}


}
