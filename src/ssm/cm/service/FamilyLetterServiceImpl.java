package ssm.cm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cm.dao.FamilyLetterDao;
import ssm.cm.dao.NoticeBoardDao;
import ssm.cm.vo.FamilyLetterVO;
import ssm.cm.vo.NoticeBoardVO;

@Service
@Transactional
public class FamilyLetterServiceImpl implements FamilyLetterService {

	@Autowired
	private FamilyLetterDao familyletterdao;
	
	@Override
	public List<FamilyLetterVO> fllist(FamilyLetterVO fvo) {
		List<FamilyLetterVO> fllist = null;
		fllist =familyletterdao.fllist(fvo);
		return fllist;
	}

	@Override
	public FamilyLetterVO flChaebun(FamilyLetterVO fvo) {
		FamilyLetterVO fvo_ = null;
		fvo_ =familyletterdao.flChaebun(fvo);
		return fvo_;
	}

	@Override
	public int flInsert(FamilyLetterVO fvo) {
		int result = 0;
		result=familyletterdao.flInsert(fvo);
		return result;
	}

	@Override
	public FamilyLetterVO flDetail(FamilyLetterVO fvo) {
		FamilyLetterVO fvo_ = null;
		fvo_ =familyletterdao.flDetail(fvo);
		return fvo_;
	}

	@Override
	public int pwdConfirm(FamilyLetterVO fvo, String ttPw) {
		int result = 0;
		result=familyletterdao.pwdConfirm(fvo, ttPw);
		return result;
	}

	@Override
	public int flUpdate(FamilyLetterVO fvo) {
		int result = 0;
		result=familyletterdao.flUpdate(fvo);
		return result;
	}

	@Override
	public int flDelete(FamilyLetterVO fvo) {
		int result = 0;
		result=familyletterdao.flDelete(fvo);
		return result;
	}

	@Override
	public void flViews(FamilyLetterVO fvo) {
		familyletterdao.flViews(fvo);
		
	}

}
