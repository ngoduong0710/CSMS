/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author DELL
 */
public class Bill {
    private String id;
    private int totalPrice;
    private String createdAt;
    private Account createdBy;
    
    public Bill() {
    }

    public Bill(String id, int totalPrice, String createdAt, Account createdBy) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public Account getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Account createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "Bill{" + "id=" + id + ", totalPrice=" + totalPrice + ", createdAt=" + createdAt + ", createdBy=" + createdBy + '}';
    }

    
    
}
