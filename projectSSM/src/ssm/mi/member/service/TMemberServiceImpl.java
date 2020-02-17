package ssm.mi.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.member.dao.TMemberMapper;
import ssm.mi.member.vo.TMemberVO;


@Service
@Transactional
public class TMemberServiceImpl implements TMemberService{

	
	@Autowired
	private TMemberMapper tmemberMapper;
	
	@Override
	public List<TMemberVO> listTMember(TMemberVO param) {
		
		List<TMemberVO> list = new ArrayList<TMemberVO>();
		list = tmemberMapper.listTMember(param);
		return list;
	}

	@Override
	public TMemberVO selectChaebun(String tvo) {
		System.out.println("ServiceImpl_Chaebun START");
		TMemberVO ttvo = tmemberMapper.selectChaebun(tvo);
		System.out.println(">>> chaebun >>>>: " +ttvo);
		System.out.println("ServiceImpl_Chaebun END");
		return ttvo;
	}

	@Override
	public int tMemberInsert(TMemberVO tvo) {
		System.out.println("ServiceImpl_tMemberInsert START");
		int i = tmemberMapper.tMemberInsert(tvo);
		System.out.println("ServiceImpl_tmemberMapper.tMemberInsert(tvo) >>>> " + i);
		System.out.println("ServiceImpl_tMemberInsert END");
		return i;
	}

	@Override
	public int joinTMember(TMemberVO param) {
		System.out.println("ServiceImpl_joinTMember START");
		int i = tmemberMapper.joinTMember(param);
		System.out.println("ServiceImpl_joinTMember i>>> :" +i);
		System.out.println("ServiceImpl_joinTMember END");
		return i;
	}

	@Override
	public TMemberVO joinTMemberCheck(TMemberVO param) {
		System.out.println("joinTMCheck Service");
		System.out.println("Service param>>> :" +param);
		System.out.println("Service param.getTtName()>>> :" +param.getTtName());
		TMemberVO tmvo = tmemberMapper.joinTMemberCheck(param);
		System.out.println("Service tmvo>>> :" +tmvo);
		return tmvo;
	}

}
