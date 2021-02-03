package ssm.cg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cg.vo.Edu_ScheduleVO;
import ssm.cg.vo.VisitCounsel_EduRsvVO;

@Repository
public class Edu_ScheduleDAOImpl implements Edu_ScheduleDAO {

	@Autowired
	private SqlSession session;
	
	/* 교사 시간표 조회, 수정 */
	@Override
	public List<Edu_ScheduleVO> eduScheduleList(Edu_ScheduleVO esvo) {
		
		return session.selectList("eduScheduleList");
	}

	@Override
	public int esUpdate(Edu_ScheduleVO esvo) {
		
		return session.update("esUpdate");
	}
	
	@Override
	public int esRollback(Edu_ScheduleVO esvo) {
		
		return session.update("esRollback");
	}

	/* 학생 예약 내역 전체/ 상세 조회, 상담/ 예약 진행상태 변경 */
	@Override
	public List<VisitCounsel_EduRsvVO> eduRsvList(VisitCounsel_EduRsvVO vcvo) {
		
		return session.selectList("eduRsvList");
	}

	@Override
	public Edu_ScheduleVO eduRsvDetail(Edu_ScheduleVO esvo) {
		
		return (Edu_ScheduleVO)session.selectList("eduRsvDetail");
	}

	@Override
	public int vrStatusUpdate(Edu_ScheduleVO esvo) {
		return session.update("vrStatusUpdate");
	}
	
	public int listCnt(VisitCounsel_EduRsvVO vcvo){
		return (Integer)session.selectOne("listCnt");
	}
	
} // Edu_ScheduleMapperImpl
