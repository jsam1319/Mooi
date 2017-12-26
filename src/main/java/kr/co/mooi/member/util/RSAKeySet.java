package kr.co.mooi.member.util;

import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

public class RSAKeySet {

	private Key publicKey;
	private Key privateKey;
	
	public RSAKeySet() throws Exception {
		KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
		keyPairGenerator.initialize(1024);
		KeyPair keyPair = keyPairGenerator.genKeyPair();
		
		publicKey = keyPair.getPublic(); // 공개키
		privateKey = keyPair.getPrivate();
	}
	
	public RSAKeySet(String encodedPublic, String encodedPrivate) throws Exception {
		Decoder decoder = Base64.getDecoder();
		
		publicKey = KeyFactory.getInstance("RSA").generatePublic(
				new X509EncodedKeySpec(decoder.decode(encodedPublic)));
		privateKey = KeyFactory.getInstance("RSA").generatePublic(
				new X509EncodedKeySpec(decoder.decode(encodedPrivate)));
	}
	
	public Key getPublicKey() {
		return publicKey;
	}
	
	public Key getPrivateKey() {
		return privateKey;
	}
	
	public String getEncodedPublic() {
		Encoder encoder = Base64.getEncoder();
		return encoder.encodeToString(publicKey.getEncoded());
	}
	
	public String getEncodedPrivate() {
		Encoder encoder = Base64.getEncoder();
		return encoder.encodeToString(privateKey.getEncoded());
	}
	
	
}
