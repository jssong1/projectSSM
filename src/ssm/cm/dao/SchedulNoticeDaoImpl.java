package ssm.cm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.SchedulNoticeVO;

public class SchedulNoticeDaoImpl implements SchedulNoticeDao {

	@Autowired
	private SqlSession session;
	

	@Override
	public List<SchedulNoticeVO> snlistajax() {
		// TODO Auto-generated method stub
		return session.selectList("snlistajax");
	}
	
	@Override
	public SchedulNoticeVO snChaebun() {
		// TODO Auto-generated method stub
		return session.selectOne("snChaebun");
	}

	@Override
	public int snInsert(SchedulNoticeVO svo) {
		// TODO Auto-generated method stub
		return session.insert("snInsert");
	}

	@Override
	public int snUpdate(SchedulNoticeVO svo) {
		// TODO Auto-generated method stub
		return session.update("snUpdate");
	}

	@Override
	public int snDelete(SchedulNoticeVO svo) {
		// TODO Auto-generated method stub
		return session.update("snDelete");
	}

}
