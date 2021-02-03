package ssm.mi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Repository;

import ssm.mi.vo.TMemberVO;


public class TMemberMapperImpl implements TMemberMapper{

	@Autowired
	private SqlSession session;
	
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
	public int joinTMember(TMemberVO param) {
		int i = (int)session.insert("joinTMember");
		return i;
	}

	@Override
	public TMemberVO joinTMemberCheck(TMemberVO param) {
		TMemberVO tmvo = session.selectOne("joinTMemberCheck");
		return tmvo;
	}

	@Override
	public int tMemberUpdate(TMemberVO tvo) {
		int i = (int)session.insert("tMemberUpdate");
		return i;
	}

	@Override
	public TMemberVO loginTMember(TMemberVO tvo) {
		TMemberVO tmvo = session.selectOne("loginTMember");
		return tmvo;
	}

}
