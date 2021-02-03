package ssm.cm.vo;

import ssm.common.vo.CommonVO;
import ssm.mi.vo.TMemberVO;

public class NoticeBoardVO extends CommonVO{

	private String nbNo;
	private String ttNo;
	private String nbTitle;
	private String nbContents;
	private String nbFile;
	private String nbInsertdate;
	private String nbUpdatedate;
	private String nbDeleteyn;
	private int    nbViews;
	private TMemberVO tMembervo;
	
	public TMemberVO gettMembervo() {
		return tMembervo;
	}
	public void settMembervo(TMemberVO tMembervo) {
		this.tMembervo = tMembervo;
	}
	
	public String getNbNo() {
		return nbNo;
	}
	public void setNbNo(String nbNo) {
		this.nbNo = nbNo;
	}
	public String getTtNo() {
		return ttNo;
	}
	public void setTtNo(String ttNo) {
		this.ttNo = ttNo;
	}
	public String getNbTitle() {
		return nbTitle;
	}
	public void setNbTitle(String nbTitle) {
		this.nbTitle = nbTitle;
	}
	public String getNbContents() {
		return nbContents;
	}
	public void setNbContents(String nbContents) {
		this.nbContents = nbContents;
	}
	public String getNbFile() {
		return nbFile;
	}
	public void setNbFile(String nbFile) {
		this.nbFile = nbFile;
	}
	public String getNbInsertdate() {
		return nbInsertdate;
	}
	public void setNbInsertdate(String nbInsertdate) {
		this.nbInsertdate = nbInsertdate;
	}
	public String getNbUpdatedate() {
		return nbUpdatedate;
	}
	public void setNbUpdatedate(String nbUpdatedate) {
		this.nbUpdatedate = nbUpdatedate;
	}
	public String getNbDeleteyn() {
		return nbDeleteyn;
	}
	public void setNbDeleteyn(String nbDeleteyn) {
		this.nbDeleteyn = nbDeleteyn;
	}
	public int getNbViews() {
		return nbViews;
	}
	public void setNbViews(int nbViews) {
		this.nbViews = nbViews;
	}
	
	@Override
	public String toString() {
		return "NoticeBoardVO [nbNo=" + nbNo + ", ttNo=" + ttNo + ", nbTitle="
				+ nbTitle + ", nbContents=" + nbContents + ", nbFile=" + nbFile
				+ ", nbInsertdate=" + nbInsertdate + ", nbUpdatedate="
				+ nbUpdatedate + ", nbDeleteyn=" + nbDeleteyn + ", nbViews="
				+ nbViews + ", tMembervo=" + tMembervo + "]";
	}
	
	
	
}
