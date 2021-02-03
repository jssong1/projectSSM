package ssm.cm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import ssm.cm.vo.QnABoardVO;

public class QnABoardDaoImpl implements QnABoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<QnABoardVO> qblist(QnABoardVO qvo) {
		// TODO Auto-generated method stub
		return session.selectList("qblist");
	}

	@Override
	public QnABoardVO qbChaebun(QnABoardVO qvo) {
		// TODO Auto-generated method stub
		return session.selectOne("qbChaebun");
	}

	@Override
	public int qbInsert(QnABoardVO qvo) {
		// TODO Auto-generated method stub
		return session.insert("qbInsert");
	}

	@Override
	public QnABoardVO qbDetail(QnABoardVO qvo) {
		// TODO Auto-generated method stub
		return session.selectOne("qbDetail");
	}

	@Override
	public int pwdConfirm(QnABoardVO qvo, String ssPw) {
		// TODO Auto-generated method stub
		return session.selectOne("pwdConfirm");
	}

	@Override
	public int qbUpdate(QnABoardVO qvo) {
		// TODO Auto-generated method stub
		return session.update("qbUpdate");
	}

	@Override
	public int qbDelete(QnABoardVO qvo) {
		// TODO Auto-generated method stub
		return session.update("qbDelete");
	}

	@Override
	public void qbViews(QnABoardVO qvo) {
		// TODO Auto-generated method stub
		session.update("qbViews");
	}

	


}
