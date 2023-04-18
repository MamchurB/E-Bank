package com.bank.services.interfaces;

import com.bank.dto.edit.PasswordEdit;
import com.bank.dto.edit.UserEdit;
import com.bank.dto.in.UserIn;
import com.bank.dto.out.UserOut;
import com.bank.models.user.UserRole;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    UserOut create(UserIn userIn);

    UserOut findCurrentUser();

    List<UserOut> findAllByUserType(UserRole.UserType userType);

    UserOut findById(Long id);

    UserOut update(Long id, UserEdit userEdit);

    UserOut createEmployee(UserIn userIn);

    UserOut changeStatus(Long id);

    UserOut findByEmail(String email);

    UserOut findByIdentifier(String identifier);

    List<UserOut> findAllByUserTypeAndNotEnabled(UserRole.UserType userType);

    UserOut changeEnableStatus(Long id);

    UserOut updatePassword(PasswordEdit passwordEdit);
}
