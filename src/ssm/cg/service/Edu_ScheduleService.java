package ssm.cg.service;

import java.util.List;

import ssm.cg.vo.Edu_ScheduleVO;
import ssm.cg.vo.VisitCounsel_EduRsvVO;


public interface Edu_ScheduleService {

	/* 교사 시간표 조회, 수정 */
	public List<Edu_ScheduleVO> eduScheduleList(Edu_ScheduleVO esvo);
	public int esUpdate(Edu_ScheduleVO esvo);
	public int esRollback(Edu_ScheduleVO esvo);
	
	/* 학생 예약 내역 전체/ 상세 조회, 상담/ 예약 진행상태 변경 */
	public List<VisitCounsel_EduRsvVO> eduRsvList(VisitCounsel_EduRsvVO vcvo);
	public Edu_ScheduleVO eduRsvDetail(Edu_ScheduleVO esvo);
	public int vrStatusUpdate(Edu_ScheduleVO esvo);
	
	public int listCnt(VisitCounsel_EduRsvVO vcvo);
	
} // Edu_ScheduleService