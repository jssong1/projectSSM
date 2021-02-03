package ssm.ef.service;

import java.util.List;

import ssm.br.vo.NonprogramVO;
import ssm.cd.vo.CareerdesignVO;
import ssm.cd.vo.ValuesettingVO;
import ssm.cg.vo.OnlineApplication_BoardVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;


public interface EportfolioService {
	public List<SMemberVO> eflist(TMemberVO tvo);
	public List<CareerdesignVO> cdlist(SMemberVO svo);
	public List<NonprogramVO> brlist(SMemberVO svo);
	public List<OnlineApplication_BoardVO> cglist(SMemberVO svo);
	public ValuesettingVO vslist(SMemberVO svo);
	public SMemberVO mylist(SMemberVO svo);
	
}
