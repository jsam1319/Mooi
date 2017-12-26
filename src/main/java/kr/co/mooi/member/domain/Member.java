package kr.co.mooi.member.domain;

public class Member {

	int memberNo;
	String id;
	String password;
	String name;
	String email;
	String hp;
	String state;
	String postcode;
	String address;
	String publicKey;
	String privateKey;
	
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(int memberNo, String id, String password, String name, String email, String hp, String state,
			String postcode, String address, String publicKey, String privateKey) {
		super();
		this.memberNo = memberNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.email = email;
		this.hp = hp;
		this.state = state;
		this.postcode = postcode;
		this.address = address;
		this.publicKey = publicKey;
		this.privateKey = privateKey;
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


	public String getHp() {
		return hp;
	}


	public void setHp(String hp) {
		this.hp = hp;
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


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPublicKey() {
		return publicKey;
	}


	public void setPublicKey(String publicKey) {
		this.publicKey = publicKey;
	}


	public String getPrivateKey() {
		return privateKey;
	}


	public void setPrivateKey(String privateKey) {
		this.privateKey = privateKey;
	}


	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", id=" + id + ", password=" + password + ", name=" + name + ", email="
				+ email + ", hp=" + hp + ", state=" + state + ", postcode=" + postcode + ", address=" + address
				+ ", publicKey=" + publicKey + ", privateKey=" + privateKey + "]";
	}
	
	
	
	
}
