package utils;

import java.text.NumberFormat;

public final class PriceUtil {
    private PriceUtil() {}

    public static String format(double price) {
        NumberFormat nf = NumberFormat.getNumberInstance();
        return nf.format(price);
    }

    public static int percentDiscount(double oldPrice, double newPrice) {
        return (int) (100 * (1 - newPrice / oldPrice));
    }
}
