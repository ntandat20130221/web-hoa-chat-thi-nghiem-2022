/**
 * Create by: Nguyễn Tấn Đạt
 * At: 2:15 PM, 11/22/2022
 * <p>
 * Lớp Product thể hiện một sản phẩm
 */

package model;

import java.io.Serializable;

public class Product implements Serializable {
    private int idProduct;
    private String imgPath;
    private String name;
    private int star;
    private String status;
    private String desc;
    private int quantity;
    private double oldPrice;
    private double newPrice;

    public Product() {}

    public Product(int idProduct, String imgPath, String name, int star, String status, String desc, int quantity, double oldPrice, double newPrice) {
        this.idProduct = idProduct;
        this.imgPath = imgPath;
        this.name = name;
        this.star = star;
        this.status = status;
        this.desc = desc;
        this.quantity = quantity;
        this.oldPrice = oldPrice;
        this.newPrice = newPrice;
    }

    // Getters and Setters

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(double oldPrice) {
        this.oldPrice = oldPrice;
    }

    public double getNewPrice() {
        return newPrice;
    }

    public void setNewPrice(double newPrice) {
        this.newPrice = newPrice;
    }
}
