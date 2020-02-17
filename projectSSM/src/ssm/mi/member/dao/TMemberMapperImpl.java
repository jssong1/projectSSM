package ssm.mi.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import ssm.mi.member.vo.TMemberVO;

public class TMemberMapperImpl implements TMemberMapper{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<TMemberVO> listTMember(TMemberVO param) {
		List<TMemberVO> list = session.selectList("listTMember");
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

}
