package ssm.br.vo;

public class Non_VideoVO {
	private String nvNo;              
	private String nvTitle;
          
	private String nvVideo;       
	private String nvInsertdate;        
	private String nvUpdatedate;       
	private String nvDeleteyn;       
	private String ttNo;
	private String ttName;
	private String nvViews;           
	private String nvLikes;
	
	@Override
	public String toString() {
		return "Non_VideoVO [nvNo=" + nvNo + ", nvTitle=" + nvTitle
				+ ", nvVideo=" + nvVideo + ", nvInsertdate=" + nvInsertdate
				+ ", nvUpdatedate=" + nvUpdatedate + ", nvDeleteyn="
				+ nvDeleteyn + ", ttNo=" + ttNo + ", ttName=" + ttName
				+ ", nvViews=" + nvViews + ", nvLikes=" + nvLikes + "]";
	}
	
	public String getNvNo() {
		return nvNo;
	}
	public void setNvNo(String nvNo) {
		this.nvNo = nvNo;
	}
	public String getNvTitle() {
		return nvTitle;
	}
	public void setNvTitle(String nvTitle) {
		this.nvTitle = nvTitle;
	}
	public String getNvVideo() {
		return nvVideo;
	}
	public void setNvVideo(String nvVideo) {
		this.nvVideo = nvVideo;
	}
	public String getNvInsertdate() {
		return nvInsertdate;
	}
	public void setNvInsertdate(String nvInsertdate) {
		this.nvInsertdate = nvInsertdate;
	}
	public String getNvUpdatedate() {
		return nvUpdatedate;
	}
	public void setNvUpdatedate(String nvUpdatedate) {
		this.nvUpdatedate = nvUpdatedate;
	}
	public String getNvDeleteyn() {
		return nvDeleteyn;
	}
	public void setNvDeleteyn(String nvDeleteyn) {
		this.nvDeleteyn = nvDeleteyn;
	}
	public String getTtNo() {
		return ttNo;
	}
	public void setTtNo(String ttNo) {
		this.ttNo = ttNo;
	}
	public String getNvViews() {
		return nvViews;
	}
	public void setNvViews(String nvViews) {
		this.nvViews = nvViews;
	}
	public String getNvLikes() {
		return nvLikes;
	}
	public void setNvLikes(String nvLikes) {
		this.nvLikes = nvLikes;
	}

	public String getTtName() {
		return ttName;
	}

	public void setTtName(String ttName) {
		this.ttName = ttName;
	}             
	
}