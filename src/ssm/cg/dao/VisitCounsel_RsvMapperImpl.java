package ssm.cg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cg.vo.VisitCounsel_RsvVO;



public class VisitCounsel_RsvMapperImpl implements VisitCounsel_RsvMapper {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<VisitCounsel_RsvVO> vcMineList(VisitCounsel_RsvVO _vcRvo) {
		List<VisitCounsel_RsvVO> vcRvo = session.selectList("vcRsvList", _vcRvo);
		return vcRvo; 
	}
	
	@Override
	public List vcRsvList(VisitCounsel_RsvVO _vcRvo) {
		List<VisitCounsel_RsvVO> vcRvo = session.selectList("vcRsvList", _vcRvo);
		return vcRvo; 
	}

	@Override
	public VisitCounsel_RsvVO vrChaebun(VisitCounsel_RsvVO vcRvo) {
		VisitCounsel_RsvVO vcrv = session.selectOne("vrChaebun");
		return vcrv;
	}

	@Override
	public int insertVC(VisitCounsel_RsvVO vcRvo) {
		int vcrv = session.insert("insertVC");
		return vcrv;
	}

	@Override
	public String userGrade(String ssNo) {
		String userGrade = session.selectOne("userGrade");
		return userGrade;
	}

	@Override
	public VisitCounsel_RsvVO ssNoInfo(String ssNo) {
		VisitCounsel_RsvVO vcrv = session.selectOne("ssNoInfo");
		return vcrv;
	}

	@Override
	public int cancelBooking(VisitCounsel_RsvVO vcRvo) {
		int i = session.update("cancelBooking");
		return i;
	}



//	@Override
//	public VisitCounsel_RsvVO vcRsvIform(VisitCounsel_RsvVO vcRvo) {
//		VisitCounsel_RsvVO vcrv = session.selectOne("vcRsvIform");
//		return vcrv;
//	}
}
