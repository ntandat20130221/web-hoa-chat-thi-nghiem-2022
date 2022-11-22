/**
 * Create by: Nguyễn Tấn Đạt
 * At: 2:15 PM, 11/22/2022
 * <p>
 * Lớp Product thể hiện một sản phẩm
 */

package model;

public class Product {
    private String idProduct;
    private String imgPath;
    private String name;
    private int star;
    private String status;
    private double oldPrice;
    private double newPrice;

    public Product() {}

    public Product(String idProduct, String imgPath, String name, int star, String status, double oldPrice, double newPrice) {
        this.idProduct = idProduct;
        this.imgPath = imgPath;
        this.name = name;
        this.star = star;
        this.status = status;
        this.oldPrice = oldPrice;
        this.newPrice = newPrice;
    }

    // Getters and Setters

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
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
