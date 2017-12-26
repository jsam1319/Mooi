package kr.co.mooi;

import org.junit.Test;

import kr.co.mooi.member.util.RSAKeySet;
import kr.co.mooi.member.util.RSAUtil;

public class RSATest {

	@Test
	public void test() throws Exception {
	
		RSAKeySet keySet = new RSAKeySet();
		
		String pw1 = "123456";
		String pw2 = "234567";
		
		String en1 = RSAUtil.encrypte(keySet, pw1);
		String en2 = RSAUtil.encrypte(keySet, pw2);
		
		System.out.println(RSAUtil.decrypte(keySet, en1));
		System.out.println(RSAUtil.decrypte(keySet, en2));
		
		
		
	}

}
