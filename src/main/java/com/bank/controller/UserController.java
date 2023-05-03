package com.bank.controller;

import com.bank.dto.edit.PasswordEdit;
import com.bank.dto.edit.UserEdit;
import com.bank.dto.in.UserIn;
import com.bank.dto.out.UserOut;
import com.bank.models.user.User;
import com.bank.models.user.UserRole;
import com.bank.services.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping
    public UserOut create(@Valid @RequestBody UserIn userIn) {
        return userService.create(userIn);
    }

    @RequestMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null){
            System.out.println("Your username or password is invalid.");
            model.addAttribute("error", "Your username or password is invalid.");
        }
        if (logout != null){
            System.out.println("You have been logged out successfully.");
            model.addAttribute("message", "You have been logged out successfully.");
        }

        return "login";
    }
    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "register";
    }
    @PostMapping("/registration")
    public String addUser(@ModelAttribute("userForm") UserIn userForm, BindingResult bindingResult, Model model) {
        UserOut user = userService.findByEmail(userForm.getEmail());

        if( user != null){
            model.addAttribute("userError", "This name already exists");
            System.out.println("This name already exists");
            return "register";
        }
        if (userForm.getEmail().length() < 10 || userForm.getEmail().length() > 100){
            model.addAttribute("userEmailError", "Please enter between 10-100 characters and valid input");
            System.out.println("Please enter between 10-100 characters and valid input");
            return "register";
        }
        if ( userForm.getAddress().getPhoneNumber().length() != 12){
            model.addAttribute("userMobileError", "Please enter atleast 10 digits");
            System.out.println("Please enter atleast 10 digits");
            return "register";
        }
        if (userForm.getPassword().length() == 0){
            model.addAttribute("passwordError", "Password not equals");
            System.out.println("Password not equals");
            return "register";
        }
        if (bindingResult.hasErrors()) {
            System.out.println("Has Error");
            return "register";
        }
        userService.createEmployee(userForm);
        model.addAttribute("email", userForm.getEmail());

        return "login";
    }
    @GetMapping("/profile")
    public String user(Model model) {
        String user =  SecurityContextHolder.getContext().getAuthentication().getName();
        UserOut userOut = userService.findByIdentifier(user);
        model.addAttribute("userAccount", userOut);
        model.addAttribute("passwordForm", new PasswordEdit());
        return "user";
    }
    @PostMapping("/profile")
    public String passwordEdit(Model model, PasswordEdit passwordEdit,
                               HttpServletRequest request, HttpServletResponse response) {
        String user =  SecurityContextHolder.getContext().getAuthentication().getName();
        UserOut userOut = userService.findByIdentifier(user);
        model.addAttribute("userAccount", userOut);
        userService.updatePassword(passwordEdit);
        model.addAttribute("passwordForm", new PasswordEdit());
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/user/login";
    }
    @PostMapping("/create/employee")
    @Secured("ROLE_ADMIN")
    public UserOut createEmployee(@RequestBody @Valid UserIn userIn) {
        return userService.createEmployee(userIn);
    }

    @GetMapping("/type/{type}")
    public List<UserOut> findByUserType(@PathVariable("type") UserRole.UserType userType,
                                        @RequestParam("disabledOnly")  Optional<String> disabledOnly ){
      if(disabledOnly.isPresent()){
          return userService.findAllByUserTypeAndNotEnabled(userType);
      }else{
          return userService.findAllByUserType(userType);
      }
    }

    @GetMapping("/{id}")
    @PreAuthorize("isAuthenticated()")
    public UserOut findById(@PathVariable("id") Long id) {
        return userService.findById(id);
    }

    @PutMapping("/{id}")
    @Secured({"ROLE_ADMIN", "ROLE_EMPLOYEE"})
    public UserOut update(@PathVariable("id") Long id,
                          @RequestBody @Valid UserEdit userEdit) {
        return userService.update(id, userEdit);
    }

    @GetMapping("/byIdentifier/{identifier}")
    public UserOut findByIdentifier(@PathVariable("identifier") String identifier) {
        return userService.findByIdentifier(identifier);
    }

    @PatchMapping("/{id}/status")
    @Secured({"ROLE_ADMIN", "ROLE_EMPLOYEE"})
    public UserOut changeLockStatus(@PathVariable("id") Long id) {
        return userService.changeStatus(id);
    }

    @PatchMapping("/{id}/activate")
    @Secured({"ROLE_ADMIN", "ROLE_EMPLOYEE"})
    public UserOut changeEnableStatus(@PathVariable("id") Long id){
        return userService.changeEnableStatus(id);
    }

    @GetMapping("/auth/current")
    @PreAuthorize("isAuthenticated()")
    public UserOut findCurrentUser(){
        return userService.findCurrentUser();
    }


    @PatchMapping("/password/edit")
    public UserOut updatePassword(@Valid @RequestBody PasswordEdit passwordEdit){
        return userService.updatePassword(passwordEdit);
    }
}
