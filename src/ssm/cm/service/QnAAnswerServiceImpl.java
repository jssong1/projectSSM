package ssm.cm.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cm.dao.QnAAnswerDao;
import ssm.cm.vo.QnAAnswerVO;



@Service
@Transactional
public class QnAAnswerServiceImpl implements QnAAnswerService {
	
	@Autowired
	private QnAAnswerDao qnaanswerdao;
	
	@Override
	public List<QnAAnswerVO> qaList(String qbNo) {
		List<QnAAnswerVO> list = null;
		list = qnaanswerdao.qaList(qbNo);
		return list;
	}

	@Override
	public int qaInsert(QnAAnswerVO qvo) {
		int result = 0;
		result = qnaanswerdao.qaInsert(qvo);
		return result;
	}

	@Override
	public QnAAnswerVO qaChaebun() {
		QnAAnswerVO qvo = new QnAAnswerVO();
		qvo = qnaanswerdao.qaChaebun();
		return qvo;
	}

	@Override
	public int qaUpdate(QnAAnswerVO qvo) {
		int result = 0;
		result = qnaanswerdao.qaUpdate(qvo);
		return result;
	}

	@Override
	public int qaDelete(String qaNo) {
		int result = 0;
		result = qnaanswerdao.qaDelete(qaNo);
		return result;
	}

}
