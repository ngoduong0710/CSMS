package com.csms.dal;

import com.csms.model.Account;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO extends DBContext {
    private PreparedStatement st;
    private ResultSet rs;
    private static final Logger logger = LogManager.getLogger();
    private static final String ERR = "Error at AccountDAO: {}";

    private static final String USER_NAME = "Username";
    private static final String PASS_WORD = "Password";
    private static final String EMAIL = "Email";
    private static final String FULL_NAME = "Fullname";
    private static final String DOB = "Dob";
    private static final String ROLL_ID = "Role_id";
    private static final String GENDER = "Gender";
    private static final String STATUS = "Status";

    public List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account";
        try {
            DBContext dbContext = new DBContext();
            st = dbContext.connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString("Id"),
                        rs.getString(USER_NAME),
                        rs.getString(PASS_WORD),
                        rs.getString(EMAIL),
                        rs.getString(FULL_NAME),
                        rs.getDate(DOB),
                        rs.getString(ROLL_ID),
                        rs.getString(GENDER),
                        rs.getBoolean(STATUS));
                list.add(a);
            }
        } catch (SQLException e) {
            logger.error(ERR, e.getMessage());
        }
        return list;
    }

    public boolean checkLogin(String uname, String upass) {
        String sql = "SELECT * FROM Account WHERE Username=?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, uname);
            rs = st.executeQuery();
            if (rs.next() && rs.getString(PASS_WORD).equals(upass)) {
                return true;
            }
        } catch (SQLException e) {
            logger.error(ERR, e.getMessage());
        }
        return false;
    }

    public boolean checkEmailExist(String email) {
        String sql = "SELECT * FROM Account WHERE Email=?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, email);
            rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            logger.error(ERR, e.getMessage());
        }
        return false;
    }

    public boolean checkPasswordExist(String uname,String newpass) {
        String sql = "SELECT Password FROM Account WHERE Username=?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, uname);
            rs = st.executeQuery();
            if (rs.next() && rs.getString(PASS_WORD).equals(newpass)) {
                return true;
            }
        } catch (SQLException e) {
            logger.error(ERR, e.getMessage());
        }
        return false;
    }

    public String getRollId(String uname) {
        String sql = "SELECT Role_id FROM Account WHERE Username=?";
        String rollId = "";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, uname);
            rs = st.executeQuery();
            if (rs.next()) {
                return rollId;
            }
        } catch (SQLException e) {
            logger.error(ERR, e.getMessage());
        }
        return null;
    }

    public String getUsername(String email) {
        String sql = "SELECT Username FROM Account WHERE Email=?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, email);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(USER_NAME);
            }
        } catch (SQLException e) {
            logger.error(ERR, e.getMessage());
        }
        return null;
    }

    public boolean changePassword(String uname, String newpass) {
        String sql = "UPDATE Account SET Password=? WHERE Username=?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, newpass);
            st.setString(2, uname);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            logger.error(ERR, e.getMessage());
        }
        return false;
    }
}
