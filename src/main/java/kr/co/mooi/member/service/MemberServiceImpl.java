package kr.co.mooi.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.mooi.member.dao.MemberDao;
import kr.co.mooi.member.domain.Member;
import kr.co.mooi.member.util.RSAKeySet;
import kr.co.mooi.member.util.RSAUtil;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDao memberDao;
	
	@Override
	public int login(Member member) throws Exception {
		// TODO Auto-generated method stub
		RSAKeySet keySet = new RSAKeySet(member.getPublicKey(), member.getPrivateKey());
		
		
		return 0;
	}

	@Override
	public int regist(Member member) throws Exception {
		// TODO Auto-generated method stub
		RSAKeySet keySet = new RSAKeySet();
		
		member.setPublicKey(keySet.getEncodedPublic());
		member.setPrivateKey(keySet.getEncodedPrivate());
		member.setPassword(RSAUtil.encrypte(keySet, member.getPassword()));
		
		return memberDao.regist(member);
	}
}
