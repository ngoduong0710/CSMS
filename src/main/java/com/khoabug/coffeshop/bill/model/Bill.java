package com.khoabug.coffeshop.bill.model;

import com.khoabug.coffeshop.common.model.AbstractModel;
import com.khoabug.coffeshop.user.model.User;

/**
 * @author : KhoaBug
 * @since : 8/17/2023 ,Thu
 */
public class Bill extends AbstractModel<User> {
    private Integer totalPrice;

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }
}
