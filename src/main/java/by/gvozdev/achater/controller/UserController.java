package by.gvozdev.achater.controller;

import by.gvozdev.achater.domain.Country;
import by.gvozdev.achater.domain.Role;
import by.gvozdev.achater.domain.User;
import by.gvozdev.achater.repos.CountryRepository;
import by.gvozdev.achater.repos.UserRepository;
import by.gvozdev.achater.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private CountryRepository countryRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());
        return "userList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @Transactional
    @GetMapping("/deleteUser/{user}")
    public String deleteUser(@PathVariable User user) {
        User u = userRepo.findByUsername(user.getUsername());
        System.out.println(u.getId());
        userRepo.deleteById(u.getId());
        return "redirect:/user";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @Transactional
    @GetMapping("/blockUser/{user}")
    public String blockUser(@PathVariable User user) {
        User u = userRepo.findByUsername(user.getUsername());
        System.out.println(u.getId());

        if (u.isBlockInApp() == true) {
            u.setBlockInApp(false);
        } else {
            u.setBlockInApp(true);
        }

        userRepo.save(u);
        return "redirect:/user";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String usertel,
            @RequestParam String useremail,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user,
            @RequestParam("file") MultipartFile file
    ) throws IOException {

        userService.saveUser(user, username, password, usertel, useremail, form, file);

        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("password", user.getPassword());
        model.addAttribute("useremail", user.getUseremail());
        model.addAttribute("usertel", user.getUsertel());
        model.addAttribute("filename", user.getFilename());
        model.addAttribute("block", user.isBlockInApp());
        model.addAttribute("datereg", user.getDateReg());
        model.addAttribute("country", user.getCountry());
        model.addAttribute("skype", user.getSkype());
        model.addAttribute("adress", user.getAdress());
        model.addAttribute("facebook", user.getFacebook());
        model.addAttribute("google", user.getGoogle());
        model.addAttribute("linkedin", user.getLinkedin());
        model.addAttribute("vk", user.getVk());
        model.addAttribute("twitter", user.getTwitter());


        Iterable<Country> countries = countryRepo.findAll();
        model.addAttribute("countries", countries);

        return "profile";
    }

    @PostMapping("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam String password,
            @RequestParam String useremail,
            @RequestParam String usertel,
            @RequestParam String countyname,
            @RequestParam String skype,
            @RequestParam String adress,
            @RequestParam String facebook,
            @RequestParam String google,
            @RequestParam String linkedin,
            @RequestParam String vk,
            @RequestParam String twitter,
            @RequestParam MultipartFile filename
    ) throws IOException {
        userService.updateProfile(
                user,
                password,
                useremail,
                usertel,
                countyname,
                skype,
                adress,
                facebook,
                google,
                linkedin,
                vk,
                twitter,
                filename);
        return "redirect:/user/profile";
    }

}