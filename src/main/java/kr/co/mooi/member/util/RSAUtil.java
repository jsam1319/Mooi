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

	public static String decrypte(Key privateKey, String password) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		byte[] encryptedBytes = hexToByteArray(password);

		String plainPw = null;

		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] arrData = cipher.doFinal(encryptedBytes);
		plainPw = new String(arrData, "utf-8");

		return plainPw;
	}

	private static byte[] hexToByteArray(String hex) {
		if (hex == null || hex.length() % 2 != 0) return new byte[] {};
		byte[] bytes = new byte[hex.length() / 2];
		
		for (int i = 0; i < hex.length(); i += 2) {
			byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
			bytes[(int) Math.floor(i / 2)] = value;
		}
		
		return bytes;
	}

}
