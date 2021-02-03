package ssm.ef.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.br.vo.NonprogramVO;
import ssm.cd.vo.CareerdesignVO;
import ssm.cd.vo.ValuesettingVO;
import ssm.cg.vo.OnlineApplication_BoardVO;
import ssm.cm.vo.FamilyLetterVO;
import ssm.ef.dao.EportfolioDao;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

@Service
@Transactional
public class EportfolioServiceImpl implements EportfolioService {

	
	@Autowired
	private EportfolioDao eportfoliodao;
	
	@Override
	public List<SMemberVO> eflist(TMemberVO tvo) {
		List<SMemberVO> eflist = null;
		eflist =eportfoliodao.eflist(tvo);
		return eflist;
	}

	@Override
	public List<CareerdesignVO> cdlist(SMemberVO svo) {
		List<CareerdesignVO> cdlist = null;
		cdlist =eportfoliodao.cdlist(svo);
		return cdlist;
	}

	@Override
	public List<NonprogramVO> brlist(SMemberVO svo) {
		List<NonprogramVO> brlist = null;
		brlist =eportfoliodao.brlist(svo);
		return brlist;
	}

	@Override
	public List<OnlineApplication_BoardVO> cglist(SMemberVO svo) {
		List<OnlineApplication_BoardVO> cglist = null;
		cglist =eportfoliodao.cglist(svo);
		return cglist;
	}

	@Override
	public ValuesettingVO vslist(SMemberVO svo) {
		ValuesettingVO vslist = null;
		vslist =eportfoliodao.vslist(svo);
		return vslist;
	}
	
	@Override
	public SMemberVO mylist(SMemberVO svo) {
		SMemberVO mylist =eportfoliodao.mylist(svo);
		return mylist;
	}

}
