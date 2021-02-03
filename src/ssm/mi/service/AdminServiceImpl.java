package ssm.mi.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cg.service.Online_CommentServiceImpl;
import ssm.mi.dao.AdminDao;
import ssm.mi.vo.TMemberVO;

@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {
	
	Logger logger = Logger.getLogger(AdminServiceImpl.class);
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<TMemberVO> listTMemberAll(TMemberVO param) {
		List<TMemberVO> list = new ArrayList<TMemberVO>();
		list = adminDao.listTMemberAll(param);
		return list;
	}
	@Override
	public List<TMemberVO> listTMemberN(TMemberVO param) {
		List<TMemberVO> list = new ArrayList<TMemberVO>();
		list = adminDao.listTMemberN(param);
		return list;
	}

	@Override
	public TMemberVO selectChaebun(String tvo) {
		logger.info("ServiceImpl_Chaebun START");
		TMemberVO ttvo = adminDao.selectChaebun(tvo);
		logger.info(">>> chaebun >>>>: " +ttvo);
		logger.info("ServiceImpl_Chaebun END");
		return ttvo;
	}

	@Override
	public int tMemberInsert(TMemberVO tvo) {
		logger.info("ServiceImpl_tMemberInsert START");
		logger.info("ServiceImpl_tMemberInsert param>> : " +tvo.getTtNo());
		logger.info("ServiceImpl_tMemberInsert param>> : " +tvo.getTtName());
		int i = adminDao.tMemberInsert(tvo);
		logger.info("ServiceImpl_tmemberMapper.tMemberInsert(tvo) >>>> " + i);
		logger.info("ServiceImpl_tMemberInsert END");
		return i;
	}
	
	@Override
	public List<TMemberVO> listTMemberY(TMemberVO param) {
		List<TMemberVO> list = new ArrayList<TMemberVO>();
		list = adminDao.listTMemberY(param);
		return list;
	}

	@Override
	public int tMemberYUpdate(TMemberVO tvo) {
		int i = adminDao.tMemberYUpdate(tvo);
		logger.info("i SERVICE>> : " +i);
		return i;
	}
	@Override
	public TMemberVO tMemberDetail(TMemberVO tvo) {
		TMemberVO tmvo = adminDao.tMemberDetail(tvo);
		return tmvo;
	}
	@Override
	public int ttUpdate(TMemberVO tvo) {
		logger.info("service ttno>>>"+tvo.getTtNo());
		int result = adminDao.ttUpdate(tvo);
		return result;
	}
	@Override
	public int ttDelete(TMemberVO tvo) {
		logger.info("service ttno>>>"+tvo.getTtNo());
		int result = adminDao.ttDelete(tvo);
		return result;
	}

	
}
