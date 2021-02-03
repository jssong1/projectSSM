package ssm.cg.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cg.vo.Visit_CommentVO;

@Repository
public class Visit_CommentDAOImpl implements Visit_CommentDAO {

	@Autowired
	private SqlSession session;
	
	/* 상담결과 입력, 수정, 삭제 */
	@Override
	public int vcInsert(Visit_CommentVO vvo) {
		
		return session.insert("vcInsert");
	}
	
	@Override
	public int vcUpdate(Visit_CommentVO vvo) {
		
		return session.update("vcUpdate");
	}
	
	@Override
	public int vcDelete(Visit_CommentVO vvo) {
		// TODO Auto-generated method stub
		return session.delete("vcDelete");
	}

	/* 채번 */
	@Override
	public Visit_CommentVO vcChaebun(Visit_CommentVO vvo) {
		
		return (Visit_CommentVO)session.selectOne("vcChaebun");
	}
	

}
