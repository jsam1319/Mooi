package kr.co.mooi.member.service;

import kr.co.mooi.member.domain.Member;

public interface MemberService {

	public int login(Member member) throws Exception;
	
	public int regist(Member member) throws Exception ;
}
