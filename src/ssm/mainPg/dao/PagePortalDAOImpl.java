package ssm.mainPg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.mainPg.vo.PagePortalVO;

@Repository
public class PagePortalDAOImpl implements PagePortalDAO{
	
	@Autowired
	private SqlSession session;
	
	
	public List<PagePortalVO> npPortal(PagePortalVO ppvo){
		return session.selectList("npPortal");
	}
	
	@Override
	public List<PagePortalVO> nbPortal(PagePortalVO ppvo) {
		
		return session.selectList("nbPortal");
	}

}
