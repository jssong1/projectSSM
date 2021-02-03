package ssm.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;



public class CodeTable {
	
	//코드번호를 코드네임으로 
	public static String ttAuthorityName(String ttAuthority) {
		System.out.println("ttGender >> : " + ttAuthority);
		String ttAuthorityName="";
		
		if (ttAuthority=="Y"){
			ttAuthorityName = "가입후 권한대기";
		}else if(ttAuthority=="Y"){
			ttAuthorityName = "";
		};	
		
		return ttAuthorityName;
	}
	
	
	//vrDate
	public static String vrDate(String vrDate) {
 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREAN);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 MM월 dd일 EEEE",Locale.KOREAN);
		
		
		if(vrDate.contains("년")){
			try {
				Date date = sdf2.parse(vrDate);
				vrDate = sdf.format(date);
				System.out.println("codeT vrDate1>>>>: " + vrDate);
			}catch(Exception e){
				e.printStackTrace();
			}		
		}else{
			try {
				Date date = sdf.parse(vrDate);
				vrDate = sdf2.format(date);
			}catch(Exception e){
				e.printStackTrace();
			}	
		}
		return vrDate;
	}
	
	
}
