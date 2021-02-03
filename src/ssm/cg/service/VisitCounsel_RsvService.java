package ssm.cg.service;

import java.util.List;

import ssm.cg.vo.VisitCounsel_RsvVO;



public interface VisitCounsel_RsvService {
	public List<VisitCounsel_RsvVO> vcMineList(VisitCounsel_RsvVO vcRvo);
	public List vcRsvList(VisitCounsel_RsvVO vcRvo);

	public int insertVC(VisitCounsel_RsvVO vcRvo);

	public VisitCounsel_RsvVO vrChaebun(VisitCounsel_RsvVO vcRvo);

	public String userGrade(String ssNo);

	public VisitCounsel_RsvVO ssNoInfo(String ssNo);
	public int cancelBooking(VisitCounsel_RsvVO vcRvo);

} // VisitCounsel_RsvService