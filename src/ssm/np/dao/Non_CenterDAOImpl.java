package ssm.np.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.np.vo.Non_CenterVO;

@Repository
public class Non_CenterDAOImpl implements Non_CenterDAO{

	@Autowired
	private SqlSession session;

	@Override
	public List<Non_CenterVO> nCenterList(Non_CenterVO ncvo) {
		List<Non_CenterVO> list= session.selectList("nCenterList");
		return list;
	}
	
	
}
