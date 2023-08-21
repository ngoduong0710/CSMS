package com.khoabug.coffeshop.bill.infrastructure.repository.impl;

import com.khoabug.coffeshop.bill.infrastructure.entitymapper.BillMapper;
import com.khoabug.coffeshop.bill.infrastructure.repository.BillRepository;
import com.khoabug.coffeshop.bill.model.Bill;
import com.khoabug.coffeshop.common.repository.impl.CrudRepository;
import jakarta.enterprise.context.ApplicationScoped;

import java.util.Date;
import java.util.List;

/**
 * @author : KhoaBug
 * @since : 8/17/2023 ,Thu
 */
@ApplicationScoped
public class BillRepositoryImpl extends CrudRepository implements BillRepository {

    @Override
    public List<Bill> findByRange(Date startDate, Date endDate) {
        String sql = """
                SELECT * FROM bill
                where createdat 
                BETWEEN ? AND ?""";
        return query(sql, new BillMapper(), startDate, endDate);
    }

}
