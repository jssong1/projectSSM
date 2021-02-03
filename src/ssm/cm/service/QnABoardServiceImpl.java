package ssm.cm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cm.dao.NoticeBoardDao;
import ssm.cm.dao.QnABoardDao;
import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.QnABoardVO;

@Service
@Transactional
public class QnABoardServiceImpl implements QnABoardService {

	@Autowired
	private QnABoardDao qnaboarddao;
	
	@Override
	public List<QnABoardVO> qblist(QnABoardVO qvo) {
		List<QnABoardVO> qblist = null;
		qblist =qnaboarddao.qblist(qvo);
		return qblist;
	}

	@Override
	public QnABoardVO qbChaebun(QnABoardVO qvo) {
		QnABoardVO qvo_ = null;
		qvo_ =qnaboarddao.qbChaebun(qvo);
		return qvo_;
	}

	@Override
	public int qbInsert(QnABoardVO qvo) {
		int result = 0;
		result=qnaboarddao.qbInsert(qvo);
		return result;
	}

	@Override
	public QnABoardVO qbDetail(QnABoardVO qvo) {
		QnABoardVO qvo_ = null;
		qvo_ =qnaboarddao.qbDetail(qvo);
		return qvo_;
	}

	@Override
	public int pwdConfirm(QnABoardVO qvo, String ssPw) {
		int result = 0;
		result=qnaboarddao.pwdConfirm(qvo, ssPw);
		return result;
	}

	@Override
	public int qbUpdate(QnABoardVO qvo) {
		int result = 0;
		result=qnaboarddao.qbUpdate(qvo);
		return result;
	}

	@Override
	public int qbDelete(QnABoardVO qvo) {
		int result = 0;
		result=qnaboarddao.qbDelete(qvo);
		return result;
	}

	@Override
	public void qbViews(QnABoardVO qvo) {
		// TODO Auto-generated method stub
		qnaboarddao.qbViews(qvo);
	}

	

}
