package com.bank.repositories;

import com.bank.models.user.User;
import com.bank.models.user.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByIdentifier(String identifier);

    @Query("SELECT u " +
        "FROM User u " +
        "JOIN u.userRoles ur " +
        "WHERE ur.userType = :userType")
    List<User> findAllByUserType(@Param("userType") UserRole.UserType userType);

    @Query("SELECT ur.userType " +
            "FROM User u " +
            "JOIN u.userRoles ur " +
            "WHERE u.identifier = :identifier")
    UserRole.UserType findUserTypeByIdentifier(@Param("identifier") String identifier);

    @Query("SELECT u " +
        "FROM User u " +
        "JOIN u.userRoles ur " +
        "WHERE ur.userType = :userType " +
        "AND u.enabled = false")
    List<User> findAllByUserTypeAndNotEnabled(@Param("userType") UserRole.UserType userType);

    boolean existsByEmail(String email);

    boolean existsByIdentifier(String identifier);

    @Query("FROM User WHERE identifier=:username")
    User findByUsername(@Param("username") String username);

    @Query("FROM User")
    List<User> userList();

    User findByEmailIgnoreCase(String emailId);
}
