package ssm.cm.dao;

import java.util.List;

import ssm.cm.vo.SchedulNoticeVO;

public interface SchedulNoticeDao {

	public List<SchedulNoticeVO> snlistajax();
	public SchedulNoticeVO snChaebun();
	public int snInsert(SchedulNoticeVO svo);
	public int snUpdate(SchedulNoticeVO svo);
	public int snDelete(SchedulNoticeVO svo);
	
}
