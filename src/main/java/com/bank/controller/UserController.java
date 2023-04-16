package com.bank.controller;

import com.bank.dto.edit.PasswordEdit;
import com.bank.dto.edit.UserEdit;
import com.bank.dto.in.UserIn;
import com.bank.dto.out.UserOut;
import com.bank.models.user.UserRole;
import com.bank.services.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
