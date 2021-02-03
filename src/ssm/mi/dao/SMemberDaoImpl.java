package ssm.mi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.mi.vo.BasicInformationVO;
import ssm.mi.vo.SMemberGrVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

public class SMemberDaoImpl	implements SMemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public SMemberVO checkInfo(SMemberVO smvo) {
		SMemberVO svo= sqlSession.selectOne("checkInfo");
		return svo;
	}

	@Override
	public SMemberGrVO checkFM_Member(SMemberVO svo) {
		SMemberGrVO sgrvo = sqlSession.selectOne("checkFM_Member");
		return sgrvo;
	}

	@Override
	public SMemberGrVO checkJR_Member(SMemberVO svo) {
		SMemberGrVO sgrvo = sqlSession.selectOne("checkJR_Member");
		return sgrvo;
	}

	@Override
	public SMemberGrVO checkSR_Member(SMemberVO svo) {
		SMemberGrVO sgrvo = sqlSession.selectOne("checkSR_Member");
		return sgrvo;
	}


	@Override
	public int insertInfo(SMemberVO smvo) {
		int i = sqlSession.update("insertInfo");
		return i;
	}

	@Override
	public TMemberVO teacherInfo(SMemberGrVO sgvo) {
		TMemberVO tmvo = sqlSession.selectOne("teacherInfo");
		return tmvo;
	}

	@Override
	public int insertGr(SMemberGrVO sgvo) {
		int i = sqlSession.update("insertGr");
		return i;
	}

	@Override
	public int chaebunGr(SMemberGrVO sgvo) {
		int i = sqlSession.selectOne("chaebunGr"); 
		return i;
	}

	@Override
	public List<SMemberVO> smListAll() {
		List<SMemberVO> list  = sqlSession.selectList("smListAll");
		return list;
	}

	@Override
	public SMemberVO ajaxIdCheck(SMemberVO svo) {
		SMemberVO smvo =sqlSession.selectOne("ajaxIdCheck");
		return smvo;
	}
	@Override
	public String biChaebun() {
		return sqlSession.selectOne("biChaebun");
	}

	@Override
	public int BIInsert(BasicInformationVO bivo) {
		return sqlSession.insert("BIInsert");
	}

	@Override
	public int BIUpdate(BasicInformationVO bivo) {
		return sqlSession.update("BIUpdate");
	}

	@Override
	public List sInformation(SMemberVO svo) {
		return sqlSession.selectOne("sInformation");
	}

	@Override
	public List basicInformation(BasicInformationVO bivo) {
		return sqlSession.selectList("basicInformation");
	}
	
	@Override
	public SMemberVO selectPn(SMemberVO svo) {
		return sqlSession.selectOne("selectPn");
	}

	@Override
	public List getGrade(SMemberVO svo) {
		return sqlSession.selectList("getGrade");
	}
}
