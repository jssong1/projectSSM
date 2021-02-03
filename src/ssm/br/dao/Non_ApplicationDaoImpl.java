package ssm.br.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.br.vo.Non_ApplicationVO;

@Repository
public class Non_ApplicationDaoImpl implements Non_ApplicationDao {
	@Autowired
	private SqlSession session;
	@Override
	public List non_ApplicationList(Non_ApplicationVO navo) {

		return session.selectList("non_ApplicationList",navo);
	}
	@Override
	public List non_ApplicationDetail(Non_ApplicationVO navo) {

		return session.selectList("non_ApplicationDetail",navo);
	}
	@Override
	public int non_ApplicationInsert(Non_ApplicationVO navo) {
		
		return session.insert("non_ApplicationInsert",navo);
	}
	@Override
	public String chaeBun() {

		return session.selectOne("chaeBun");
	}
	@Override
	public int non_ApplicationDelete(Non_ApplicationVO navo) {
		
		return session.update("non_ApplicationDelete");
	}
	@Override
	public int non_ApplicationUpdate(Non_ApplicationVO navo) {

		return session.update("non_ApplicationUpdate");
	}
	@Override
	public List teacherApplicationList(Non_ApplicationVO nvvo) {
		return session.selectList("teacherApplicationList");
	}
	@Override
	public int approval(Non_ApplicationVO nvvo) {

		return session.update("approval");
	}
	@Override
	public int approvalCancel(Non_ApplicationVO nvvo) {
		
		return session.update("approvalCancel");
	}
	
}
