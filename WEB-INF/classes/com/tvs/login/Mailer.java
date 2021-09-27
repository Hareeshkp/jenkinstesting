
package com.tvs.login;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class Mailer {
	public static void send(String to, String subject, String msgs) {

		String host = "webmail.tvstyres.com";
		final String user = "itlab@tvstyres.com";
		final String password = "Redm!6pr0";

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			message.setText(msgs);
			// send the message
			Transport.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}