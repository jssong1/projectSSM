package ssm.cg.vo;

import ssm.mi.vo.TMemberVO;



public class Online_CommentVO {
	private String ocNo;
	private String oaNo;
	private String ttNo;
	private String ocTitle;
	private String ocContents;
	private String oaStatus;
	private String ocFile;
	private String ocInsertdate;
	private String ocUpdatedate;
	private String ocDeleteyn;
	private TMemberVO tmemberVO;
	
	
	public TMemberVO getTmemberVO() {
		return tmemberVO;
	}
	public void setTmemberVO(TMemberVO tmemberVO) {
		this.tmemberVO = tmemberVO;
	}
	
	
	public String getTtNo() {
		return ttNo;
	}
	public void setTtNo(String ttNo) {
		this.ttNo = ttNo;
	}
	public String getOcNo() {
		return ocNo;
	}
	public void setOcNo(String ocNo) {
		this.ocNo = ocNo;
	}
	public String getOaNo() {
		return oaNo;
	}
	public void setOaNo(String oaNo) {
		this.oaNo = oaNo;
	}
	public String getOcTitle() {
		return ocTitle;
	}
	public void setOcTitle(String ocTitle) {
		this.ocTitle = ocTitle;
	}
	public String getOcContents() {
		return ocContents;
	}
	public void setOcContents(String ocContents) {
		this.ocContents = ocContents;
	}

	
	public String getOaStatus() {
		return oaStatus;
	}
	public void setOaStatus(String oaStatus) {
		this.oaStatus = oaStatus;
	}
	public String getOcFile() {
		return ocFile;
	}
	public void setOcFile(String ocFile) {
		this.ocFile = ocFile;
	}
	public String getOcInsertdate() {
		return ocInsertdate;
	}
	public void setOcInsertdate(String ocInsertdate) {
		this.ocInsertdate = ocInsertdate;
	}
	public String getOcUpdatedate() {
		return ocUpdatedate;
	}
	public void setOcUpdatedate(String ocUpdatedate) {
		this.ocUpdatedate = ocUpdatedate;
	}
	public String getOcDeleteyn() {
		return ocDeleteyn;
	}
	public void setOcDeleteyn(String ocDeleteyn) {
		this.ocDeleteyn = ocDeleteyn;
	}
	
	
}
