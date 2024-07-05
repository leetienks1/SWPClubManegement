/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;

/**
 *
 * @author Desktop
 */
public class OrderJerseyTemp {

    private int orderId;
    private int userId;
    private LocalDate orderDate;
    private double orderTotal;
    private String phone;
    private String address;
    private String jerseyName;
    private String jerseyDescription;
    private double jerseyPrice;
    private JerseySizeEnum jerseySize;
    private int jerseyQuantity;

    // Constructors, getters, setters
    // Add constructors, getters, and setters here
    public OrderJerseyTemp() {
    }

    public OrderJerseyTemp(int orderId, int userId, LocalDate orderDate, double orderTotal,
            String phone, String address, String jerseyName, String jerseyDescription,
            double jerseyPrice, JerseySizeEnum jerseySize, int jerseyQuantity) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.orderTotal = orderTotal;
        this.phone = phone;
        this.address = address;
        this.jerseyName = jerseyName;
        this.jerseyDescription = jerseyDescription;
        this.jerseyPrice = jerseyPrice;
        this.jerseySize = jerseySize;
        this.jerseyQuantity = jerseyQuantity;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public double getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(double orderTotal) {
        this.orderTotal = orderTotal;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getJerseyName() {
        return jerseyName;
    }

    public void setJerseyName(String jerseyName) {
        this.jerseyName = jerseyName;
    }

    public String getJerseyDescription() {
        return jerseyDescription;
    }

    public void setJerseyDescription(String jerseyDescription) {
        this.jerseyDescription = jerseyDescription;
    }

    public double getJerseyPrice() {
        return jerseyPrice;
    }

    public void setJerseyPrice(double jerseyPrice) {
        this.jerseyPrice = jerseyPrice;
    }

    public JerseySizeEnum getJerseySize() {
        return jerseySize;
    }

    public void setJerseySize(JerseySizeEnum jerseySize) {
        this.jerseySize = jerseySize;
    }

    public int getJerseyQuantity() {
        return jerseyQuantity;
    }

    public void setJerseyQuantity(int jerseyQuantity) {
        this.jerseyQuantity = jerseyQuantity;
    }

}
