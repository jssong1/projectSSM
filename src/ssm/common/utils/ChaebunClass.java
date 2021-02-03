package ssm.common.utils;

import org.apache.log4j.Logger;

import ssm.cg.controller.Edu_ScheduleController;
import ssm.mi.vo.TMemberVO;



public class ChaebunClass {
	 static Logger logger = Logger.getLogger(ChaebunClass.class);
	
	public static final String JAVA_GUBUN_T = "T";
	public static final String JAVA_GUBUN_VR = "VR";
	public static final String JAVA_GUBUN_OC = "OC";
	
	
	public static String commNum(String commNO){
		logger.info("(log) ChaebunClass() START----------- ");
		logger.info("(log) commNO >>>> : " + commNO);
		if (1 == commNO.length()){
			commNO = "000" + commNO;			
		}
		if (2 == commNO.length()){
			commNO = "00" + commNO;
		}	
		if (3 == commNO.length()){
			commNO = "0" + commNO;
		}			
		logger.info("(log) 맥스값에서 자리수채우기 chNO >>>> : " + commNO);
		return commNO;
	}
	//전입년도 자르기
	private static String transferyear(String ttTransferyear) {
		logger.info("ttTransferyear >>> : " +ttTransferyear);
		String transferyearnum = ttTransferyear.substring(2);
		logger.info("transferyearnum>>>: " +transferyearnum);
		return transferyearnum;
	}
	//성별...다시
	private static int gender(String ttGender) {
		logger.info("ttGender >> : " + ttGender);
		int genderNum;
		
		if (ttGender.equals("F")){
			genderNum = 7;
		}else{
			genderNum = 8;
		}		
		
		logger.info("genderNum>>>>: " +genderNum);
		return genderNum;
	}
	public static String TchaeunNo1(TMemberVO tmvo) {
		logger.info("(log) ChaebunClass()TchaeunNo1_tmvo? >>> : " +tmvo.getTtGender());
		logger.info("(log) ChaebunClass()TchaeunNo1_tmvo? >>> : " +tmvo.getTtTransferyear());
		
		String chNo1 = 
				tmvo.getTtGender()
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
				tmvo.getTtGender()
				+ChaebunClass.transferyear(tmvo.getTtTransferyear())
				+ChaebunClass.commNum(tmvoNo);
		
		
		logger.info("(log) ChaebunClass()TchaeunNo2 chNo>>> : "+chNo1);
		return chNo1;
	}
	
	//vr채번
	public static String VRchaeunNo(String chNo){
		logger.info("(log) ChaebunClass()_chNo? >>> : " +chNo);
		chNo = JAVA_GUBUN_VR +  ChaebunClass.commNum(chNo);
		logger.info("(log) �������� ���� chNo >>>> : " + chNo);
		logger.info("(log) ChaebunClass() END----------- ");
		return chNo;
	}
	//oc채번
		public static String OCchaeunNo(String chNo){
			logger.info("(log) ChaebunClass()_chNo? >>> : " +chNo);
			chNo = JAVA_GUBUN_OC +  ChaebunClass.commNum(chNo);
			logger.info("(log) �������� ���� chNo >>>> : " + chNo);
			logger.info("(log) ChaebunClass() END----------- ");
			return chNo;
		}
	
	
}
