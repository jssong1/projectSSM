package ssm.cg.common;

public class PagingClass {
	
	private int maxNum;
	private int pageNum;
	private int listCnt;
	private int pageCnt;
	
	
	public PagingClass(int maxNum, int pageNum, int listCnt, int pageCnt){
		this.maxNum = maxNum;
		this.pageNum = pageNum;
		this.listCnt = listCnt;
		this.pageCnt = pageCnt;
	}
	
	
//	public String paging(){
//		//int totalpPage = (maxNum % listCnt > 0) ? maxNum ;
//	}
//	

}
