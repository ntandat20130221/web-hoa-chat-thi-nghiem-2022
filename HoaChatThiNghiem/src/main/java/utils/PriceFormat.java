package utils;

import java.text.NumberFormat;

public final class PriceFormat {

    public static String format(double price) {
        NumberFormat nf = NumberFormat.getNumberInstance();
        return nf.format(price);
    }
}
