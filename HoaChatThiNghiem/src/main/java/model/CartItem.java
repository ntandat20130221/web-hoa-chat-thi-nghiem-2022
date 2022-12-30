package model;

import java.io.Serializable;

public class CartItem implements Serializable {
    private final Product product;
    private int quantity = 0;

    public CartItem(Product product) {
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
