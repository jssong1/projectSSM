package ssm.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

public class GR_Chaebun {
	static Logger log = Logger.getLogger(GR_Chaebun.class);
	public final static String GR_PREFIX_FM = "FM";
	public final static String GR_PREFIX_JR = "JR";
	public final static String GR_PREFIX_SR = "SR";
	
	public static String chaebun(int chaebun,String grade){
		
		String chae = chaebun+"";
		chae = "000"+chae;
		if(chae.length()>4){
			for(int j=0;j<chae.length();j++){
				if(chae.length()>4){
					chae=chae.substring(1);
				}else{
					break;
				}
			}
		}
		log.info("chae >>> : "+chae);
		
		Date year = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yy");
		String yearr = format.format(year);
		
		chae = yearr+chae;
		if(grade.equals("FM")){
			chae = GR_PREFIX_FM+chae;
		}else if(grade.equals("JR")){
			chae = GR_PREFIX_JR+chae;
		}else{
			chae = GR_PREFIX_SR+chae;
		}
		
		log.info("chae >>> : "+chae);
		return chae;
	}
}
