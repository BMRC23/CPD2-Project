package com.example.empfilesrep;

import java.util.Date;
public class Employee {
    private String firstName;
    private String middleName;
    private String lastName;
    private String jobPosition;
    private Date dateHired;

    public Employee (String firstName, String middleName, String lastName, String jobPosition, Date dateHired){
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.jobPosition = jobPosition;
        this.dateHired = dateHired;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getMiddleName() { return middleName; }

    public String getLastName() { return lastName; }

    public String getJobPosition() { return jobPosition; }

    public Date getDateHired() { return dateHired; }
}
