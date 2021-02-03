package ssm.cg.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Session {

	private static final String SESSION_ID = "ID";
	
	public boolean killSession(final HttpServletRequest hReq){
			
		if (hReq == null) return false;
			
		try{
			HttpSession hSession = hReq.getSession(true);
			hSession.invalidate();
		}catch(Exception e){
			throw e;
		}
		
		return true;
	}
	
	public boolean setSession(final HttpServletRequest hReq, final String userID) {
		
		if (hReq == null) return false;
		if (userID == null || userID.trim().length() == 0) return false;
		
		HttpSession hSession = hReq.getSession(true);
		
		try{	
			hSession.setAttribute(SESSION_ID, userID);		            
		}catch(Exception e){
			throw e;
		}
		
		return true;
	}
	
	public String getSession(final HttpServletRequest hReq){

		if (hReq == null) return "";
		
		String strSession;
		
		HttpSession hSession = hReq.getSession(false);
		
		try{	
			strSession = (String)hSession.getAttribute(SESSION_ID);			
		}catch(Exception e){
			throw e;
		}
		
		return strSession;
	}	
}