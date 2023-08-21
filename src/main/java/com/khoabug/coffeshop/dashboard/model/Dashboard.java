package com.khoabug.coffeshop.dashboard.model;

import com.khoabug.coffeshop.bill.model.Bill;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author : KhoaBug
 * @since : 8/18/2023 ,Fri
 */
public class Dashboard {
    private List<Bill> bills;
    private Integer totalPrice;
    private Integer maxFreq;
    private Date mostPriceDate;
    private Integer pricePerDate;

    public Dashboard(List<Bill> bills) {
        this.bills = bills;
        setMostPriceDate();
        setTotalPrice();
    }

    public List<Bill> getBills() {
        return bills;
    }

    public void setBills(List<Bill> bills) {
        this.bills = bills;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice() {
        totalPrice = bills.stream().mapToInt(Bill::getTotalPrice).sum();
    }

    public Date getMostPriceDate() {
        return mostPriceDate;
    }

    public void setMostPriceDate() {
        Date mostCommonDate = null;
        int maxFreq = 0;
        Map<Date, Integer> freq = new HashMap<>();

        for (Bill p : bills) {
            if (freq.merge(p.getCreatedDate(), 1, Integer::sum) > maxFreq) {
                maxFreq = freq.get(p.getCreatedDate());
                mostCommonDate = p.getCreatedDate();
            }
        }
        this.mostPriceDate = mostCommonDate;
        this.maxFreq = maxFreq;
    }

    public Integer getMaxFreq() {
        return maxFreq;
    }

    public void setMaxFreq(Integer maxFreq) {
        this.maxFreq = maxFreq;
    }

    public Integer getPricePerDate() {
        return pricePerDate;
    }

    public void setPricePerDate(Integer pricePerDate) {
        this.pricePerDate = pricePerDate;
    }
}
