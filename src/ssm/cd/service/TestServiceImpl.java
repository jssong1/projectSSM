package ssm.cd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cd.dao.TestDao;
import ssm.cd.vo.Job_DataVO;
import ssm.cd.vo.Major_DataVO;
import ssm.cd.vo.School_DataVO;
import ssm.cd.vo.TestVO;
import ssm.mi.vo.SMemberVO;

@Service
@Transactional
public class TestServiceImpl implements TestService {
	
	@Autowired
	private TestDao testDao ;
	
	@Override
	public int insertResult(TestVO cdvo) {
		return testDao.insertResult(cdvo);
	}

	@Override
	public int makeChaebun() {
		
		return testDao.makeChaebun();
	}

	@Override
	public void schoolData(School_DataVO sdvo) {
		// TODO Auto-generated method stub
		testDao.schoolData(sdvo);
	}

	@Override
	public List schoolInfoList(School_DataVO svo) {
		// TODO Auto-generated method stub
		List list = testDao.schoolInfoList(svo);
		return list;
	}

	@Override
	public List majorList(Major_DataVO mdvo) {
		// TODO Auto-generated method stub
		List list = testDao.majorList(mdvo);
		return list;
	}

	@Override
	public List majorDetail(Major_DataVO mdvo) {
		// TODO Auto-generated method stub
		List list = testDao.majorDetail(mdvo);
		return list;
	}

	@Override
	public List jobList(Job_DataVO jdvo) {
		// TODO Auto-generated method stub
		List list = testDao.jobList(jdvo);
		return list;
	}

	@Override
	public List jobDetail(Job_DataVO jdvo) {
		// TODO Auto-generated method stub
		return testDao.jobDetail(jdvo);
	}

	@Override
	public List testList(TestVO tvo) {
		// TODO Auto-generated method stub
		List list = null;
		list = testDao.testList(tvo);
		return list;
	}

}
