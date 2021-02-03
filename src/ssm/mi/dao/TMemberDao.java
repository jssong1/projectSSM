package ssm.mi.dao;


import ssm.mi.vo.TMemberVO;


public interface TMemberDao {


	public TMemberVO ajaxIdCheck(TMemberVO tvo);
	public int joinTMember(TMemberVO param);
	public TMemberVO joinTMemberCheck(TMemberVO param);


	

}
