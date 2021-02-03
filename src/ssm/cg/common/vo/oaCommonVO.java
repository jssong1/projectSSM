package ssm.cg.common.vo;

public class oaCommonVO {
	
	// 페이징
	private int page; 		// 현재 페이지
	private int pageSize; 	// 한 페이지에 보여줄 레코드
	private String startRow; 	// 시작 로우
	private String endRow; 	// 마지막 로우
	
	private String rowNo; 
	private String totalCount;
	
	
	// 온라인 상담 게시판
	// 검색
	private String search;	// 검색키워드
	private String keyword; // 검색어
	
	// 정렬
	private String orderBy;
	private String orderSc;
	
	//e포트폴리오 비교과페이지번호와 상담페이지번호 변수
	private String brpageNo;
	private String cgpageNo;
	
	//e포트폴리오 진로설계,비교과,상담 학년마다 검색할때 사용하는 변수들
	private String cdyearNo;
	private String bryearNo;
	private String cgyearNo;
	
	// get, set
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getStartRow() {
		return startRow;
	}
	public void setStartRow(String startRow) {
		this.startRow = startRow;
	}
	public String getEndRow() {
		return endRow;
	}
	public void setEndRow(String endRow) {
		this.endRow = endRow;
	}
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
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getOrderSc() {
		return orderSc;
	}
	public void setOrderSc(String orderSc) {
		this.orderSc = orderSc;
	}
	public String getRowNo() {
		return rowNo;
	}
	public void setRowNo(String rowNo) {
		this.rowNo = rowNo;
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
