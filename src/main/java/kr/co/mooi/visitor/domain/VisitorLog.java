package kr.co.mooi.visitor.domain;

public class VisitorLog {

	int visitorLogNo;
	int memberNo;
	String regdate;
	String ipAddr;
	
	public VisitorLog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public VisitorLog(int visitorLogNo, int memberNo, String regdate, String ipAddr) {
		super();
		this.visitorLogNo = visitorLogNo;
		this.memberNo = memberNo;
		this.regdate = regdate;
		this.ipAddr = ipAddr;
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
	public String getIpAddr() {
		return ipAddr;
	}
	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}
	@Override
	public String toString() {
		return "VisitorLog [visitorLogNo=" + visitorLogNo + ", memberNo=" + memberNo + ", regdate=" + regdate
				+ ", ipAddr=" + ipAddr + "]";
	}
	
}
