package ssm.common.utils;

import ssm.mi.member.vo.TMemberVO;

public class ChaebunClass {
	public static final String JAVA_GUBUN_T = "T";
	
	public static String commNum(String commNO){
		System.out.println("(log) ChaebunClass() START----------- ");
		System.out.println("(log) commNO >>>> : " + commNO);
		if (1 == commNO.length()){
			commNO = "000" + commNO;			
		}
		if (2 == commNO.length()){
			commNO = "00" + commNO;
		}	
		if (3 == commNO.length()){
			commNO = "0" + commNO;
		}			
		System.out.println("(log) 맥스값에서 자리수채우기 chNO >>>> : " + commNO);
		return commNO;
	}

	private static String transferyear(String ttTransferyear) {
		System.out.println("ttTransferyear >>> : " +ttTransferyear);
		String transferyearnum = ttTransferyear.substring(2);
		System.out.println("transferyearnum>>>: " +transferyearnum);
		return transferyearnum;
	}

	private static int gender(String ttGender) {
		System.out.println("ttGender >> : " + ttGender);
		int genderNum;
		
		if (ttGender.equals("F")){
			genderNum = 7;
		}else{
			genderNum = 8;
		}		
		
		System.out.println("genderNum>>>>: " +genderNum);
		return genderNum;
	}
	public static String TchaeunNo1(TMemberVO tmvo) {
		System.out.println("(log) ChaebunClass()TchaeunNo1_tmvo? >>> : " +tmvo.getTtGender());
		System.out.println("(log) ChaebunClass()TchaeunNo1_tmvo? >>> : " +tmvo.getTtTransferyear());
		
		String chNo1 = 
				ChaebunClass.gender(tmvo.getTtGender())
				+ChaebunClass.transferyear(tmvo.getTtTransferyear());
				
		
		System.out.println("(log) ChaebunClass()TchaeunNo1 chNo>>> : "+chNo1);
		return chNo1;
		}
	
	public static String TchaeunNo2(TMemberVO tmvo) {
		System.out.println("(log) ChaebunClass()TchaeunNo2_tmvo? >>> : " +tmvo.getTtNo());
		System.out.println("(log) ChaebunClass()TchaeunNo2_tmvo? >>> : " +tmvo.getTtGender());
		System.out.println("(log) ChaebunClass()TchaeunNo2_tmvo? >>> : " +tmvo.getTtTransferyear());
		
		String tmvoNo=tmvo.getTtNo();
		String chNo1;
		
	
		chNo1 = JAVA_GUBUN_T+
				ChaebunClass.gender(tmvo.getTtGender())
				+ChaebunClass.transferyear(tmvo.getTtTransferyear())
				+ChaebunClass.commNum(tmvoNo);
		
		
		System.out.println("(log) ChaebunClass()TchaeunNo2 chNo>>> : "+chNo1);
		return chNo1;
	}
}
