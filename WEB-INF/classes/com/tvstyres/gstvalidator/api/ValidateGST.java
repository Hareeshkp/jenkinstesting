package com.tvstyres.gstvalidator.api;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
 
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
public class ValidateGST {

	
	public static String GstValidate(String urll,String token,String clientcode,String gstin,String gstforvalidation) throws NoSuchAlgorithmException, KeyManagementException, IOException
	{
		 TrustManager[] trustAllCerts = new TrustManager[] {new X509TrustManager() {
             public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                 return null;
             }
             public void checkClientTrusted(X509Certificate[] certs, String authType) {
             }
             public void checkServerTrusted(X509Certificate[] certs, String authType) {
             }
         }
     };

     // Install the all-trusting trust manager
     SSLContext sc = SSLContext.getInstance("SSL");
     sc.init(null, trustAllCerts, new java.security.SecureRandom());
     HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

     // Create all-trusting host name verifier
     HostnameVerifier allHostsValid = new HostnameVerifier() {
         public boolean verify(String hostname, SSLSession session) {
             return true;
         }
     };

     // Install the all-trusting host verifier
     HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);

 URL url = new URL(urll);
     
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
     conn.setDoOutput(true);
     conn.setRequestMethod("POST");
		String code="bearer"+token;
		conn.setRequestProperty("Authorization",code);
		conn.setRequestProperty("clientCode",clientcode);
		conn.setRequestProperty("Content-Type","application/json");
		conn.setRequestProperty("gstin",gstin);
		String input = "{\"gstin\":\""+gstforvalidation+"\"}";
		OutputStream os = conn.getOutputStream();
		os.write(input.getBytes());
		os.flush();
		BufferedReader br = new BufferedReader(new InputStreamReader(
				(conn.getInputStream())));
		String output;
		String status=null;
		while ((output = br.readLine()) != null) {
			String s[]=output.split("activeStatus");
			String dd=s[1];
		 status=dd.substring(5,11);
		}
		conn.disconnect();
		return status;
	}
	
	
}
