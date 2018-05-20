package by.gvozdev.achater.service;

/**
 * Created by Gvozdev A.N. on 05.2018.
 */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailSender {

    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String username;


    public void send(String emailTo, String subject, String message) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();

        mailMessage.setFrom(username);
        mailMessage.setTo(emailTo);
        mailMessage.setSubject(subject);
        mailMessage.setText(message);

        System.out.println("------------------------------------------");
        System.out.println(username);
        System.out.println(emailTo);
        System.out.println(subject);
        System.out.println(message);
        System.out.println("------------------------------------------");

        mailSender.send(mailMessage);
    }
}