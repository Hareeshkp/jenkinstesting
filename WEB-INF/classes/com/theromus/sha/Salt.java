package com.theromus.sha;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class Salt {
	
	public static byte[] getSalt() 
	{
	    SecureRandom sr=null;
		try {
			sr = SecureRandom.getInstance("SHA1PRNG");
		} catch (NoSuchAlgorithmException e) {

			e.printStackTrace();
		}
	    byte[] salt = new byte[16];
	    sr.nextBytes(salt);
	    return salt;
	}

}
