package ssm.mi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.dao.LoginDao;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;
import ssm.mi.vo.UserVO;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private LoginDao loginDao;

	@Override
	public SMemberVO sloginCheck(SMemberVO svo) {
		SMemberVO smvo = loginDao.sloginCheck(svo);
		return smvo;
	}

	@Override
	public TMemberVO tLoginCheck(TMemberVO tvo) {
		TMemberVO tmvo = loginDao.tLoginCheck(tvo);
		return tmvo;
	}
}
