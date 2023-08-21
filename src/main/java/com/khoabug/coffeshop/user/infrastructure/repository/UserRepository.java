package com.khoabug.coffeshop.user.infrastructure.repository;

import com.khoabug.coffeshop.common.paging.Pageable;
import com.khoabug.coffeshop.user.model.User;
import com.khoabug.coffeshop.user.model.UserRegisterDTO;

import java.util.List;
import java.util.Optional;

/**
 * @author : DangKhoa
 * @since : 3/2/2023, Mon
 **/
public interface UserRepository {
    List<User> findAll(Pageable pageable);

//    Long save(UserSignupRequest user);

    void save(UserRegisterDTO user);

    void save(User user);

    void save(String id, String password);

    Optional<User> findById(String id);

    Optional<User> findByEmail(String email);

    boolean isExistEmail(String email);

    Optional<String> findEmailByEmailNotById(String id, String email);

    String findPassById(String id);

    int count();
//    Optional<User> findByUserNameAndPassword(UserLoginRequest user);
}