package ssm.mi.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;



import ssm.mi.vo.TMemberVO;


public class TMemberDaoImpl implements TMemberDao{

	@Autowired
	private SqlSession session;

	
	@Override
	public TMemberVO ajaxIdCheck(TMemberVO tvo) {
		TMemberVO tmvo = session.selectOne("ajaxIdCheck");
		return tmvo;
	}
	
	@Override
	public int joinTMember(TMemberVO param) {
		int i = (int)session.insert("joinTMember");
		return i;
	}

	@Override
	public TMemberVO joinTMemberCheck(TMemberVO param) {
		TMemberVO tmvo = session.selectOne("joinTMemberCheck");
		return tmvo;
	}

}
