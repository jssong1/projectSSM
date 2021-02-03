package ssm.mi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;
import ssm.mi.vo.UserVO;

public class LoginDaoImpl implements LoginDao{
	@Autowired
	private SqlSession session;

	@Override
	public SMemberVO sloginCheck(SMemberVO svo) {
		SMemberVO smvo = session.selectOne("sloginCheck");
		return smvo;
	}

	@Override
	public TMemberVO tLoginCheck(TMemberVO tvo) {
		TMemberVO tmvo = session.selectOne("tLoginCheck");
		return tmvo;
	}
}
