package com.example.empfilesrep;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EmployeeService {
    private static final List<Employee> employeeList = new ArrayList<>();

    static {
        // Initialize some sample employees
        employeeList.add(new Employee("John", "Doe", "Smith", "Software Developer", new Date()));
        employeeList.add(new Employee("Jane", "Doe", "Johnson", "HR Manager", new Date()));
        // Add more employees as needed
    }

    public static List<Employee> getAllEmployees() {
        return new ArrayList<>(employeeList);
    }
}
