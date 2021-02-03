package ssm.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.br.dao.Non_ApplicationDao;
import ssm.br.vo.Non_ApplicationVO;

@Service
@Transactional
public class Non_ApplicationServiceImpl implements Non_ApplicationService {
	@Autowired
	private Non_ApplicationDao non_ApplicationDao;
	@Override
	public List non_ApplicationList(Non_ApplicationVO navo) {
		return non_ApplicationDao.non_ApplicationList(navo);
	}
	@Override
	public List non_ApplicationDeatil(Non_ApplicationVO navo) {

		return non_ApplicationDao.non_ApplicationDetail(navo);
	}
	@Override
	public int non_ApplicationInsert(Non_ApplicationVO navo) {

		return non_ApplicationDao.non_ApplicationInsert(navo);
	}
	@Override
	public String chaeBun() {

		return non_ApplicationDao.chaeBun();
	}
	@Override
	public int non_ApplicationDelete(Non_ApplicationVO navo) {
		
		return non_ApplicationDao.non_ApplicationDelete(navo);
	}
	@Override
	public int non_ApplicationUpdate(Non_ApplicationVO navo) {
		return non_ApplicationDao.non_ApplicationUpdate(navo);
	}
	@Override
	public List teacherApplicationList(Non_ApplicationVO nvvo) {

		return non_ApplicationDao.teacherApplicationList(nvvo);
	}
	@Override
	public int approval(Non_ApplicationVO nvvo) {
	
		return non_ApplicationDao.approval(nvvo);
	}
	@Override
	public int approvalCancel(Non_ApplicationVO nvvo) {

		return non_ApplicationDao.approvalCancel(nvvo);
	}

}
