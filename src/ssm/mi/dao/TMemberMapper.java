package ssm.mi.dao;

import java.util.List;

import ssm.mi.vo.TMemberVO;


public interface TMemberMapper {

	public List<TMemberVO> listTMemberN(TMemberVO param);
	public List<TMemberVO> listTMemberY(TMemberVO param);
	public TMemberVO selectChaebun(String tvo);

	public int tMemberInsert(TMemberVO tvo);

	public int joinTMember(TMemberVO param);

	public TMemberVO joinTMemberCheck(TMemberVO param);
	public int tMemberUpdate(TMemberVO tvo);
	public TMemberVO loginTMember(TMemberVO tvo);

}
