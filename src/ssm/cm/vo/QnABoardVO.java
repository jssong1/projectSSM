package ssm.cm.vo;

import ssm.common.vo.CommonVO;
import ssm.mi.vo.SMemberVO;

public class QnABoardVO extends CommonVO{

	private String qbNo;
	private String ssNo;
	private String qbTitle;
	private String qbContents;
	private String qbInsertdate;
	private String qbUpdatedate;
	private String qbDeleteyn;
	private String qbSecretyn;
	private String qbPw;
	private String qaCount;
	private String qbType;
	private int    qbViews;
	private SMemberVO sMembervo;
	
	public SMemberVO getsMembervo() {
		return sMembervo;
	}
	public void setsMembervo(SMemberVO sMembervo) {
		this.sMembervo = sMembervo;
	}
	
	public String getQbNo() {
		return qbNo;
	}
	public void setQbNo(String qbNo) {
		this.qbNo = qbNo;
	}
	public String getSsNo() {
		return ssNo;
	}
	public void setSsNo(String ssNo) {
		this.ssNo = ssNo;
	}
	public String getQbTitle() {
		return qbTitle;
	}
	public void setQbTitle(String qbTitle) {
		this.qbTitle = qbTitle;
	}
	public String getQbContents() {
		return qbContents;
	}
	public void setQbContents(String qbContents) {
		this.qbContents = qbContents;
	}
	public String getQbInsertdate() {
		return qbInsertdate;
	}
	public void setQbInsertdate(String qbInsertdate) {
		this.qbInsertdate = qbInsertdate;
	}
	public String getQbUpdatedate() {
		return qbUpdatedate;
	}
	public void setQbUpdatedate(String qbUpdatedate) {
		this.qbUpdatedate = qbUpdatedate;
	}
	public String getQbDeleteyn() {
		return qbDeleteyn;
	}
	public void setQbDeleteyn(String qbDeleteyn) {
		this.qbDeleteyn = qbDeleteyn;
	}
	public String getQbSecretyn() {
		return qbSecretyn;
	}
	public void setQbSecretyn(String qbSecretyn) {
		this.qbSecretyn = qbSecretyn;
	}
	public String getQaCount() {
		return qaCount;
	}
	public void setQaCount(String qaCount) {
		this.qaCount = qaCount;
	}
	public String getQbPw() {
		return qbPw;
	}
	public void setQbPw(String qbPw) {
		this.qbPw = qbPw;
	}
	public int getQbViews() {
		return qbViews;
	}
	public void setQbViews(int qbViews) {
		this.qbViews = qbViews;
	}
	public String getQbType() {
		return qbType;
	}
	public void setQbType(String qbType) {
		this.qbType = qbType;
	}
	
	
	
	
	
	
}
