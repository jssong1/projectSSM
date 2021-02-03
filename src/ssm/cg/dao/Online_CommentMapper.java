package ssm.cg.dao;

import java.util.List;

import ssm.cg.vo.OnlineApplication_BoardVO;
import ssm.cg.vo.Online_CommentVO;

public interface Online_CommentMapper {

	List<Online_CommentVO> ocList(String oaNo);

	List<Online_CommentVO> selectBoardCommentByCode(OnlineApplication_BoardVO obVO);

	int commentInsert(Online_CommentVO ocvo);

	Online_CommentVO selectChaebun(Online_CommentVO ocvo);

	int commentUpdate(Online_CommentVO ocVo);

	int commentDelete(String ocNo);

}
