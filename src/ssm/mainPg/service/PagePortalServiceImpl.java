package ssm.mainPg.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mainPg.dao.PagePortalDAO;
import ssm.mainPg.vo.PagePortalVO;

@Transactional
@Service
public class PagePortalServiceImpl implements PagePortalService {
	
	Logger logger = Logger.getLogger(PagePortalServiceImpl.class);
	
	@Autowired
	private PagePortalDAO pagePortalDAO;

	public List<PagePortalVO> npPortal(PagePortalVO ppvo){
		
		logger.info("(log)Service start >>>");
		
		List<PagePortalVO> npList = pagePortalDAO.npPortal(ppvo);
		logger.info("(log)Service end <<<");
		
		return npList;
		
	}

	@Override
	public List<PagePortalVO> nbPortal(PagePortalVO ppvo) {
		
		logger.info("(log)Service start >>>");
	
		List<PagePortalVO> nbList = pagePortalDAO.nbPortal(ppvo);
		
		logger.info("(log)Service end <<<");
	
		return nbList;
	}
}
