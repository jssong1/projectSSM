package ssm.cm.service;

import java.util.List;

import ssm.cm.vo.FamilyLetterVO;
import ssm.cm.vo.NoticeBoardVO;

public interface FamilyLetterService {
	public List<FamilyLetterVO> fllist(FamilyLetterVO fvo);
	public FamilyLetterVO flChaebun(FamilyLetterVO fvo);
	public int flInsert(FamilyLetterVO fvo);
	public FamilyLetterVO flDetail(FamilyLetterVO fvo);
	public int pwdConfirm(FamilyLetterVO fvo, String ttPw);
	public int flUpdate(FamilyLetterVO fvo);
	public int flDelete(FamilyLetterVO fvo);
	public void flViews(FamilyLetterVO fvo);
}
