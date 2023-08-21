package com.khoabug.coffeshop.role.infrastructure.repository;

import com.khoabug.coffeshop.role.model.Role;

import java.util.List;
import java.util.Optional;

/**
 * @author : KhoaBug
 * @since : 8/12/2023 ,Sat
 */
public interface RoleRepository {
    List<Role> findAll();

    Optional<Role> findById(String id);

    int count(Object... parameter);
}
