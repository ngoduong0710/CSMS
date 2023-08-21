package com.khoabug.coffeshop.user.infrastructure.repository.impl;

import com.khoabug.coffeshop.common.paging.Pageable;
import com.khoabug.coffeshop.common.repository.impl.CrudRepository;
import com.khoabug.coffeshop.user.infrastructure.entitymapper.UserMapper;
import com.khoabug.coffeshop.user.infrastructure.repository.UserRepository;
import com.khoabug.coffeshop.user.model.User;
import com.khoabug.coffeshop.user.model.UserRegisterDTO;
import jakarta.enterprise.context.ApplicationScoped;

import java.util.List;
import java.util.Optional;

/**
 * @author : DangKhoa
 * @since : 3/2/2023, Mon
 **/

@ApplicationScoped
public class UserRepositoryImpl extends CrudRepository implements UserRepository {

    @Override
    public List<User> findAll(Pageable pageable) {
        String sql = """
                SELECT * FROM account
                INNER JOIN role
                where role.id = account.role_id """;
        return query(pageable, new UserMapper(), sql);
    }

    @Override
    public void save(User user) {
        String sql = """
                UPDATE account
                SET email = ?, fullname = ?,role_id = ?, dob = ?, gender = ? ,status = ?
                WHERE ID = ?
                """;
        update(sql, user.getEmail(), user.getName(), user.getRole().getId(),
                user.getDob(), user.getGender() ? "Nam" : "Nữ", user.getActive(),
                user.getId());
    }

    @Override
    public void save(String id, String password) {
        String sql = """
                UPDATE account
                SET password = ?
                WHERE ID = ?
                """;
        update(sql, password, id);
    }

    @Override
    public void save(UserRegisterDTO user) {
        String sql = """
                INSERT INTO account (id, email, fullname, password, role_id, status)
                VALUES (?, ?, ?, ?, ?, ?)
                """;
        int index = count() + 1;
        update(sql, "A" + index, user.getEmail(), user.getName(), user.getPassword(), user.getRoleId(), false);
    }

    @Override
    public Optional<User> findById(String id) {
        String sql = """
                SELECT * 
                FROM account 
                INNER JOIN role
                WHERE account.id = ? AND role.id = account.role_id 
                """;
        return query(sql, new UserMapper(), id).stream().findFirst();
    }

    @Override
    public Optional<User> findByEmail(String email) {
        String sql = """
                SELECT * 
                FROM account 
                INNER JOIN role
                WHERE email = ? AND role.id = account.role_id 
                """;
        return query(sql, new UserMapper(), email).stream().findFirst();
    }

    @Override
    public boolean isExistEmail(String email) {
        String sql = """
                SELECT email 
                FROM account
                WHERE email = ?  
                """;
        return getFirstStringColumn(sql, email) != null;
    }

    @Override
    public Optional<String> findEmailByEmailNotById(String id, String email) {
        String sql = """
                SELECT email 
                FROM account 
                WHERE account.id != ? AND email = ?  
                """;
        return Optional.ofNullable(getFirstStringColumn(sql, id, email));
    }

    @Override
    public String findPassById(String id) {
        String sql = """
                SELECT password 
                FROM account 
                WHERE id = ?  
                """;
        return getFirstStringColumn(sql, id);
    }

    @Override
    public int count() {
        String sql = "SELECT COUNT(*) FROM account ";
        return count(sql);
    }
}
