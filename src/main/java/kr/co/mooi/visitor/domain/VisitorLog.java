package kr.co.mooi.visitor.domain;

public class VisitorLog {

	int visitorLogNo;
	int memberNo;
	String regdate;
	
	
	public VisitorLog() {
		super();
		// TODO Auto-generated constructor stub
	}


	public VisitorLog(int visitorLogNo, int memberNo, String regdate) {
		super();
		this.visitorLogNo = visitorLogNo;
		this.memberNo = memberNo;
		this.regdate = regdate;
	}


	public int getVisitorLogNo() {
		return visitorLogNo;
	}


	public void setVisitorLogNo(int visitorLogNo) {
		this.visitorLogNo = visitorLogNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "VisitorLog [visitorLogNo=" + visitorLogNo + ", memberNo=" + memberNo + ", regdate=" + regdate + "]";
	}

	
}
