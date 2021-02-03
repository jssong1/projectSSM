package ssm.br.vo;

import ssm.common.vo.CommonVO;

public class NonprogramVO extends CommonVO{

	private String npNo;
	private String npTitle;
	private String npPsdate;
	private String npPedate;
	private String npCenter;
	private String aCode;
	
	public String getNpNo() {
		return npNo;
	}
	public void setNpNo(String npNo) {
		this.npNo = npNo;
	}
	public String getNpTitle() {
		return npTitle;
	}
	public void setNpTitle(String npTitle) {
		this.npTitle = npTitle;
	}
	public String getNpPsdate() {
		return npPsdate;
	}
	public void setNpPsdate(String npPsdate) {
		this.npPsdate = npPsdate;
	}
	public String getNpPedate() {
		return npPedate;
	}
	public void setNpPedate(String npPedate) {
		this.npPedate = npPedate;
	}
	public String getNpCenter() {
		return npCenter;
	}
	public void setNpCenter(String npCenter) {
		this.npCenter = npCenter;
	}
	public String getaCode() {
		return aCode;
	}
	public void setaCode(String aCode) {
		this.aCode = aCode;
	}
	
	
}
