<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
   String result;

   // Recipient's email ID needs to be mentioned.
   String to = "to@gmail.com";

   // Sender's email ID needs to be mentioned
   String from = "from@gmail.com";
   String password = "password";

   // Assuming you are sending email from localhost
   String host = "smtp.gmail.com";
   String port = "465";

   // Get system properties object
   Properties properties = System.getProperties();

   // Setup mail server
   properties.put("mail.smtp.user", from);
   properties.put("mail.smtp.host", host);
   properties.put("mail.smtp.port", port);
   properties.put("mail.smtp.starttls.enable", "true");
   properties.put("mail.smtp.debug", "true");
   properties.put("mail.smtp.auth", "true");
   properties.put("mail.smtp.socketFactory.port", port);
   properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
   properties.put("mail.smtp.socketFactory.fallback", "false");

   // Get the default Session object.
//   Session mailSession = Session.getDefaultInstance(properties);
   Session mailSession = Session.getInstance(properties,
           new Authenticator(){
              protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(from, password);
              }});
   mailSession.setDebug(true);

   try {
      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailSession);

      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));

      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
              new InternetAddress(to));
      // Set Subject: header field
      message.setSubject("This is the Subject Line!");

      // Now set the actual message
      message.setText("This is actual message");

      // Send message
      Transport transport = mailSession.getTransport("smtps");
      transport.connect(host, Integer.valueOf(port), from, password);
      transport.sendMessage(message, message.getAllRecipients());
      transport.close();
      result = "Sent message successfully....";
   } catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
%>

<html>
<head>
   <title>Send Email using JSP</title>
</head>

<body>
<center>
   <h1>Send Email using JSP</h1>
</center>

<p align = "center">
   <%
      out.println("Result: " + result + "\n");
   %>
</p>
</body>
</html>