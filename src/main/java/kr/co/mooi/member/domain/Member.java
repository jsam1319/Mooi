package kr.co.mooi.member.domain;

public class Member {

	int memberNo;
	String id;
	String password;
	String address;
	String remainAddr;
	String name;
	String email;
	String phone;
	String regdate;
	String state;
	String postcode;
	String gender;
	String sessionKey;
	String sessionLimit;
	
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Member(int memberNo, String id, String password, String address, String remainAddr, String name,
			String email, String phone, String regdate, String state, String postcode, String gender, String sessionKey,
			String sessionLimit) {
		super();
		this.memberNo = memberNo;
		this.id = id;
		this.password = password;
		this.address = address;
		this.remainAddr = remainAddr;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.regdate = regdate;
		this.state = state;
		this.postcode = postcode;
		this.gender = gender;
		this.sessionKey = sessionKey;
		this.sessionLimit = sessionLimit;
	}

	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemainAddr() {
		return remainAddr;
	}
	public void setRemainAddr(String remainAddr) {
		this.remainAddr = remainAddr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSessionKey() {
		return sessionKey;
	}
	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}
	public String getSessionLimit() {
		return sessionLimit;
	}
	public void setSessionLimit(String sessionLimit) {
		this.sessionLimit = sessionLimit;
	}
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", id=" + id + ", password=" + password + ", address=" + address
				+ ", remainAddr=" + remainAddr + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", regdate=" + regdate + ", state=" + state + ", postcode=" + postcode + ", gender=" + gender
				+ ", sessionKey=" + sessionKey + ", sessionLimit=" + sessionLimit + "]";
	}
	
	
	
}
