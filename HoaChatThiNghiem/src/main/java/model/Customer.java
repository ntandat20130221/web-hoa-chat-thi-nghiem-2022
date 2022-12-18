package model;

import java.io.Serializable;

public class Customer implements Serializable {
    private int id;
    private String email;
    private String password;
    private int id_status_acc;
    private int id_city;
    private String fullname;
    private String status;

    public Customer() {}

    public Customer(int id, String email, String password, int id_status_acc, int id_city, String fullname) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.id_status_acc = id_status_acc;
        this.id_city = id_city;
        this.fullname = fullname;
    }

    public int getId() {
        return id;
    }
    public String getEmail() {
        return email;
    }
    public String getPassword() {
        return password;
    }
    public int getId_status_acc() {
        return id_status_acc;
    }
    public int getId_city() {
        return id_city;
    }
    public String getFullname() {
        return fullname;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setId_status_acc(int id_status_acc) {
        this.id_status_acc = id_status_acc;
    }

    public void setId_city(int id_city) {
        this.id_city = id_city;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", id_status_acc=" + id_status_acc +
                ", id_city=" + id_city +
                ", fullname='" + fullname + '\'' +
                '}';
    }
}
