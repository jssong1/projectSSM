package ssm.cg.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cg.dao.OnlineApplication_BoardDAO;
import ssm.cg.vo.OnlineApplication_BoardVO;

@Service
@Transactional
public class OnlineApplication_BoardServiceImpl implements OnlineApplication_BoardService {
	
	@Autowired
	private OnlineApplication_BoardDAO onlineApplication_BoardDAO;
	
	Logger logger = Logger.getLogger(OnlineApplication_BoardService.class);

	/* 상세조회, 전체조회 */
	@Override
	public List<OnlineApplication_BoardVO> oaBoardList(OnlineApplication_BoardVO oaVo) {
		logger.info("(log)Service.oaBoardList() start >>>");
		List<OnlineApplication_BoardVO> list = null;
		list = onlineApplication_BoardDAO.oaBoardList(oaVo);
		logger.info("(log)Service.oaBoardList() end >>>");
		return list;
	}
	
	@Override
	public OnlineApplication_BoardVO oaBoardDetail(OnlineApplication_BoardVO oaVo) {
		
		logger.info("(log)Service.oaBoardDetail() start >>>");
		OnlineApplication_BoardVO oa_Vo = onlineApplication_BoardDAO.oaBoardDetail(oaVo);
		logger.info("(log)Service.oaBoardDetails() end <<<");
		return oa_Vo;
	}
	
	/* 입력, 수정, 삭제 */
	@Override
	public int oaBoardInsert(OnlineApplication_BoardVO oaVo) {
		
		logger.info("(log)Service.oaBoardInsert() start >>>");
		int result = 0;
		result = onlineApplication_BoardDAO.oaBoardInsert(oaVo);
		logger.info("(log)Service.oaBoardInsert() end <<<");
		return result;
	}

	@Override
	public int oaBoardUpdate(OnlineApplication_BoardVO oaVo) {
		
		logger.info("(log)Service.oaBoardUpdate() start >>>");
		int result = 0;
		result = onlineApplication_BoardDAO.oaBoardUpdate(oaVo);
		logger.info("(log)Service.oaBoardUpdate() end <<<");
		return result;
	}
	
	@Override
	public int oaBoardDelete(OnlineApplication_BoardVO oaVo) {
		
		logger.info("(log)Service.oaBoardDelete() start >>>");
		int result = 0;
		result = onlineApplication_BoardDAO.oaBoardDelete(oaVo);
		logger.info("(log)Service.oaBoardDelete() end <<<");
		return result;
	}
	
	/* 채번 */
	@Override
	public OnlineApplication_BoardVO oaChaebun(String oaNo) {
		
		OnlineApplication_BoardVO oaVo = onlineApplication_BoardDAO.oaChaebun(oaNo);
		return oaVo;
	}

	@Override
	public int oaBoardListCnt(OnlineApplication_BoardVO oaVo) {
		
		int result = 0;
		result = onlineApplication_BoardDAO.oaBoardListCnt(oaVo);
		return result;
	}
	

	//담임-학생조회(온라인상담)
	@Override
	public List<OnlineApplication_BoardVO> oaListCLT(OnlineApplication_BoardVO oaVo) {
		List<OnlineApplication_BoardVO> list = null;
		list = onlineApplication_BoardDAO.oaListCLT(oaVo);
		return list;
	}
	
	//담임-답변대기 글 조회(온라인상담)
	@Override
	public List<OnlineApplication_BoardVO> ssOaList(OnlineApplication_BoardVO oaVo) {
		List<OnlineApplication_BoardVO> list = null;
		list = onlineApplication_BoardDAO.ssOaList(oaVo);
		return list;
	}	
} // OnlineApplication_BoardServiceImpl
