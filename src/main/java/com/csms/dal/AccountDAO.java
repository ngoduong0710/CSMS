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
    private static final String ERR = "Error at AccountDAO";

    public List<Account> getAll() {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Account";
        try {
            DBContext dbContext = new DBContext();
            st = dbContext.connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getString("Id"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getString("Fullname"),
                        rs.getDate("Dob"),
                        rs.getString("Role_id"),
                        rs.getString("Gender"),
                        rs.getBoolean("Status"));
                list.add(a);
            }
        } catch (SQLException e) {
            logger.error(ERR, e);
        }
        return list;
    }

    public boolean checkLogin(String uname, String upass) {
        String sql = "SELECT * FROM Account WHERE Username=?";
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, uname);
            rs = st.executeQuery();
            if (rs.next() && rs.getString("Password").equals(upass)) {
                return true;
            }
        } catch (SQLException e) {
            logger.error(ERR, e);
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
            logger.error(ERR, e);
        }
        return null;
    }
}
