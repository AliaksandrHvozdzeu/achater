package by.gvozdev.achater.service;

import by.gvozdev.achater.domain.Role;
import by.gvozdev.achater.domain.User;
import by.gvozdev.achater.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    DateStamp dateStamp = new DateStamp();

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("${upload.path}")
    private String uploadPath;

    @Value("${activation.code.url}")
    private String activationCodeUrl;

    @Value("${start.logo.user}")
    private String logo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    private void sendMessage(User user) {
        if (!StringUtils.isEmpty(user.getUseremail())) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to ACHATER. \n" +
                            "Please, visit next link: http://" + activationCodeUrl + "/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );
            mailSender.send(user.getUseremail(), "Activation code", message);
        }
    }


    public boolean addUser(User user) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if (userFromDb != null) {
            return false;
        }

        user.setDateReg(dateStamp.dateStamp());
        user.setFilename(logo);

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
        if (!StringUtils.isEmpty(user.getUseremail())) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to ACHATER. \n" +
                            "Please, visit next link: http://" + activationCodeUrl + "/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );
            mailSender.send(user.getUseremail(), "Activation code", message);
        }
        return true;
    }


    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);
        userRepo.save(user);

        return false;
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }


    public void saveUser(User user,
                         String username,
                         String password,
                         String usertel,
                         String useremail,
                         Map<String, String> form,
                         MultipartFile file)
            throws IOException {

        user.setUsername(username);
        user.setPassword(password);
        user.setUsertel(usertel);
        user.setUseremail(useremail);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String resultFilename = file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));
            user.setFilename(resultFilename);
        }

        Set<String> roles = Arrays.stream(Role.values()).map(Role::name).collect(Collectors.toSet());
        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);

    }

    public void updateProfile(
            User user,
            String password,
            String useremail,
            String usertel,
            String countyname,

            String skype,
            String adress,
            String facebook,
            String google,
            String linkedin,
            String vk,
            String twitter,

            MultipartFile filename)
            throws IOException {
        String userEmail = user.getUseremail();

        boolean isEmailChanged = (useremail != null && !useremail.equals(userEmail)) ||
                (userEmail != null && !userEmail.equals(useremail));

        if (isEmailChanged) {
            user.setUseremail(useremail);

            if (!StringUtils.isEmpty(useremail)) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }

        if (!StringUtils.isEmpty(password)) {
            user.setPassword(password);
        }

        ///LOAD NEW FILE
        if (filename != null) {
            String resultFilename = filename.getOriginalFilename();
            filename.transferTo(new File(uploadPath + "/" + resultFilename));
            user.setFilename(resultFilename);
        }

        user.setSkype(skype);
        user.setAdress(adress);
        user.setFacebook(facebook);
        user.setGoogle(google);
        user.setLinkedin(linkedin);
        user.setVk(vk);
        user.setTwitter(twitter);
        user.setCountry(countyname);
        user.setUsertel(usertel);
        userRepo.save(user);

        if (isEmailChanged) {
            sendMessage(user);
        }
    }
}
