package ssm.cg.dao;

import java.util.List;

import ssm.cg.vo.VisitCounsel_RsvVO;


public interface VisitCounsel_RsvMapper {
	
	public List<VisitCounsel_RsvVO> vcMineList(VisitCounsel_RsvVO vcRvo);
	public List vcRsvList(VisitCounsel_RsvVO vcRvo);

	public VisitCounsel_RsvVO vrChaebun(VisitCounsel_RsvVO vcRvo);

	public int insertVC(VisitCounsel_RsvVO vcRvo);

	public String userGrade(String ssNo);

	public VisitCounsel_RsvVO ssNoInfo(String ssNo);
	public int cancelBooking(VisitCounsel_RsvVO vcRvo);

	

//	public VisitCounsel_RsvVO vcRsvIform(VisitCounsel_RsvVO vcRvo);


}
