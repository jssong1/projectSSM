package ssm.cd.dao;

import java.util.List;

import ssm.cd.vo.Job_DataVO;
import ssm.cd.vo.Major_DataVO;
import ssm.cd.vo.School_DataVO;
import ssm.cd.vo.TestVO;
import ssm.mi.vo.SMemberVO;

public interface TestDao {

	public int insertResult(TestVO cdvo);
	public int makeChaebun ();
	public void schoolData(School_DataVO sdvo);
	public List schoolInfoList(School_DataVO svo);
	public List majorList(Major_DataVO mdvo);
	public List majorDetail(Major_DataVO mdvo);
	public List jobList(Job_DataVO jdvo);
	public List jobDetail(Job_DataVO jdvo);
	public List testList(TestVO tvo);
}
