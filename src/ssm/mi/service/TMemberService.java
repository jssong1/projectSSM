package ssm.mi.service;

import java.util.List;

import ssm.mi.vo.TMemberVO;

public interface TMemberService {
	

	public int joinTMember(TMemberVO param);
	public TMemberVO ajaxIdCheck(TMemberVO tvo);
	public TMemberVO joinTMemberCheck(TMemberVO param);

}
