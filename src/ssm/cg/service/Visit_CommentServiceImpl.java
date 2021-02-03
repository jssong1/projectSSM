package ssm.cg.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cg.dao.Visit_CommentDAO;
import ssm.cg.vo.Visit_CommentVO;

@Service
@Transactional
public class Visit_CommentServiceImpl implements Visit_CommentService {
	
	@Autowired
	private Visit_CommentDAO visit_CommentDAO;
	
	Logger logger = Logger.getLogger(Visit_CommentServiceImpl.class);
	
	/* 상담결과 입력, 수정, 삭제 */
	public int vcInsert(Visit_CommentVO vvo){
		
		logger.info("(log)Service.vcInsert() start >>>");
		
		logger.info("(log)Service.vrNo : " + vvo.getVrNo());
		int result = visit_CommentDAO.vcInsert(vvo);
		
		logger.info("(log)Service.vcInsert() end <<<");
		return result;
	}

	@Override
	public int vcUpdate(Visit_CommentVO vvo) {
		
		logger.info("(log)Service.vcUpdate() start >>>");
		
		logger.info("(log)Service.vrNo : " + vvo.getVrNo());
		int result = visit_CommentDAO.vcUpdate(vvo);
		
		logger.info("(log)Service.vcUpdate() end <<<");
		
		return result;
	}
	
	@Override
	public int vcDelete(Visit_CommentVO vvo) {
		
		logger.info("(log)Service.vcDelete() start >>>");
		
		logger.info("(log)Service.vrNo : " + vvo.getVrNo());
		int result = visit_CommentDAO.vcDelete(vvo);
		
		logger.info("(log)Service.vcDelete() end <<<");
		
		return result;
	}

	@Override
	public Visit_CommentVO vcChaebun(Visit_CommentVO vvo) {
		
		Visit_CommentVO vvo_ = visit_CommentDAO.vcChaebun(vvo); 
		return vvo_;
	}
	
}
