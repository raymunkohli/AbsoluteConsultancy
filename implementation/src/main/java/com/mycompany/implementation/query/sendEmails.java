/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.implementation.query;

import com.mycompany.implementation.domain.Customer;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author raymu
 */
public class sendEmails {

    Properties props = new Properties();
    Session session;

    public sendEmails() {
        
        //connect to smtp server using ssl (because gmail will only accept ssl connection )
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("bapersCityUni@gmail.com", "Cq,7&x5JKS35p=Uw");
            }
        });

    }

    public void sendFirstLetterReminder(String sendto,String name) {
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("bapersCityUni@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(sendto));
            message.setSubject("First Reminder");
            message.setText("Dear "+name+" \n"
                    + "According to our records you have failed to submit a payment for the jobs submitted to The Lab. This is a reminder letter to inform you about the due payments.\n"
                    + "Please understand that The Lab takes outstanding payments seriously and the second reminder will include further action to your account. \n"
                    + "\n"
                    + "If you have already submitted a payment, please disregard this letter.\n"
                    + "\n"
                    + "Yours sincerely\n"
                    + "G. Lancaster\n"
                    + "The Lab\n"
                    + "Bloomsburys Image Processing Laboratory ");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void sendSecondLetterReminder(String sendto,String name) {
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("bapersCityUni@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(sendto));
            message.setSubject("Second Reminder");
            message.setText("Dear "+name+"\n"
                    + "I am writing to inform you about the outstanding fees for your submitted job at The Lab.\n"
                    + "According to our records you have not submitted a payment after the first reminder and your account is currently suspended, meaning you are not able to create any further jobs.\n"
                    + "This will be the final formal reminder for your outstanding payments.\n"
                    + "\n"
                    + "We take outstanding payments seriously at The Lab, and the next step will be taking legal action against you.\n"
                    + "\n"
                    + "Your Sincerely,\n"
                    + "G. Lancaster\n"
                    + "The Lab\n"
                    + "Blomsburys Image Processing Laboratory");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
