package ssm.cg.vo;

import ssm.cg.common.vo.oaCommonVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

public class OnlineApplication_BoardVO extends oaCommonVO {
	
	private String oaNo;
	private String ssNo;
	private String ttNo;
	private String oaCountall;
	private String oaCount;
	private String oaField;
	private String oaTitle;
	private String oaContents;
	private String oaStatus;
	private String oaFile;
	private String oaInsertdate;
	private String oaUpdatedate;
	private String oaDeleteyn;
	private SMemberVO smemberVO;
	private String comCnt;
	private TMemberVO tmemberVO;
	
	
	public String getOaCountall() {
		return oaCountall;
	}
	public void setOaCountall(String oaCountall) {
		this.oaCountall = oaCountall;
	}
	public String getOaCount() {
		return oaCount;
	}
	public void setOaCount(String oaCount) {
		this.oaCount = oaCount;
	}
	public SMemberVO getSmemberVO() {
		return smemberVO;
	}
	public void setSmemberVO(SMemberVO smemberVO) {
		this.smemberVO = smemberVO;
	}
	public String getComCnt() {
		return comCnt;
	}
	public void setComCnt(String comCnt) {
		this.comCnt = comCnt;
	}
	// 테이블 조인 시 사용
	private String ssName;
	
	public String getSsName() {
		return ssName;
	}
	public void setSsName(String ssName) {
		this.ssName = ssName;
	}
	
	// online_applicationVO
	public String getOaNo() {
		return oaNo;
	}
	public void setOaNo(String oaNo) {
		this.oaNo = oaNo;
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
	public String getOaField() {
		return oaField;
	}
	public void setOaField(String oaField) {
		this.oaField = oaField;
	}
	public String getOaTitle() {
		return oaTitle;
	}
	public void setOaTitle(String oaTitle) {
		this.oaTitle = oaTitle;
	}
	public String getOaContents() {
		return oaContents;
	}
	public void setOaContents(String oaContents) {
		this.oaContents = oaContents;
	}
	public String getOaStatus() {
		return oaStatus;
	}
	public void setOaStatus(String oaStatus) {
		this.oaStatus = oaStatus;
	}
	public String getOaFile() {
		return oaFile;
	}
	public void setOaFile(String oaFile) {
		this.oaFile = oaFile;
	}
	public String getOaInsertdate() {
		return oaInsertdate;
	}
	public void setOaInsertdate(String oaInsertdate) {
		this.oaInsertdate = oaInsertdate;
	}
	public String getOaUpdatedate() {
		return oaUpdatedate;
	}
	public void setOaUpdatedate(String oaUpdatedate) {
		this.oaUpdatedate = oaUpdatedate;
	}
	public String getOaDeleteyn() {
		return oaDeleteyn;
	}
	public void setOaDeleteyn(String oaDeleteyn) {
		this.oaDeleteyn = oaDeleteyn;
	}
	public TMemberVO getTmemberVO() {
		return tmemberVO;
	}
	public void setTmemberVO(TMemberVO tmemberVO) {
		this.tmemberVO = tmemberVO;
	}
	@Override
	public String toString() {
		return "OnlineApplication_BoardVO [oaNo=" + oaNo + ", ssNo=" + ssNo
				+ ", ttNo=" + ttNo + ", oaCountall=" + oaCountall
				+ ", oaCount=" + oaCount + ", oaField=" + oaField
				+ ", oaTitle=" + oaTitle + ", oaContents=" + oaContents
				+ ", oaStatus=" + oaStatus + ", oaFile=" + oaFile
				+ ", oaInsertdate=" + oaInsertdate + ", oaUpdatedate="
				+ oaUpdatedate + ", oaDeleteyn=" + oaDeleteyn + ", smemberVO="
				+ smemberVO + ", comCnt=" + comCnt + ", tmemberVO=" + tmemberVO
				+ ", ssName=" + ssName + "]";
	}
	
	

}