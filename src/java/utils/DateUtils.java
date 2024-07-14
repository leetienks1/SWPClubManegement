package utils;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import org.apache.logging.log4j.core.lookup.DateLookup;

public class DateUtils {
    private DateUtils() {}

    public static Date localDateToDate(LocalDate localDate) {
        return Date.from(localDate.atStartOfDay(ZoneId.of("America/New_York")).toInstant());
    }

    public static String format(
            Date date,
        String pattern
    ) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        return simpleDateFormat.format(date);
    }
}
