package com.example.empfilesrep;

/**
 * This class provides an authentication service for the application.
 * It contains a method to authenticate a user based on their username and password.
 */
public class AuthenticationService {

    /**
     * This method checks if the provided user's username and password match the expected values.
     * Currently, the expected username and password are both "1".
     * This is a placeholder implementation and should be replaced with a proper authentication mechanism.
     * @param user The user to authenticate. This should be a User object containing the user's username and password.
     * @return true if the user's username and password match the expected values, false otherwise.
     */
    public static boolean authenticate(User user) {
        // Authentication details here. Change them as per your requirement
        return "1".equals(user.getUsername()) && "1".equals(user.getPassword());
    }
}