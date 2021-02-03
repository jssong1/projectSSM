package ssm.cg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cg.vo.OnlineApplication_BoardVO;
import ssm.cg.vo.Online_CommentVO;

@Repository
public class Online_CommentMapperImpl implements Online_CommentMapper {
	@Autowired
	private SqlSession session;

	@Override
	public List<Online_CommentVO> ocList(String oaNo) {
		List<Online_CommentVO> ocList = session.selectList("ocList",oaNo);
		return ocList;
	}

	@Override
	public List<Online_CommentVO> selectBoardCommentByCode(OnlineApplication_BoardVO obVO) {
		List<Online_CommentVO> ocList = session.selectList("selectBoardCommentByCode",obVO);
		return ocList;
	}

	@Override
	public int commentInsert(Online_CommentVO ocvo) {
		int i = session.insert("commentInsert");
		return i;
	}

	@Override
	public Online_CommentVO selectChaebun(Online_CommentVO ocvo) {
		Online_CommentVO chaebun = (Online_CommentVO)session.selectOne("selectChaebun");
		return chaebun;
	}

	@Override
	public int commentUpdate(Online_CommentVO ocVo) {
		int i = session.update("commentUpdate");
		return i;
	}

	@Override
	public int commentDelete(String ocNo) {
		int i = session.update("commentDelete");
		return i;
	}


}
