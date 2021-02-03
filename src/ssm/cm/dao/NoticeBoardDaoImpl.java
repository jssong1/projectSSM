package ssm.cm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cm.vo.NoticeBoardVO;

public class NoticeBoardDaoImpl implements NoticeBoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeBoardVO> nblist(NoticeBoardVO nvo) {
		// TODO Auto-generated method stub
		return session.selectList("nblist");
	}

	@Override
	public NoticeBoardVO nbChaebun(NoticeBoardVO nvo) {
		// TODO Auto-generated method stub
		return session.selectOne("nbChaebun");
	}

	@Override
	public int nbInsert(NoticeBoardVO nvo) {
		// TODO Auto-generated method stub
		return session.insert("nbInsert");
	}

	@Override
	public NoticeBoardVO nbDetail(NoticeBoardVO nvo) {
		// TODO Auto-generated method stub
		return session.selectOne("nbDetail");
	}

	@Override
	public int pwdConfirm(NoticeBoardVO nvo, String ttPw) {
		// TODO Auto-generated method stub
		return session.selectOne("pwdConfirm");
	}

	@Override
	public int nbUpdate(NoticeBoardVO nvo) {
		// TODO Auto-generated method stub
		return session.update("nbUpdate");
	}

	@Override
	public int nbDelete(NoticeBoardVO nvo) {
		// TODO Auto-generated method stub
		return session.update("nbDelete");
	}

	@Override
	public void nbViews(NoticeBoardVO nvo) {
		// TODO Auto-generated method stub
		session.update("nbViews");
		
	}


}
