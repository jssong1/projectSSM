package ssm.cg.vo;


public class VisitCounsel_EduRsvVO extends Visit_CommentVO{
	
	private String vrNo;
	private String ssNo;
	private String ttNo;
	private String vrTime;
	private String vrField;
	private String vrDate;
	private String vrInsertdate;
	private String vrStatus;
	private String vrContents;
	private String code;
	private String name;
	
	// 공통 코드
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	// vr테이블
	public String getVrNo() {
		return vrNo;
	}
	public void setVrNo(String vrNo) {
		this.vrNo = vrNo;
	}
	public String getSsNo() {
		return ssNo;
	}
	public void setSsNo(String ssNo) {
		this.ssNo = ssNo;
	}
	public String getTtNo() {
		return ttNo;
	}
	public void setTtNo(String ttNo) {
		this.ttNo = ttNo;
	}
	public String getVrTime() {
		return vrTime;
	}
	public void setVrTime(String vrTime) {
		this.vrTime = vrTime;
	}
	public String getVrField() {
		return vrField;
	}
	public void setVrField(String vrField) {
		this.vrField = vrField;
	}
	public String getVrDate() {
		return vrDate;
	}
	public void setVrDate(String vrDate) {
		this.vrDate = vrDate;
	}
	public String getVrInsertdate() {
		return vrInsertdate;
	}
	public void setVrInsertdate(String vrInsertdate) {
		this.vrInsertdate = vrInsertdate;
	}
	public String getVrStatus() {
		return vrStatus;
	}
	public void setVrStatus(String vrStatus) {
		this.vrStatus = vrStatus;
	}
	public String getVrContents() {
		return vrContents;
	}
	public void setVrContents(String vrContents) {
		this.vrContents = vrContents;
	}
	
} // VisitCounsel_RsvVO
