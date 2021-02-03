package ssm.cm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cm.dao.NoticeBoardDao;
import ssm.cm.vo.NoticeBoardVO;

@Service
@Transactional
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	private NoticeBoardDao noticeboarddao;
	
	@Override
	public List<NoticeBoardVO> nblist(NoticeBoardVO nvo) {
		List<NoticeBoardVO> nblist = null;
		nblist =noticeboarddao.nblist(nvo);
		return nblist;
	}

	@Override
	public NoticeBoardVO nbChaebun(NoticeBoardVO nvo) {
		NoticeBoardVO nvo_ = null;
		nvo_ =noticeboarddao.nbChaebun(nvo);
		return nvo_;
	}

	@Override
	public int nbInsert(NoticeBoardVO nvo) {
		int result = 0;
		result=noticeboarddao.nbInsert(nvo);
		return result;
	}

	@Override
	public NoticeBoardVO nbDetail(NoticeBoardVO nvo) {
		NoticeBoardVO nvo_ = null;
		nvo_ =noticeboarddao.nbDetail(nvo);
		return nvo_;
	}

	@Override
	public int pwdConfirm(NoticeBoardVO nvo, String ttPw) {
		int result = 0;
		result=noticeboarddao.pwdConfirm(nvo, ttPw);
		return result;
	}

	@Override
	public int nbUpdate(NoticeBoardVO nvo) {
		int result = 0;
		result=noticeboarddao.nbUpdate(nvo);
		return result;
	}

	@Override
	public int nbDelete(NoticeBoardVO nvo) {
		int result = 0;
		result=noticeboarddao.nbDelete(nvo);
		return result;
	}

	@Override
	public void nbViews(NoticeBoardVO nvo) {
		noticeboarddao.nbViews(nvo);
		
	}

}
