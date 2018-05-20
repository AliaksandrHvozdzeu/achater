package by.gvozdev.achater.controller;

/**
 * Created by Gvozdev A.N. on 05.2018.
 */

import by.gvozdev.achater.domain.Message;
import by.gvozdev.achater.domain.User;
import by.gvozdev.achater.repos.MessageRepository;
import by.gvozdev.achater.repos.UserRepository;
import by.gvozdev.achater.service.DateStamp;
import by.gvozdev.achater.service.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MessageController {

    @Autowired
    private DateStamp dateStamp;

    @Autowired
    private FileUploader fileUploader;

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private UserRepository userRepository;


    @GetMapping("/message")
    public String main(@RequestParam(required = false, defaultValue = "") long id, Model model) {
        Message message = messageRepository.findById(id);
        model.addAttribute("message", message);
        return "message";
    }

    @Transactional
    @GetMapping("/delete")
    public String deleteMsg(@RequestParam(required = false, defaultValue = "") long id) {
        System.out.println(id);
        messageRepository.deleteById(id);
        return "redirect:/main";
    }

    @GetMapping("/update")
    public String updateMsg(@RequestParam(required = false, defaultValue = "") long id, Model model) {
        Message message = messageRepository.findById(id);
        model.addAttribute("message", message);
        return "update";
    }

    @PostMapping("/saveMsg")
    public String messageSave(
            @RequestParam long messageId,
            @RequestParam String text,
            @RequestParam String tag,
            @RequestParam("file") MultipartFile file,
            @RequestParam String authorName
    ) throws Exception {

        User user = userRepository.findByUsername(authorName);
        Message message = messageRepository.findById(messageId);

        if (message.getFilename() == null) {
            if (file != null) {
                String resultFilename = fileUploader.loadFile(file);
                message.setFilename(resultFilename);
            } else {
               message.setFilename("");
            }
        } else if (file != null) {
            String resultFilename = fileUploader.loadFile(file);
            message.setFilename(resultFilename);
        }

        message.setId(messageId);
        message.setAuthor(user);
        message.setText(text);
        message.setTag(tag);
        message.setDateon(dateStamp.dateStamp());
        messageRepository.save(message);
        return "redirect:/main";
    }


}
