package com.example.empfilesrep;

public class    AuthenticationService {

    public static boolean authenticate(User user) {
        // Authentication details here
        return "1".equals(user.getUsername()) && "1".equals(user.getPassword());
    }
}
