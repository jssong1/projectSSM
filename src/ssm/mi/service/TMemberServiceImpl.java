package ssm.mi.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.dao.TMemberDao;
import ssm.mi.vo.TMemberVO;


@Service("tMemberService")
@Transactional
public class TMemberServiceImpl implements TMemberService{
	
	Logger logger = Logger.getLogger(TMemberServiceImpl.class);
	
	@Autowired
	private TMemberDao tMemberDao;

	@Override
	public TMemberVO ajaxIdCheck(TMemberVO tvo) {
		TMemberVO tmvo = tMemberDao.ajaxIdCheck(tvo);
		return tmvo;
	}


	@Override
	public int joinTMember(TMemberVO param) {
		logger.info("ServiceImpl_joinTMember START");
		int i = tMemberDao.joinTMember(param);
		logger.info("ServiceImpl_joinTMember i>>> :" +i);
		logger.info("ServiceImpl_joinTMember END");
		return i;
	}

	@Override
	public TMemberVO joinTMemberCheck(TMemberVO param) {
		logger.info("joinTMCheck Service");
		logger.info("Service param>>> :" +param);
		logger.info("Service param.getTtName()>>> :" +param.getTtName());
		TMemberVO tmvo = tMemberDao.joinTMemberCheck(param);
		logger.info("Service tmvo>>> :" +tmvo);
		return tmvo;
	}


}
