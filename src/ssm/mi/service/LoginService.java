package ssm.mi.service;

import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;
import ssm.mi.vo.UserVO;

public interface LoginService {

	public SMemberVO sloginCheck(SMemberVO svo);

	public TMemberVO tLoginCheck(TMemberVO tvo);

}
