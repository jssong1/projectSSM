package ssm.cg.dao;

import ssm.cg.vo.Visit_CommentVO;

public interface Visit_CommentDAO {

	/* 상담결과 입력, 수정, 삭제 */
	public int vcInsert(Visit_CommentVO vvo);

	public int vcUpdate(Visit_CommentVO vvo);
	
	public int vcDelete(Visit_CommentVO vvo);
	
	/* 채번 */
	public Visit_CommentVO vcChaebun(Visit_CommentVO vvo);
	
}
