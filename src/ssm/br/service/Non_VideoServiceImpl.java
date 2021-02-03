package ssm.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.br.dao.Non_VideoDao;
import ssm.br.vo.Non_VideoVO;

@Service
@Transactional
public class Non_VideoServiceImpl implements Non_VideoService {

	@Autowired
	private Non_VideoDao non_VideoDao;
	@Override
	public List listVideo() {
		
		return non_VideoDao.listVideo();
	}
	@Override
	public int insertVideo(Non_VideoVO nvvo) {

		return non_VideoDao.insertVideo(nvvo);
	}
	@Override
	public String chaebun() {
		
		return non_VideoDao.chaebun();
	}
	@Override
	public int updatetVideo(Non_VideoVO nvvo) {
		
		return non_VideoDao.updateVideo(nvvo);
	}
	@Override
	public List goUpdateVideo(Non_VideoVO nvvo) {

		return non_VideoDao.goUpdateVideo(nvvo);
	}
	@Override
	public int deleteVideo(Non_VideoVO nvvo) {
		
		return non_VideoDao.deleteVideo(nvvo);
	}

}
