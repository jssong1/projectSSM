package ssm.cm.chaebun;

public class FamilyLetterChaebun {

	private static final String FL_STR = "FL";
	
	public static String flchaebun(String no){
		
		for(int i=no.length();i<4;i++){//1 ,2,3 3�� 
			no = "0" + no;
		}
		
		no = FL_STR + no;
		
		return no;
	}
	
}// end of ChaebunLesson class
