package ssm.mi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.dao.SMemberDao;
import ssm.mi.vo.BasicInformationVO;
import ssm.mi.vo.SMemberGrVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

@Service
@Transactional
public class SMemberServiceImpl implements SMemberService {

	
	@Autowired
	private SMemberDao sMemberDao;
	
	@Override
	public SMemberVO checkInfo(SMemberVO smvo) {
		SMemberVO svo = sMemberDao.checkInfo(smvo);
		return svo;
	}

	@Override
	public SMemberGrVO checkFM_Member(SMemberVO svo) {
		SMemberGrVO sgrvo = sMemberDao.checkFM_Member(svo);
		return sgrvo;
	}

	@Override
	public SMemberGrVO checkJR_Member(SMemberVO svo) {
		SMemberGrVO sgrvo = sMemberDao.checkJR_Member(svo);
		return sgrvo;
	}

	@Override
	public SMemberGrVO checkSR_Member(SMemberVO svo) {
		SMemberGrVO sgrvo = sMemberDao.checkSR_Member(svo);
		return sgrvo;
	}


	@Override
	public int insertInfo(SMemberVO smvo) {
		int i = sMemberDao.insertInfo(smvo);
		return i;
	}

	@Override
	public TMemberVO teacherInfo(SMemberGrVO sgvo) {
		TMemberVO tvo = sMemberDao.teacherInfo(sgvo);
		return tvo;
	}

	@Override
	public int insertGr(SMemberGrVO sgvo) {
		int i = sMemberDao.insertGr(sgvo);
		return i;
	}

	@Override
	public int chaebunGr(SMemberGrVO sgvo) {
		int i = sMemberDao.chaebunGr(sgvo);
		return i;
	}

	@Override
	public List<SMemberVO> smListAll() {
		List<SMemberVO> list = sMemberDao.smListAll();
		return list;
	}

	@Override
	public SMemberVO ajaxIdCheck(SMemberVO svo) {
		SMemberVO smvo = sMemberDao.ajaxIdCheck(svo);
		return smvo;
	}
	
	@Override
	public String biChaebun() {
		return sMemberDao.biChaebun();
	}

	@Override
	public int BIInsert(BasicInformationVO bivo) {
		return sMemberDao.BIInsert(bivo);
	}

	@Override
	public int BIUpdate(BasicInformationVO bivo) {
		return sMemberDao.BIUpdate(bivo);
	}

	@Override
	public List sInformation(SMemberVO svo) {
		List list = null;
		list = sMemberDao.sInformation(svo);
		return list;
	}

	@Override
	public List basicInformation(BasicInformationVO bivo) {
		List list = null;
		list = sMemberDao.basicInformation(bivo);
		return list;
	}

	@Override
	public SMemberVO selectPn(SMemberVO svo) {
		return sMemberDao.selectPn(svo);
	}

	@Override
	public List getGrade(SMemberVO svo) {
		List list = null;
		list = sMemberDao.getGrade(svo);
		return list;
	}
}
