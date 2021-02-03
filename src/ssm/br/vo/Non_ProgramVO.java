package ssm.br.vo;

import org.springframework.web.multipart.MultipartFile;

public class Non_ProgramVO {

	private String npNo;
	private String npTitle;
	private String npContents;
	private String npCenter;
	private String npImage;
	private String npRsdate;
	private String npRedate;
	private String npPsdate;
	private String npPedate;
	private String npObject;
	private String npPersonnel;
	private String ttNo;

	private String npIo;
	private String acode;
	private String npDeleteyn;
	private String npInsertdate;
	private String npUpdatedate;
	private String listSize;
	private String PageNo;
	private String totalCount;
	private MultipartFile realFile;
	private String npFile;

	private String ttName;

	public MultipartFile getRealFile() {
		return realFile;
	}

	public void setRealFile(MultipartFile realFile) {
		this.realFile = realFile;
	}

	public String getNpFile() {
		return npFile;
	}

	public void setNpFile(String npFile) {
		this.npFile = npFile;
	}

	@Override
	public String toString() {
		return "Non_ProgramVO [npNo=" + npNo + ", npTitle=" + npTitle
				+ ", npContents=" + npContents + ", npCenter=" + npCenter
				+ ", npImage=" + npImage + ", npRsdate=" + npRsdate
				+ ", npRedate=" + npRedate + ", npPsdate=" + npPsdate
				+ ", npPedate=" + npPedate + ", npObject=" + npObject
				+ ", npPersonnel=" + npPersonnel + ", ttNo=" + ttNo + ", npIo="
				+ npIo + ", acode=" + acode + ", npDeleteyn=" + npDeleteyn
				+ ", npInsertdate=" + npInsertdate + ", npUpdatedate="
				+ npUpdatedate + ", listSize=" + listSize + ", PageNo="
				+ PageNo + ", totalCount=" + totalCount + ", realFile="
				+ realFile + ", npFile=" + npFile + ", ttName=" + ttName + "]";
	}
	
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
	public String getNpContents() {
		return npContents;
	}
	public void setNpContents(String npContents) {
		this.npContents = npContents;
	}
	public String getNpCenter() {
		return npCenter;
	}
	public void setNpCenter(String npCenter) {
		this.npCenter = npCenter;
	}
	public String getNpImage() {
		return npImage;
	}
	public void setNpImage(String npImage) {
		this.npImage = npImage;
	}
	public String getNpRsdate() {
		return npRsdate;
	}
	
	public void setNpRsdate(String npRsdate) {
		this.npRsdate = npRsdate;
	}
	public String getNpRedate() {
		return npRedate;
	}
	public void setNpRedate(String npRedate) {
		this.npRedate = npRedate;
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
	public String getNpObject() {
		return npObject;
	}
	public void setNpObject(String npObject) {
		this.npObject = npObject;
	}
	public String getNpPersonnel() {
		return npPersonnel;
	}
	public void setNpPersonnel(String npPersonnel) {
		this.npPersonnel = npPersonnel;
	}
	public String getTtNo() {
		return ttNo;
	}
	public void setTtNo(String ttNo) {
		this.ttNo = ttNo;
	}


	public String getNpIo() {
		return npIo;
	}
	public void setNpIo(String npIo) {
		this.npIo = npIo;
	}
	public String getAcode() {
		return acode;
	}
	public String getTtName() {
		return ttName;
	}

	public void setTtName(String ttName) {
		this.ttName = ttName;
	}

	public void setAcode(String acode) {
		this.acode = acode;
	}
	public String getNpDeleteyn() {
		return npDeleteyn;
	}
	public void setNpDeleteyn(String npDeleteyn) {
		this.npDeleteyn = npDeleteyn;
	}
	public String getNpInsertdate() {
		return npInsertdate;
	}
	public void setNpInsertdate(String npInsertdate) {
		this.npInsertdate = npInsertdate;
	}
	public String getNpUpdatedate() {
		return npUpdatedate;
	}
	public void setNpUpdatedate(String npUpdatedate) {
		this.npUpdatedate = npUpdatedate;
	}
	public String getListSize() {
		return listSize;
	}
	public void setListSize(String listSize) {
		this.listSize = listSize;
	}
	public String getPageNo() {
		return PageNo;
	}
	public void setPageNo(String pageNo) {
		PageNo = pageNo;
	}
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
		
}
