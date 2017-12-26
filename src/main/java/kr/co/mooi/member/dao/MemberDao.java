package kr.co.mooi.member.dao;

import kr.co.mooi.member.domain.Member;

public interface MemberDao {

	public int login(Member member);
	
	public int regist(Member member);
	
	public Member select(int memberNo);
	
	public Member selectById(String id);
}
