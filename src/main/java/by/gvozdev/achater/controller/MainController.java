package by.gvozdev.achater.controller;

/**
 * Created by Gvozdev A.N. on 05.2018.
 */

import by.gvozdev.achater.domain.Message;
import by.gvozdev.achater.domain.User;
import by.gvozdev.achater.repos.MessageRepository;
import by.gvozdev.achater.repos.StatusRepository;
import by.gvozdev.achater.service.DateStamp;
import by.gvozdev.achater.service.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class MainController {

    UtilController utilController = new UtilController();

    @Autowired
    private FileUploader fileUploader;

    @Autowired
    private DateStamp dateStamp;

    @Autowired
    private MessageRepository messageRepo;

    @Autowired
    private StatusRepository statusRepository;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<Message> messages = messageRepo.findAll();
        if (filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else {
            messages = messageRepo.findAll();
        }
        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping("/newMsg")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file
    ) throws Exception {
        message.setAuthor(user);

        if(bindingResult.hasErrors()){
            Map<String, String> errorMap = utilController.getErrors(bindingResult);
            model.mergeAttributes(errorMap);
            model.addAttribute("message", message);
        } else {
            if (file != null && !file.getOriginalFilename().isEmpty()) {
                String resultFilename = fileUploader.loadFile(file);
                System.out.println(resultFilename);
                message.setFilename(resultFilename);
            }
            message.setDateon(dateStamp.dateStamp());
            model.addAttribute("message", null);
            messageRepo.save(message);
        }
        Iterable<Message> messages = messageRepo.findAll();
        model.addAttribute("messages", messages);
        return "main";
    }
}