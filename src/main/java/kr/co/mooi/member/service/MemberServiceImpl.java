package kr.co.mooi.member.service;

import java.security.Key;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mooi.member.dao.MemberDao;
import kr.co.mooi.member.domain.Member;
import kr.co.mooi.member.util.RSAUtil;
import kr.co.mooi.member.util.SHA256Util;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDao memberDao;
	
	@Override
	public Member login(Member member, Key privateKey) throws Exception {
		member.setPassword(RSAUtil.decrypte(privateKey, member.getPassword()));
		member.setPassword(SHA256Util.hashing(member.getPassword()));
		
		return memberDao.isMember(member); 
	}

	@Override
	public int regist(Member member, Key privateKey) throws Exception {
		member.setPassword(RSAUtil.decrypte(privateKey, member.getPassword()));
        member.setPassword(SHA256Util.hashing(member.getPassword()));
		
		return memberDao.regist(member);
	}
	
	public int updateSession(Member member) {
		return memberDao.updateSession(member);
	}
	
	public Member autoLogin(String sessionKey) {
		return memberDao.autoLogin(sessionKey);
	}
	
	public Member select(int memberNo) {
		return memberDao.select(memberNo);
	}
}