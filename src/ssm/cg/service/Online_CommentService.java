package ssm.cg.service;

import java.util.List;

import ssm.cg.vo.OnlineApplication_BoardVO;
import ssm.cg.vo.Online_CommentVO;

public interface Online_CommentService {


	public List<Online_CommentVO> ocList(String oaNo);

	public List<Online_CommentVO> selectBoardCommentByCode(OnlineApplication_BoardVO obVO);

	public int commentInsert(Online_CommentVO ocvo);

	public Online_CommentVO selectChaebun(Online_CommentVO ocvo);

	public int commentUpdate(Online_CommentVO ocVo);

	public int commentDelete(String ocNo);
	

}
