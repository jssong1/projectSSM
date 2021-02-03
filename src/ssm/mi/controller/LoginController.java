package ssm.mi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ssm.common.utils.UserSession;
import ssm.mi.service.LoginService;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;
import ssm.mi.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class LoginController {
   private static final String CONTEXT_PATH = "common";
   Logger log = Logger.getLogger(TMemberController.class);
   
   @Autowired
   private LoginService loginService;
   
   //로그인,회원가입 페이지로 가는 함수
   @RequestMapping(value="/loginForm")
   public String loginForm(){
      log.info("(log)loginForm() start >>>");
      String url = "";
      url = "/member/loginForm";            
      log.info("(log)loginForm() end <<<");
      return url;
   }// end of loginForm()

   //로그인
   @RequestMapping("/loginCheck")
   public String loginCheck(@ModelAttribute UserVO uvo, Model model
         ,HttpServletRequest req){
      log.info("(log)  loginCheck() start >>>"); 
      String url = "";
      String authority = uvo.getUserAuthority();
      
      // userAuthority선택이 'S'
      if(authority.equals("S")){       
         SMemberVO svo = null;
         svo = new SMemberVO();
         
         String ssId = uvo.getUserId();
         String ssPw = uvo.getUserPw();
         svo.setSsId(ssId);
         svo.setSsPw(ssPw);
         
         SMemberVO smvo = loginService.sloginCheck(svo);
         
         if(smvo == null){
            log.info("(log) smvo is null"); 
            model.addAttribute("result","failed");
            String message="아이디나 비밀번호가 일치하지 않습니다. 다시 로그인해주세요";
            model.addAttribute("message", message);
            url = "result";
         }else{
            if(smvo.getSsAuthority().equals("Y")){
               log.info("(log) smvo Authority Y"); 
               model.addAttribute("result","failed");
               String message="가입승인 대기중입니다";
               model.addAttribute("message", message);
               model.addAttribute("dataS", smvo);
               url = "result";
            }else{
               log.info("(log) login success"); 
               model.addAttribute("result","success");
               String id = smvo.getSsId();
               String no = smvo.getSsNo();
               String au = smvo.getSsAuthority();
               String name = smvo.getSsName();
               
               //세션부여
               try {
                  //HttpSession session = req.getSession(true);
                  req.getSession().setAttribute("isLogOn","ok");
                  req.getSession().setAttribute("ssLoginOn","isLogOn");
                  UserSession.setSession(req, id, no, au , name);
               } catch (Exception e) {               
                  log.info("(log) error.controller >> " +e.getMessage());
               }
               url = "result";   
            }
         }
         
      // userAuthority선택이 'T'
      }else if(authority.equals("T")){ 
         TMemberVO tvo = null;
         tvo = new TMemberVO();
         String ttId = uvo.getUserId();
         String ttPw = uvo.getUserPw();
         tvo.setTtId(ttId);
         tvo.setTtPw(ttPw);
         TMemberVO tmvo = loginService.tLoginCheck(tvo);
         
         //로그인정보 불일치
         if(tmvo == null){
        	log.info("(log) tmvo is null");
            model.addAttribute("result","failed");
            String message="아이디나 비밀번호가 일치하지 않습니다. 다시 로그인해주세요";
            model.addAttribute("message", message);
            url = "redirect:../main_1.jsp";
         }else{
        	
        	//승인대기
            if(tmvo.getTtAuthority().equals("Y")){
            	log.info("(log) tmvo Authority Y");
            	model.addAttribute("result","failed");
            	String message="가입승인 대기중입니다";
            	model.addAttribute("message", message);
            	model.addAttribute("dataT", tmvo);
            	url = "result";
            
            //로그인 성공
            }else{
               log.info("(log) login success"); 
               model.addAttribute("result","success");
               String id = tmvo.getTtId();
               String no = tmvo.getTtNo();
               String au = tmvo.getTtAuthority();
               String name = tmvo.getTtName();
               try {
            	  //세션부여
                  req.getSession().setAttribute("isLogOn","ok");
                  req.getSession().setAttribute("ttLoginOn","isLogOn");
                  UserSession.setSession(req, id, no, au, name);
               } catch (Exception e) {               
                  log.info("(log) error.controller >> "+e.getMessage());
               }
               url = "result";
            }
         }
         
      //관리자 로그인
      }else if(authority.equals("A")){
         String adId = uvo.getUserId();
         String adPw = uvo.getUserPw();   
      }
      log.info("(log) loginCheck() end <<<");
      return url;
   }
   
   //로그아웃
   @RequestMapping("/logout")
   public String logout(HttpServletRequest req){
      try {
         UserSession.killSession(req);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "logout_result";
   }
   
   //회원가입여부확인
   @RequestMapping(value="/joinCheckForm")
   public String joinCheckForm(){
      log.info("(log) joinCheckForm() start >>>");
      String url = "";
      url = "member/joinCheckForm";            
      log.info("(log) joinCheckForm() end <<<");
      return url;
   }// end of joinCheckForm()
   
   //메인화면 이동
   @RequestMapping(value="/gomain")
   public String main(){
	   return "../main_1.jsp";            
   }// end of gomain
   
}