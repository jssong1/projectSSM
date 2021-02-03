package ssm.mi.dao;

import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;
import ssm.mi.vo.UserVO;

public interface LoginDao {

	SMemberVO sloginCheck(SMemberVO svo);

	TMemberVO tLoginCheck(TMemberVO tvo);

	

}
