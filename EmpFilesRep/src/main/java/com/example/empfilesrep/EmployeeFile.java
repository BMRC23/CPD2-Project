package com.example.empfilesrep;

public class EmployeeFile {
    private int id;
    private int employeeId;
    private String filename;
    private String filetype;
    private byte[] filedata;

    public EmployeeFile(int id, int employeeId, String filename, String filetype, byte[] filedata) {
        this.id = id;
        this.employeeId = employeeId;
        this.filename = filename;
        this.filetype = filetype;
        this.filedata = filedata;
    }

    // Getters and setters for all fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public byte[] getFiledata() {
        return filedata;
    }

    public void setFiledata(byte[] filedata) {
        this.filedata = filedata;
    }
}

