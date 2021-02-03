package ssm.mi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import ssm.mi.vo.TMemberVO;

public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<TMemberVO> listTMemberAll(TMemberVO param) {
		List<TMemberVO> list = session.selectList("listTMemberAll");
		return list;
	}
	@Override
	public List<TMemberVO> listTMemberN(TMemberVO param) {
		List<TMemberVO> list = session.selectList("listTMemberN");
		return list;
	}

	@Override
	public List<TMemberVO> listTMemberY(TMemberVO param) {
		List<TMemberVO> list = session.selectList("listTMemberY");
		return list;
	}
	@Override
	public TMemberVO selectChaebun(String tvo) {
		TMemberVO ttvo= (TMemberVO)session.selectOne("selectChaebun");
		return ttvo;
	}

	@Override
	public int tMemberInsert(TMemberVO tvo) {
		int i = (int)session.insert("tMemberInsert");
		return i;
	}
	
	
	@Override
	public int tMemberYUpdate(TMemberVO tvo) {
		int i = (int)session.insert("tMemberYUpdate");
		return i;
	}
	@Override
	public TMemberVO tMemberDetail(TMemberVO tvo) {
		TMemberVO tmvo = (TMemberVO) session.selectList("tMemberDetail");
		return null;
	}
	
	@Override
	public int ttUpdate(TMemberVO tvo) {
		int i = session.update("ttUpdate");
		return i;
	}
	
	@Override
	public int ttDelete(TMemberVO tvo) {

		int i = session.update("ttDelete");
		return i;
	}

}
