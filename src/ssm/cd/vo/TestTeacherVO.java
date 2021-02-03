package ssm.cd.vo;

public class TestTeacherVO {
	private String ssNo;
	private String ssGrade;
	private String ssName;
	private String ssClass;
	private String ssNum;
	private String ja_Url;
	private String ji_Url;
	private String ih_Url;
	private String va_Url;
	private String cm_Url;
	private String pageNo;
	private String listSize;
	private String totalCount;
	private String sg;
	private String sc;
	public String getSsNo() {
		return ssNo;
	}

	public void setSsNo(String ssNo) {
		this.ssNo = ssNo;
	}

	public String getSsGrade() {
		return ssGrade;
	}

	public void setSsGrade(String ssGrade) {
		this.ssGrade = ssGrade;
	}

	public String getSsName() {
		return ssName;
	}

	public void setSsName(String ssName) {
		this.ssName = ssName;
	}

	public String getSsClass() {
		return ssClass;
	}

	public void setSsClass(String ssClass) {
		this.ssClass = ssClass;
	}

	public String getSsNum() {
		return ssNum;
	}

	public void setSsNum(String ssNum) {
		this.ssNum = ssNum;
	}

	public String getJa_Url() {
		return ja_Url;
	}

	public void setJa_Url(String ja_Url) {
		this.ja_Url = ja_Url;
	}

	public String getJi_Url() {
		return ji_Url;
	}

	public void setJi_Url(String ji_Url) {
		this.ji_Url = ji_Url;
	}

	public String getIh_Url() {
		return ih_Url;
	}

	public void setIh_Url(String ih_Url) {
		this.ih_Url = ih_Url;
	}

	public String getVa_Url() {
		return va_Url;
	}

	public void setVa_Url(String va_Url) {
		this.va_Url = va_Url;
	}

	public String getCm_Url() {
		return cm_Url;
	}

	public void setCm_Url(String cm_Url) {
		this.cm_Url = cm_Url;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getListSize() {
		return listSize;
	}

	public void setListSize(String listSize) {
		this.listSize = listSize;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "TestTeacherVO [ssNo=" + ssNo + ", ssGrade=" + ssGrade
				+ ", ssName=" + ssName + ", ssClass=" + ssClass + ", ssNum="
				+ ssNum + ", ja_Url=" + ja_Url + ", ji_Url=" + ji_Url
				+ ", ih_Url=" + ih_Url + ", va_Url=" + va_Url + ", cm_Url="
				+ cm_Url + ", pageNo=" + pageNo + ", listSize=" + listSize
				+ ", totalCount=" + totalCount + "]";
	}

	public String getSg() {
		return sg;
	}

	public void setSg(String sg) {
		this.sg = sg;
	}

	public String getSc() {
		return sc;
	}

	public void setSc(String sc) {
		this.sc = sc;
	}
	
	
}