package ssm.cg.paging;

import org.apache.log4j.Logger;

import ssm.cg.common.vo.CommonVO;
import ssm.cg.common.vo.oaCommonVO;
import ssm.cg.vo.VisitCounsel_EduRsvVO;

public class Paging {
	
	static Logger logger = Logger.getLogger(Paging.class);
	
	public static void setPage(CommonVO cvo){
		
		logger.info("(log)Paging.setPage() start >>>");

		// 0이 들어올 경우
		if(cvo.getPage()==0) cvo.setPage(1);
		if(cvo.getPageSize()==0) cvo.setPageSize(10);
		
		int page = cvo.getPage();
		int pageSize = cvo.getPageSize();
		
		int startRow = (page - 1) * pageSize + 1; 
		int endRow = (page - 1) * pageSize + pageSize;
		
		cvo.setStartRow(startRow+"");
		cvo.setEndRow(endRow+"");
		
		
		logger.info("(log)Paging.setPage() end <<<");
		
		//return cvo;
	} 
	
public static void oaSetPage(oaCommonVO cvo){
		
		logger.info("(log)Paging.setPage() start >>>");

		// 0이 들어올 경우
		if(cvo.getPage()==0) cvo.setPage(1);
		if(cvo.getPageSize()==0) cvo.setPageSize(10);
		
		int page = cvo.getPage();
		int pageSize = cvo.getPageSize();
		
		int startRow = (page - 1) * pageSize + 1; 
		int endRow = (page - 1) * pageSize + pageSize;
		
		cvo.setStartRow(startRow+"");
		cvo.setEndRow(endRow+"");
		
		
		logger.info("(log)Paging.setPage() end <<<");
		
		//return cvo;
	} 
	
} // Paging
