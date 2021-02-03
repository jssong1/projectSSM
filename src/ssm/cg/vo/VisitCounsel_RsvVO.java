package ssm.cg.vo;

import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

public class VisitCounsel_RsvVO {
	
	private String vrNo;
	private String ssNo;
	private String ttNo;
	private String vrStatus;
	private String vrTime;
	private String vrDate;
	private String vrYN;
	private String vrInsertdate;
	private String vrDeleteyn;
	private String vrDay;
	private String vrField;
	private String vrContents;
	private String vrFile;
	private SMemberVO smemberVO;
	private TMemberVO tmemberVO;
	private Visit_CommentVO vcCommentVO;
	
	public Visit_CommentVO getVcCommentVO() {
		return vcCommentVO;
	}
	public void setVcCommentVO(Visit_CommentVO vcCommentVO) {
		this.vcCommentVO = vcCommentVO;
	}
	public SMemberVO getSmemberVO() {
		return smemberVO;
	}
	public void setSmemberVO(SMemberVO smemberVO) {
		this.smemberVO = smemberVO;
	}
	public TMemberVO getTmemberVO() {
		return tmemberVO;
	}
	public void setTmemberVO(TMemberVO tmemberVO) {
		this.tmemberVO = tmemberVO;
	}
	public String getVrField() {
		return vrField;
	}
	public void setVrField(String vrField) {
		this.vrField = vrField;
	}
	public String getVrContents() {
		return vrContents;
	}
	public void setVrContents(String vrContents) {
		this.vrContents = vrContents;
	}
	public String getVrFile() {
		return vrFile;
	}
	public void setVrFile(String vrFile) {
		this.vrFile = vrFile;
	}
	public String getVrDay() {
		return vrDay;
	}
	public void setVrDay(String vrDay) {
		this.vrDay = vrDay;
	}
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
	public String getVrStatus() {
		return vrStatus;
	}
	public void setVrStatus(String vrStatus) {
		this.vrStatus = vrStatus;
	}
	public String getVrTime() {
		return vrTime;
	}
	public void setVrTime(String vrTime) {
		this.vrTime = vrTime;
	}
	public String getVrDate() {
		return vrDate;
	}
	public void setVrDate(String vrDate) {
		this.vrDate = vrDate;
	}
	public String getVrYN() {
		return vrYN;
	}
	public void setVrYN(String vrYN) {
		this.vrYN = vrYN;
	}
	public String getVrInsertdate() {
		return vrInsertdate;
	}
	public void setVrInsertdate(String vrInsertdate) {
		this.vrInsertdate = vrInsertdate;
	}
	public String getVrDeleteyn() {
		return vrDeleteyn;
	}
	public void setVrDeleteyn(String vrDeleteyn) {
		this.vrDeleteyn = vrDeleteyn;
	}

} // VisitCounsel_RsvVO
