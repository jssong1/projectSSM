package ssm.mi.service;

import java.util.List;

import ssm.mi.vo.BasicInformationVO;
import ssm.mi.vo.SMemberGrVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

public interface SMemberService {
	SMemberVO checkInfo(SMemberVO smvo);

	SMemberGrVO checkFM_Member(SMemberVO svo);

	SMemberGrVO checkJR_Member(SMemberVO svo);

	SMemberGrVO checkSR_Member(SMemberVO svo);


	int insertInfo(SMemberVO smvo);

	TMemberVO teacherInfo(SMemberGrVO sgvo);

	int insertGr(SMemberGrVO sgvo);

	int chaebunGr(SMemberGrVO sgvo);

	List<SMemberVO> smListAll();

	SMemberVO ajaxIdCheck(SMemberVO svo);
	
	String biChaebun();

	int BIInsert(BasicInformationVO bivo);

	int BIUpdate(BasicInformationVO bivo);

	List sInformation(SMemberVO svo);

	List basicInformation(BasicInformationVO bivo);
	
	SMemberVO selectPn(SMemberVO svo);

	List getGrade(SMemberVO svo);

}
