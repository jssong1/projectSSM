package ssm.cm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cm.vo.QnAAnswerVO;


public class QnAAnswerDaoImpl implements QnAAnswerDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<QnAAnswerVO> qaList(String qbNo) {
		// TODO Auto-generated method stub
		return session.selectList("qaList",qbNo);
	}

	@Override
	public int qaInsert(QnAAnswerVO qvo) {
		// TODO Auto-generated method stub
		return session.insert("qaInsert");
	}

	@Override
	public QnAAnswerVO qaChaebun() {
		// TODO Auto-generated method stub
		return (QnAAnswerVO)session.selectOne("qaChaebun");
	}

	@Override
	public int qaUpdate(QnAAnswerVO qvo) {
		// TODO Auto-generated method stub
		return session.update("qaUpdate");
	}

	@Override
	public int qaDelete(String qaNo) {
		// TODO Auto-generated method stub
		return session.delete("qaDelete",qaNo);
	}

}
