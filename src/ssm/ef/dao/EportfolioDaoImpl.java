package ssm.ef.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import ssm.br.vo.NonprogramVO;
import ssm.cd.vo.CareerdesignVO;
import ssm.cd.vo.ValuesettingVO;
import ssm.cg.vo.OnlineApplication_BoardVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

public class EportfolioDaoImpl implements EportfolioDao {

	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<SMemberVO> eflist(TMemberVO tvo) {
		// TODO Auto-generated method stub
		return session.selectList("eflist");
	}

	@Override
	public List<CareerdesignVO> cdlist(SMemberVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("cdlist");
	}

	@Override
	public List<NonprogramVO> brlist(SMemberVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("brlist");
	}

	@Override
	public List<OnlineApplication_BoardVO> cglist(SMemberVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("cglist");
	}

	@Override
	public ValuesettingVO vslist(SMemberVO svo) {
		// TODO Auto-generated method stub
		return session.selectOne("vslist");
	}
	
	@Override
	public SMemberVO mylist(SMemberVO svo) {
		// TODO Auto-generated method stub
		return session.selectOne("mylist");
	}
	

}
