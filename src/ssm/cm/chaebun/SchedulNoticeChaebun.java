package ssm.cm.chaebun;

public class SchedulNoticeChaebun {

	private static final String SN_STR = "SN";
	
	public static String snchaebun(String no){
		
		for(int i=no.length();i<4;i++){//1 ,2,3 3 
			no = "0" + no;
		}
		
		no = SN_STR + no;
		
		return no;
	}
	
}// end of ChaebunLesson class
