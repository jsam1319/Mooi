package kr.co.mooi.member.service;

import java.security.Key;

import kr.co.mooi.member.domain.Member;

public interface MemberService {

	public Member login(Member member, Key privateKey) throws Exception;
	
	public int regist(Member member, Key privateKey) throws Exception;
	
	public int updateSession(Member member);
	
	public Member autoLogin(String sessionKey);
	
	public Member select(int memberNo);
	
	public Member selectById(String id);
}
