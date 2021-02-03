package ssm.mainPg.dao;

import java.util.List;

import ssm.mainPg.vo.PagePortalVO;

public interface PagePortalDAO {

	public List<PagePortalVO> npPortal(PagePortalVO ppvo);
	
	public List<PagePortalVO> nbPortal(PagePortalVO ppvo);

}

