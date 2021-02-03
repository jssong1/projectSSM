package ssm.cm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cm.dao.NoticeBoardDao;
import ssm.cm.dao.SchedulNoticeDao;
import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.SchedulNoticeVO;

@Service
@Transactional
public class SchedulNoticeServiceImpl implements SchedulNoticeService {

	@Autowired
	private SchedulNoticeDao schedulnoticedao;

	@Override
	public List<SchedulNoticeVO> snlistajax() {
		List<SchedulNoticeVO> snlist = null;
		snlist =schedulnoticedao.snlistajax();
		return snlist;
	}
	
	@Override
	public SchedulNoticeVO snChaebun() {
		SchedulNoticeVO svo_ = null;
		svo_ =schedulnoticedao.snChaebun();
		return svo_;
	}

	@Override
	public int snInsert(SchedulNoticeVO svo) {
		int result = 0;
		result=schedulnoticedao.snInsert(svo);	
		return result;
	}

	@Override
	public int snUpdate(SchedulNoticeVO svo) {
		int result = 0;
		result=schedulnoticedao.snUpdate(svo);
		return result;
	}

	@Override
	public int snDelete(SchedulNoticeVO svo) {
		int result = 0;
		result=schedulnoticedao.snDelete(svo);
		return result;
	}

}
