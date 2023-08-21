package com.khoabug.coffeshop.user.model;

import com.khoabug.coffeshop.common.model.AbstractModel;
import com.khoabug.coffeshop.role.model.Role;

import java.io.Serializable;
import java.sql.Date;

/**
 * @author : DangKhoa
 * @since : 3/6/2023, Mon
 **/
public class User extends AbstractModel<User> implements Serializable {
    private String email;
    private String password;
    private Boolean gender;
    private String name;
    private Date dob;
    private Role role;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }
}



