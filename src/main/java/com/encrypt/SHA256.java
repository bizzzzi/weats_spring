package com.encrypt;

import java.security.MessageDigest;
import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class SHA256 {
	
	public static String generateSalt() {

		String result = "";
		Random random = new Random();
		byte[] salt = new byte[10];
		random.nextBytes(salt);
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < salt.length; i++) {
			// byte값을 Hex값으로 바꾸기
			sb.append(String.format("%02x", salt[i]));
		}
		result = sb.toString();
		return result;
	}

	public static String getEncrypt(String rawPassword, String salt) {
		String result = "";
		byte[] b = (rawPassword + salt).getBytes();

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(b); // MessageDigest가 SHA-256으로 암호화된 값을 들고 있음.

			byte[] bResult = md.digest();

			StringBuffer sb = new StringBuffer();
			for (byte data : bResult) {
				sb.append(Integer.toString((data & 0xff) + 256, 16).substring(1));
			}
			result = sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
