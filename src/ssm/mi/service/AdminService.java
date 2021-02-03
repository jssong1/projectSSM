package ssm.mi.service;

import java.util.List;

import ssm.mi.vo.TMemberVO;

public interface AdminService {
	public List<TMemberVO> listTMemberAll(TMemberVO param);
	public List<TMemberVO> listTMemberN(TMemberVO param);
	public List<TMemberVO> listTMemberY(TMemberVO param);
	public TMemberVO selectChaebun(String tvo);
	public int tMemberInsert(TMemberVO tvo);
	public int tMemberYUpdate(TMemberVO tvo);
	public TMemberVO tMemberDetail(TMemberVO tvo);
	public int ttUpdate(TMemberVO tvo);
	public int ttDelete(TMemberVO tvo);
	
}
