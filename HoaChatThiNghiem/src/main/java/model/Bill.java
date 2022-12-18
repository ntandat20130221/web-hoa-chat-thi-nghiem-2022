package model;

import java.io.Serializable;

public class Bill implements Serializable {
    private int id;
    private String status;
    private String customerName;
    private double totalPrice;

    public Bill() {}

    public Bill(int id, String status, String customerName, double totalPrice) {
        this.id = id;
        this.status = status;
        this.customerName = customerName;
        this.totalPrice = totalPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
