package com.khoabug.coffeshop.bill.infrastructure.repository;

import com.khoabug.coffeshop.bill.model.Bill;

import java.util.Date;
import java.util.List;

/**
 * @author : KhoaBug
 * @since : 8/17/2023 ,Thu
 */
public interface BillRepository {

    List<Bill> findByRange(Date startDate, Date endDate);

}
