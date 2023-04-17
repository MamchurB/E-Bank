package com.bank.mappers;

import com.bank.dto.in.UserIn;
import com.bank.dto.out.UserOut;
import com.bank.models.user.User;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring", uses = AddressMapper.class)
public interface UserMapper {
    User userInToUser(UserIn userIn);
    UserOut userToUserOut(User user);
}
