package ssm.mainPg.service;


import java.util.List;

import ssm.mainPg.vo.PagePortalVO;

public interface PagePortalService {

	public List<PagePortalVO> npPortal(PagePortalVO ppvo);
	public List<PagePortalVO> nbPortal(PagePortalVO ppvo);

}
