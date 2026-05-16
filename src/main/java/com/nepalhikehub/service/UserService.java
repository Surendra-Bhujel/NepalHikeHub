package com.nepalhikehub.service;

import com.nepalhikehub.dao.UserDAO;
import com.nepalhikehub.model.User;
import com.nepalhikehub.util.PasswordEncryption;
import com.nepalhikehub.util.ValidationUtil;

public class UserService {
    private UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    // Register new user
    public String registerUser(String name, String email, String phone, String password, String confirmPassword) {
        String validationError = ValidationUtil.validateUser(name, email, phone, password);
        if (validationError != null) {
            return validationError;
        }

        if (!password.equals(confirmPassword)) {
            return "Passwords do not match";
        }

        if (userDAO.emailExists(email)) {
            return "Email already registered";
        }

        if (userDAO.phoneExists(phone)) {
            return "Phone number already registered";
        }

        String hashedPassword = PasswordEncryption.hashPassword(password);
        User user = new User(name, email, hashedPassword, phone);

        if (userDAO.createUser(user)) {
            return "SUCCESS";
        }

        return "Registration failed. Please try again.";
    }

    // Sign in — returns error message string, or null if success
    public String signInCheck(String email, String password) {
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            return "Please enter email and password";
        }

        User user = userDAO.getUserByEmail(email);

        if (user == null) {
            return "Invalid email or password";
        }

        if (!PasswordEncryption.verifyPassword(password, user.getPasswordHash())) {
            return "Invalid email or password";
        }

        if (!user.isApproved()) {
            return "PENDING";
        }

        return null; // success
    }

    // Get user for session after successful login
    public User signIn(String email, String password) {
        User user = userDAO.getUserByEmail(email);
        if (user != null && PasswordEncryption.verifyPassword(password, user.getPasswordHash()) && user.isApproved()) {
            return user;
        }
        return null;
    }

    // Get user by ID
    public User getUserById(int userId) {
        return userDAO.getUserById(userId);
    }

    // Update profile
    public boolean updateProfile(User user) {
        return userDAO.updateUserProfile(user);
    }

    // Change password
    public boolean changePassword(int userId, String oldPassword, String newPassword, String confirmPassword) {
        User user = userDAO.getUserById(userId);

        if (user == null) {
            return false;
        }

        if (!PasswordEncryption.verifyPassword(oldPassword, user.getPasswordHash())) {
            return false;
        }

        if (!newPassword.equals(confirmPassword) || newPassword.length() < 6) {
            return false;
        }

        String newHash = PasswordEncryption.hashPassword(newPassword);
        return userDAO.updatePassword(userId, newHash);
    }
}