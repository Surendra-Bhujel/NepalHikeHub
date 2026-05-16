package com.nepalhikehub.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatter {
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    private static final SimpleDateFormat DISPLAY_FORMAT = new SimpleDateFormat("MMMM dd, yyyy");
    
    public static String formatDate(Date date) {
        if (date == null) return "";
        return DATE_FORMAT.format(date);
    }
    
    public static String formatDisplayDate(Date date) {
        if (date == null) return "";
        return DISPLAY_FORMAT.format(date);
    }
    
    public static String getCurrentDate() {
        return DATE_FORMAT.format(new Date());
    }
}