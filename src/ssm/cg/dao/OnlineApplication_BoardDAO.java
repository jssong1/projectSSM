package ssm.cg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cg.vo.OnlineApplication_BoardVO;


public interface OnlineApplication_BoardDAO {
	
	/* 전체조회, 상세보기 */
	public List<OnlineApplication_BoardVO> oaBoardList(OnlineApplication_BoardVO oaVo);
	public OnlineApplication_BoardVO oaBoardDetail(OnlineApplication_BoardVO oaVo);
	
	/* 입력, 수정, 삭제 */
	public int oaBoardInsert(OnlineApplication_BoardVO oaVo);
	public int oaBoardUpdate(OnlineApplication_BoardVO oaVo);	
	public int oaBoardDelete(OnlineApplication_BoardVO oaVo);

	/* 채번 */
	public OnlineApplication_BoardVO oaChaebun(String oaNo);
	
	/* 페이징 */
	public int oaBoardListCnt(OnlineApplication_BoardVO oaVo);

	
	//담임-학생조회(온라인상담)
	public List<OnlineApplication_BoardVO> oaListCLT(OnlineApplication_BoardVO oaVo);
	//담임-답변대기 글 조회(온라인상담)
	public List<OnlineApplication_BoardVO> ssOaList(OnlineApplication_BoardVO oaVo);
	
}