package com.tvstyres.gstvalidator.api;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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
public class Token {
	
	public static String generateToken(String urll,String username,String password) throws NoSuchAlgorithmException, KeyManagementException, IOException
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
        conn.setRequestMethod("GET");
		conn.setRequestProperty("username",username);
		conn.setRequestProperty("password",password);
		conn.setRequestProperty("Content-Type","application/json");
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
        String output;
		String token=null;
		while ((output = br.readLine()) != null) {
			String s[]=output.split("refresh_token");
			String dd=s[0];
			String yy[]=dd.split(":");
			String zz=yy[1];
			String mm=zz.replace("\"","");
		    token=mm.replaceAll("[,]","");
		}
conn.disconnect();
return token;
	}

}
