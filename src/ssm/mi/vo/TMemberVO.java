package ssm.mi.vo;

import java.util.List;

public class TMemberVO {
	
		/**ttNo
		ttName
		ttBirth
		ttGender
		ttAuthority
		sjtCode
		ttId
		ttPw
		ttTransferyear
		ttPn
		ttEmail
		ttImage
		ttDeleteyn
		ttInsertdate
		ttUpdatedate
		List<TMemberVO> tMemberList;
		ttGrade;
		ttClass;
		**/
	private String ttNo;
	private String ttName;
	private String ttBirth;
	private String ttGender;
	private String ttAuthority;
	private String sjtCode;
	private String ttId;
	private String ttPw;
	private String ttTransferyear;
	private String ttPn;
	private String ttEmail;
	private String ttImage;
	private String ttGrade;
	private String ttClass;
	private String ttDeleteyn;
	private String ttInsertdate;
	private String ttUpdatedate;
	private String ttAdmindate;
	private List<TMemberVO> tMemberList;
	
	public String getTtNo() {
		return ttNo;
	}
	public void setTtNo(String ttNo) {
		this.ttNo = ttNo;
	}
	public String getTtName() {
		return ttName;
	}
	public void setTtName(String ttName) {
		this.ttName = ttName;
	}
	public String getTtBirth() {
		return ttBirth;
	}
	public void setTtBirth(String ttBirth) {
		this.ttBirth = ttBirth;
	}
	public String getTtGender() {
		return ttGender;
	}
	public void setTtGender(String ttGender) {
		this.ttGender = ttGender;
	}
	public String getTtAuthority() {
		return ttAuthority;
	}
	public void setTtAuthority(String ttAuthority) {
		this.ttAuthority = ttAuthority;
	}
	public String getSjtCode() {
		return sjtCode;
	}
	public void setSjtCode(String sjtCode) {
		this.sjtCode = sjtCode;
	}
	public String getTtId() {
		return ttId;
	}
	public void setTtId(String ttId) {
		this.ttId = ttId;
	}
	public String getTtPw() {
		return ttPw;
	}
	public void setTtPw(String ttPw) {
		this.ttPw = ttPw;
	}
	public String getTtTransferyear() {
		return ttTransferyear;
	}
	public void setTtTransferyear(String ttTransferyear) {
		this.ttTransferyear = ttTransferyear;
	}
	public String getTtPn() {
		return ttPn;
	}
	public void setTtPn(String ttPn) {
		this.ttPn = ttPn;
	}
	public String getTtEmail() {
		return ttEmail;
	}
	public void setTtEmail(String ttEmail) {
		this.ttEmail = ttEmail;
	}
	public String getTtImage() {
		return ttImage;
	}
	public void setTtImage(String ttImage) {
		this.ttImage = ttImage;
	}
	public String getTtGrade() {
		return ttGrade;
	}
	public void setTtGrade(String ttGrade) {
		this.ttGrade = ttGrade;
	}
	public String getTtClass() {
		return ttClass;
	}
	public void setTtClass(String ttClass) {
		this.ttClass = ttClass;
	}
	public String getTtDeleteyn() {
		return ttDeleteyn;
	}
	public void setTtDeleteyn(String ttDeleteyn) {
		this.ttDeleteyn = ttDeleteyn;
	}
	public String getTtInsertdate() {
		return ttInsertdate;
	}
	public void setTtInsertdate(String ttInsertdate) {
		this.ttInsertdate = ttInsertdate;
	}
	public String getTtUpdatedate() {
		return ttUpdatedate;
	}
	public void setTtUpdatedate(String ttUpdatedate) {
		this.ttUpdatedate = ttUpdatedate;
	}
	public String getTtAdmindate() {
		return ttAdmindate;
	}
	public void setTtAdmindate(String ttAdmindate) {
		this.ttAdmindate = ttAdmindate;
	}
	public List<TMemberVO> gettMemberList() {
		return tMemberList;
	}
	public void settMemberList(List<TMemberVO> tMemberList) {
		this.tMemberList = tMemberList;
	}
	@Override
	public String toString() {
		return "TMemberVO [ttNo=" + ttNo + ", ttName=" + ttName + ", ttBirth="
				+ ttBirth + ", ttGender=" + ttGender + ", ttAuthority="
				+ ttAuthority + ", sjtCode=" + sjtCode + ", ttId=" + ttId
				+ ", ttPw=" + ttPw + ", ttTransferyear=" + ttTransferyear
				+ ", ttPn=" + ttPn + ", ttEmail=" + ttEmail + ", ttImage="
				+ ttImage + ", ttGrade=" + ttGrade + ", ttClass=" + ttClass
				+ ", ttDeleteyn=" + ttDeleteyn + ", ttInsertdate="
				+ ttInsertdate + ", ttUpdatedate=" + ttUpdatedate
				+ ", ttAdmindate=" + ttAdmindate + ", tMemberList="
				+ tMemberList + "]";
	}
	
	
}
