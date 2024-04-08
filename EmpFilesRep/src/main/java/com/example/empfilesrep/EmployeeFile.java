package com.example.empfilesrep;

public class EmployeeFile {
    private int id;
    private int employeeId;
    private boolean isChecklistFile;
    private String checklistName;
    private String filename;
    private String filetype;
    private byte[] filedata;

    public EmployeeFile(int id, int employeeId, boolean isChecklistFile, String checklistName, String filename, String filetype, byte[] filedata) {
        this.id = id;
        this.employeeId = employeeId;
        this.isChecklistFile = isChecklistFile;
        this.checklistName = checklistName;
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

    public boolean getIsChecklistFile() {
        return isChecklistFile;
    }

    public void setIsChecklistFile(boolean isChecklistFile) {
        this.isChecklistFile = isChecklistFile;
    }

    public String getChecklistName() {
        return checklistName;
    }

    public void setChecklistName(String checklistName) {
        this.checklistName = checklistName;
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

