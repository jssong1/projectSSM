package ssm.cg.vo;

import ssm.cg.common.vo.CommonVO;

public class Visit_CommentVO extends CommonVO  {

	private String vcNo;
	private String vrNo;
	private String ssNo;
	private String ttNo;
	private String vcComments;
	private String vcFile;
	private String vcInsertdate;
	private String vcUpdatedate;
	private String vcDeleteyn;
	
	public String getVcNo() {
		return vcNo;
	}
	public void setVcNo(String vcNo) {
		this.vcNo = vcNo;
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
	public String getVcComments() {
		return vcComments;
	}
	public void setVcComments(String vcComments) {
		this.vcComments = vcComments;
	}
	public String getVcFile() {
		return vcFile;
	}
	public void setVcFile(String vcFile) {
		this.vcFile = vcFile;
	}
	public String getVcInsertdate() {
		return vcInsertdate;
	}
	public void setVcInsertdate(String vcInsertdate) {
		this.vcInsertdate = vcInsertdate;
	}
	public String getVcUpdatedate() {
		return vcUpdatedate;
	}
	public void setVcUpdatedate(String vcUpdatedate) {
		this.vcUpdatedate = vcUpdatedate;
	}
	public String getVcDeleteyn() {
		return vcDeleteyn;
	}
	public void setVcDeleteyn(String vcDeleteyn) {
		this.vcDeleteyn = vcDeleteyn;
	}
	
}