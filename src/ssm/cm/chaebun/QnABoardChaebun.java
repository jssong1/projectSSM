package ssm.cm.chaebun;

public class QnABoardChaebun {

	private static final String QB_STR = "QB";
	
	public static String qbchaebun(String no){
		
		for(int i=no.length();i<4;i++){//1 ,2,3 3�� 
			no = "0" + no;
		}
		
		no = QB_STR + no;
		
		return no;
	}
	
}// end of ChaebunLesson class
