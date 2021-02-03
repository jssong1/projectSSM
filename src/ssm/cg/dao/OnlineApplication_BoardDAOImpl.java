package ssm.cg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cg.vo.OnlineApplication_BoardVO;

@Repository
public class OnlineApplication_BoardDAOImpl implements OnlineApplication_BoardDAO {

	Logger logger = Logger.getLogger(OnlineApplication_BoardDAO.class);
	@Autowired
	private SqlSession session;
	
	/* 전체조회, 상세조회 */
	@Override
	public List<OnlineApplication_BoardVO> oaBoardList(OnlineApplication_BoardVO oaVo) {
		
		logger.info("(log)DAO.oaBoardList() start >>>");
		logger.info("(log)DAO.oaBoardList() end <<<");
		return session.selectList("oaBoardList");
	}
	
	@Override
	public OnlineApplication_BoardVO oaBoardDetail(OnlineApplication_BoardVO oaVo) {
		
		return (OnlineApplication_BoardVO) session.selectList("oaBoardDetail");
	} 


	/* 입력, 수정, 삭제 */
	@Override
	public int oaBoardInsert(OnlineApplication_BoardVO oaVo) {
		
		return session.insert("oaBoardInsert");
	}
	
	@Override
	public int oaBoardUpdate(OnlineApplication_BoardVO oaVo) {
		
		return session.update("oaBoardUpdate");
	}
	
	@Override
	public int oaBoardDelete(OnlineApplication_BoardVO oaVo) {
		
		return session.delete("oaBoardDelete");
	}
	
	/* 채번 */
	@Override
	public OnlineApplication_BoardVO oaChaebun(String oaNo) {
		
		return session.selectOne("oaChaebun");
	}

	/* 게시물 개수 조회 */
	@Override
	public int oaBoardListCnt(OnlineApplication_BoardVO oaVo) {
		
		return (Integer)session.selectOne("oaBoardListCnt");
	}

	/**********************************************************
	// 댓글 개수 조회 
	@Override
	public int pollPush(String oaVo) {
		
		return (Integer)session.selectOne("pollPush");
	}
	*/

	//담임-학생조회(온라인상담)
	@Override
	public List<OnlineApplication_BoardVO> oaListCLT(OnlineApplication_BoardVO oaVo) {
		
		return session.selectList("oaListCLT");
	}
	//담임-답변대기 글 조회(온라인상담)
	@Override
	public List<OnlineApplication_BoardVO> ssOaList(OnlineApplication_BoardVO oaVo) {
		
		return session.selectList("ssOaList");
	}

}
