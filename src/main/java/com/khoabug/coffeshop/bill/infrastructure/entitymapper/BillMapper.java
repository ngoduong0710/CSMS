package com.khoabug.coffeshop.bill.infrastructure.entitymapper;

import com.khoabug.coffeshop.bill.model.Bill;
import com.khoabug.coffeshop.common.mapper.RowMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author : KhoaBug
 * @since : 8/18/2023 ,Fri
 */
public class BillMapper implements RowMapper<Bill> {
    private static final Logger LOGGER = LogManager.getLogger(Bill.class);

    @Override
    public Bill mapRow(ResultSet resultSet) {
        Bill bill = new Bill();
        try {
            bill.setId(resultSet.getString("id"));
            bill.setCreatedDate(resultSet.getDate("createdat"));
            bill.setTotalPrice(resultSet.getInt("totalprice"));
        } catch (SQLException exception) {
            LOGGER.error(exception.getMessage());
            return null;
        }
        return bill;
    }
}
