package ssm.br.vo;

public class Non_ApplicationVO {
	private String naNo;
	private String npNo;
	private String ssNo;
	private String naContents;
	private String naFile;
	private String naInsertdate;
	private String naUpdatedate;
	private String naDeleteyn;
	private String naStatus;
	private String npTitle;
	private String ssEmail;
	private String ssName;
	
	@Override
	public String toString() {
		return "Non_ApplicationVO [naNo=" + naNo + ", npNo=" + npNo + ", ssNo="
				+ ssNo + ", naContents=" + naContents + ", naFile=" + naFile
				+ ", naInsertdate=" + naInsertdate + ", naUpdatedate="
				+ naUpdatedate + ", naDeleteyn=" + naDeleteyn + ", naStatus="
				+ naStatus + ", npTitle=" + npTitle + ", ssEmail=" + ssEmail
				+ ", ssName=" + ssName + "]";
	}
	public String getNaNo() {
		return naNo;
	}
	public void setNaNo(String naNo) {
		this.naNo = naNo;
	}
	public String getNpNo() {
		return npNo;
	}
	public void setNpNo(String npNo) {
		this.npNo = npNo;
	}
	public String getSsNo() {
		return ssNo;
	}
	public void setSsNo(String ssNo) {
		this.ssNo = ssNo;
	}
	public String getNaContents() {
		return naContents;
	}
	public void setNaContents(String naContents) {
		this.naContents = naContents;
	}
	public String getNaFile() {
		return naFile;
	}
	public void setNaFile(String naFile) {
		this.naFile = naFile;
	}
	public String getNaInsertdate() {
		return naInsertdate;
	}
	public void setNaInsertdate(String naInsertdate) {
		this.naInsertdate = naInsertdate;
	}
	public String getNaUpdatedate() {
		return naUpdatedate;
	}
	public void setNaUpdatedate(String naUpdatedate) {
		this.naUpdatedate = naUpdatedate;
	}
	public String getNaDeleteyn() {
		return naDeleteyn;
	}
	public void setNaDeleteyn(String naDeleteyn) {
		this.naDeleteyn = naDeleteyn;
	}
	public String getNaStatus() {
		return naStatus;
	}
	public void setNaStatus(String naStatus) {
		this.naStatus = naStatus;
	}
	public String getNpTitle() {
		return npTitle;
	}
	public void setNpTitle(String npTitle) {
		this.npTitle = npTitle;
	}
	public String getSsEmail() {
		return ssEmail;
	}
	public void setSsEmail(String ssEmail) {
		this.ssEmail = ssEmail;
	}
	public String getSsName() {
		return ssName;
	}
	public void setSsName(String ssName) {
		this.ssName = ssName;
	}
}
