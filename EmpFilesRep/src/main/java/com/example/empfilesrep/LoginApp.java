package com.example.empfilesrep;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.ColumnConstraints;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;

public class LoginApp extends Application {

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Login Page");

        GridPane grid = new GridPane();
        grid.setAlignment(javafx.geometry.Pos.CENTER);
        grid.setHgap(10);
        grid.setVgap(10);
        grid.setPadding(new Insets(25, 25, 25, 25));

        Label usernameLabel = new Label("Username:");
        TextField usernameField = new TextField();
        Label passwordLabel = new Label("Password:");
        PasswordField passwordField = new PasswordField();
        Button loginButton = new Button("Login");

        // Set Max Width for the controls
        usernameField.setMaxWidth(Double.MAX_VALUE);
        passwordField.setMaxWidth(Double.MAX_VALUE);
        loginButton.setMaxWidth(Double.MAX_VALUE);

        grid.add(usernameLabel, 0, 0);
        grid.add(usernameField, 1, 0, 2, 1);
        grid.add(passwordLabel, 0, 1);
        grid.add(passwordField, 1, 1, 2, 1);
        grid.add(loginButton, 1, 2, 2, 1);

        // Set grid constraints for responsiveness
        ColumnConstraints columnConstraints = new ColumnConstraints();
        columnConstraints.setPercentWidth(33.33);
        grid.getColumnConstraints().addAll(columnConstraints, columnConstraints, columnConstraints);

        // Event handler for the login button
        loginButton.setOnAction(e -> handleLogin(usernameField.getText(), passwordField.getText()));

        Scene scene = new Scene(grid, 1500, 1000);
        primaryStage.setScene(scene);

        primaryStage.show();
    }

    private void handleLogin(String username, String password) {
        // Replace this method with your login logic
        if (username.equals("user") && password.equals("pass")) {
            System.out.println("Login successful!");
        } else {
            System.out.println("Login failed. Please check your credentials.");
        }
    }

    public static void main(String[] args) {
        launch(args);
    }
}
