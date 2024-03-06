package com.example.empfilesrep;

public class AuthenticationService {

    public static boolean authenticate(User user) {
        // Authentication details here
        return "admin".equals(user.getUsername()) && "123".equals(user.getPassword());
    }
}
