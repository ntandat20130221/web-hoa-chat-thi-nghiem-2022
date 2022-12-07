package utils;

import java.util.Calendar;
import java.util.Date;

public final class DateUtil {
    private DateUtil() {}

    public static boolean in7DaysAgo(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, -7);
        return date.after(calendar.getTime());
    }
}
