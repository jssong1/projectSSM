package ssm.cg.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cg.dao.Online_CommentMapper;
import ssm.cg.vo.OnlineApplication_BoardVO;
import ssm.cg.vo.Online_CommentVO;

@Service
@Transactional
public class Online_CommentServiceImpl implements Online_CommentService{

	Logger logger = Logger.getLogger(Online_CommentServiceImpl.class);
	
	@Autowired
	private Online_CommentMapper online_CommentMapper;

	@Override
	public List<Online_CommentVO> ocList(String oaNo) {
		List<Online_CommentVO> ocList = online_CommentMapper.ocList(oaNo);
		return ocList;
	}

	@Override
	public List<Online_CommentVO> selectBoardCommentByCode(OnlineApplication_BoardVO obVO) {
		List<Online_CommentVO> ocList = online_CommentMapper.selectBoardCommentByCode(obVO);
		return ocList;
	}

	@Override
	public int commentInsert(Online_CommentVO ocvo) {
		int result = online_CommentMapper.commentInsert(ocvo);
		return result;
	}

	@Override
	public Online_CommentVO selectChaebun(Online_CommentVO ocvo) {
		Online_CommentVO chaebun =online_CommentMapper.selectChaebun(ocvo);
		return chaebun;
	}

	@Override
	public int commentUpdate(Online_CommentVO ocVo) {
		int result = online_CommentMapper.commentUpdate(ocVo);
		return result;
	}

	@Override
	public int commentDelete(String ocNo) {
		logger.info(">>>>>>>>>>>" + ocNo);
		int result = online_CommentMapper.commentDelete(ocNo);
		logger.info("<<<<<<<<<<");
		return result;
		
	}


}
