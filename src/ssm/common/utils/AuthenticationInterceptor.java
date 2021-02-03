package ssm.common.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 



import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import ssm.cg.controller.Online_CommentController;
 
/*로그인처리를 담당하는 인터셉터*/
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	Logger logger = Logger.getLogger(AuthenticationInterceptor.class);
	
	/* preHandle() : 컨트롤러보다 먼저 수행되는 메서드*/
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	logger.info("(log) AuthenticationInterceptor START");
    	/* session 객체를 가져옴*/
        HttpSession session = request.getSession();
        /* login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴*/
        logger.info("(log)isLogOn Check>>>" + request.getSession().getAttribute("isLogOn"));
         
        if ( request.getSession().getAttribute("isLogOn") ==null ){
        	logger.info("(log)NOTLogOn >>>");
        	response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter();
        	out.println("<script> location.href='/main_1.jsp';alert('로그인을 해야합니다.'); </script>");
        	out.flush();
            return false;// 더이상 컨트롤러 요청으로 가지 않도록false로 반환함*/
        }
         
        /* preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
                     따라서 true로 하면 컨트롤러 uri로 가게 됨.*/
        return true;
    }
 
 /* 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드*/
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
     
}


