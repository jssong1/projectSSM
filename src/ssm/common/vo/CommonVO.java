package ssm.common.vo;

public class CommonVO {
	
	//페이지에대한 변수들
	private String pageNo;
	private String listSize;
	private String totalCount;
	private String rowNo;
	
	//검색에대한 변수들
	private String search; 
	private String keyword;
	
	//e포트폴리오 비교과페이지번호와 상담페이지번호 변수
	private String brpageNo;
	private String cgpageNo;
	
	//e포트폴리오 진로설계,비교과,상담 학년마다 검색할때 사용하는 변수들
	private String cdyearNo;
	private String bryearNo;
	private String cgyearNo;
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
	public String getBrpageNo() {
		return brpageNo;
	}
	public void setBrpageNo(String brpageNo) {
		this.brpageNo = brpageNo;
	}
	public String getCgpageNo() {
		return cgpageNo;
	}
	public void setCgpageNo(String cgpageNo) {
		this.cgpageNo = cgpageNo;
	}
	public String getRowNo() {
		return rowNo;
	}
	public void setRowNo(String rowNo) {
		this.rowNo = rowNo;
	}
	public String getCdyearNo() {
		return cdyearNo;
	}
	public void setCdyearNo(String cdyearNo) {
		this.cdyearNo = cdyearNo;
	}
	public String getBryearNo() {
		return bryearNo;
	}
	public void setBryearNo(String bryearNo) {
		this.bryearNo = bryearNo;
	}
	public String getCgyearNo() {
		return cgyearNo;
	}
	public void setCgyearNo(String cgyearNo) {
		this.cgyearNo = cgyearNo;
	}
	
	
	
	
	
	
	
}
