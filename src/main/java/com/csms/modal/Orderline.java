/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author DELL
 */
public class Orderline {
    private Bill bill;
    private Drink drink;
    private int quantity;
    private int totalPrice;

    public Orderline( Bill bill, Drink drink, int quantity, int totalPrice) {
        this.bill = bill;
        this.drink = drink;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
    }

    public Orderline() {
    }

    
    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Drink getDrink() {
        return drink;
    }

    public void setDrink(Drink drink) {
        this.drink = drink;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "Orderline{" + ", bill=" + bill + ", drink=" + drink + ", quantity=" + quantity + ", totalPrice=" + totalPrice + '}';
    }
    
    
}
