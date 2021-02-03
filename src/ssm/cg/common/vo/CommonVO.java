package ssm.cg.common.vo;

public class CommonVO {
	
	// 페이징
	private int page; 		// 현재 페이지
	private int pageSize; 	// 한 페이지에 보여줄 레코드
	private String startRow; 	// 시작 로우
	private String endRow; 	// 마지막 로우
	
	// 온라인 상담 게시판
	// 검색
	private String search;	// 검색키워드
	private String keyword; // 검색어
	
	// 정렬
	private String orderBy;
	private String orderSc;
	
	
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

	
}
