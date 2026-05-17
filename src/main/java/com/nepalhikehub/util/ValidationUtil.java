package com.nepalhikehub.util;

import java.util.regex.Pattern;

public class ValidationUtil {
    
    private static final Pattern EMAIL_PATTERN = Pattern.compile(
        "^[A-Za-z0-9+_.-]+@(.+)$"
    );
    
    private static final Pattern PHONE_PATTERN = Pattern.compile(
        "^[9][8-9][0-9]{8}$"
    );
    
    private static final Pattern NAME_PATTERN = Pattern.compile(
        "^[A-Za-z\\s]{2,50}$"
    );
    
    public static boolean isValidEmail(String email) {
        return email != null && EMAIL_PATTERN.matcher(email).matches();
    }
    
    public static boolean isValidPhone(String phone) {
        return phone != null && PHONE_PATTERN.matcher(phone).matches();
    }
    
    public static boolean isValidName(String name) {
        return name != null && NAME_PATTERN.matcher(name).matches();
    }
    
    public static boolean isValidPassword(String password) {
        return password != null && password.length() >= 6;
    }
    
    public static String validateUser(String name, String email, String phone, String password) {
        if (!isValidName(name)) {
            return "Name must contain only letters and spaces (2-50 characters)";
        }
        if (!isValidEmail(email)) {
            return "Please enter a valid email address";
        }
        if (!isValidPhone(phone)) {
            return "Phone number must start with 97 or 98 followed by 8 digits";
        }
        if (!isValidPassword(password)) {
            return "Password must be at least 6 characters long";
        }
        return null;
    }
}