package ssm.cm.service;

import java.util.List;

import ssm.cm.vo.NoticeBoardVO;

public interface NoticeBoardService {
	public List<NoticeBoardVO> nblist(NoticeBoardVO nvo);
	public NoticeBoardVO nbChaebun(NoticeBoardVO nvo);
	public int nbInsert(NoticeBoardVO nvo);
	public NoticeBoardVO nbDetail(NoticeBoardVO nvo);
	public int pwdConfirm(NoticeBoardVO nvo, String ttPw);
	public int nbUpdate(NoticeBoardVO nvo);
	public int nbDelete(NoticeBoardVO nvo);
	public void nbViews(NoticeBoardVO nvo);
}
