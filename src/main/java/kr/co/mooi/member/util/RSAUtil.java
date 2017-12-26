package kr.co.mooi.member.util;

import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;

public class RSAUtil {
	
	private RSAUtil() {}
	
	public static String encrypte(RSAKeySet keySet, String password) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		Encoder encoder = Base64.getEncoder();
		
		String encodedPw = null;

		cipher.init(Cipher.ENCRYPT_MODE, keySet.getPublicKey());
		byte[] encrpyte = cipher.doFinal(password.getBytes()); 
		encodedPw = encoder.encodeToString(encrpyte);

		return encodedPw;
	}
	
	public static String decrypte(RSAKeySet keySet, String password) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		Decoder decoder = Base64.getDecoder();
		
		String plainPw = null;
		
		cipher.init(Cipher.DECRYPT_MODE, keySet.getPrivateKey());
		byte[] arrData = cipher.doFinal(decoder.decode(password));
		plainPw = new String(arrData);
		
		return plainPw; 
	}

}
