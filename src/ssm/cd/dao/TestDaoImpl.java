package ssm.cd.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cd.vo.Job_DataVO;
import ssm.cd.vo.Major_DataVO;
import ssm.cd.vo.School_DataVO;
import ssm.cd.vo.TestVO;
import ssm.mi.vo.SMemberVO;

@Repository
public class TestDaoImpl  implements TestDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insertResult(TestVO cdvo) {

		return session.insert("insertResult");
	}
	@Override
	public int makeChaebun() {

		return session.selectOne("makeChaebun");
	}
	@Override
	public void schoolData(School_DataVO sdvo) {
		// TODO Auto-generated method stub
		session.insert("schoolData",sdvo);
	}
	@Override
	public List schoolInfoList(School_DataVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("schoolInfoList",svo);
	}
	@Override
	public List majorList(Major_DataVO mdvo) {
		// TODO Auto-generated method stub
		return session.selectList("majorList");
	}
	@Override
	public List majorDetail(Major_DataVO mdvo) {
		// TODO Auto-generated method stub
		return session.selectOne("majorDetail");
	}
	@Override
	public List jobList(Job_DataVO jdvo) {
		// TODO Auto-generated method stub
		return session.selectList("jobList");
	}
	@Override
	public List jobDetail(Job_DataVO jdvo) {
		// TODO Auto-generated method stub
		return session.selectOne("jobDetail");
	}
	@Override
	public List testList(TestVO tvo) {
		// TODO Auto-generated method stub
		return session.selectList("testList");
	}

}
