package com.example.empfilesrep;

import java.time.LocalDate;
import java.util.List;

public class Employee {
    private int id;
    private String firstName;
    private String middleName;
    private String lastName;
    private String jobPosition;
    private String address;
    private String contactNumber;
    private LocalDate birthdate;
    private String sss;
    private String tin;
    private String philHealth;
    private String pagIbig;
    private String emergencyContactName;
    private String emergencyContactNumber;
    private LocalDate dateHired;

    // Additional fields for onboarding checklist
    private LocalDate employeeContractDateCompleted;
    private String employeeContractRemarks;
    private LocalDate microsoftAccountDateCompleted;
    private String microsoftAccountRemarks;
    private LocalDate issuedAssetsDateCompleted;
    private String issuedAssetsRemarks;
    private LocalDate requiredLicensesDateCompleted;
    private String requiredLicensesRemarks;
    private LocalDate trelloInviteDateCompleted;
    private String trelloInviteRemarks;
    private LocalDate teamsShiftsDateCompleted;
    private String teamsShiftsRemarks;
    private LocalDate enrolToPayrollDateCompleted;
    private String enrolToPayrollRemarks;

    // Additional fields for offboarding checklist
    private LocalDate certificateEmploymentDateCompleted;
    private String certificateEmploymentRemarks;
    private LocalDate birForm2316DateCompleted;
    private String birForm2316Remarks;
    private LocalDate returnIssuedAssetsDateCompleted;
    private String returnIssuedAssetsRemarks;
    private LocalDate quitclaimFinalPayDateCompleted;
    private String quitclaimFinalPayRemarks;
    private LocalDate knowledgeTransferSheetDateCompleted;
    private String knowledgeTransferSheetRemarks;

    // Additional fields for resignation details
    private boolean isResigned;
    private LocalDate resignationDate;
    private LocalDate lastDay;
    private LocalDate finalPayReleaseDate;

    // New field
    private List<EmployeeFile> employeeFiles;


    // Constructor including all fields
    public Employee(int id, String firstName, String middleName, String lastName, String jobPosition, LocalDate dateHired, String address, String contactNumber, LocalDate birthdate,
                    String sss, String tin, String philHealth, String pagIbig, String emergencyContactName, String emergencyContactNumber,
                    LocalDate employeeContractDateCompleted, String employeeContractRemarks, LocalDate microsoftAccountDateCompleted, String microsoftAccountRemarks,
                    LocalDate issuedAssetsDateCompleted, String issuedAssetsRemarks, LocalDate requiredLicensesDateCompleted, String requiredLicensesRemarks,
                    LocalDate trelloInviteDateCompleted, String trelloInviteRemarks, LocalDate teamsShiftsDateCompleted, String teamsShiftsRemarks,
                    LocalDate enrolToPayrollDateCompleted, String enrolToPayrollRemarks, LocalDate certificateEmploymentDateCompleted,
                    String certificateEmploymentRemarks, LocalDate birForm2316DateCompleted, String birForm2316Remarks, LocalDate returnIssuedAssetsDateCompleted,
                    String returnIssuedAssetsRemarks, LocalDate quitclaimFinalPayDateCompleted, String quitclaimFinalPayRemarks,
                    LocalDate knowledgeTransferSheetDateCompleted, String knowledgeTransferSheetRemarks, boolean isResigned, LocalDate resignationDate,
                    LocalDate lastDay, LocalDate finalPayReleaseDate, List<EmployeeFile> employeeFiles) {
        // Assign parameters to fields
        this.id = id;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.jobPosition = jobPosition;
        this.dateHired = dateHired;
        this.address = address;
        this.contactNumber = contactNumber;
        this.birthdate = birthdate;
        this.sss = sss;
        this.tin = tin;
        this.philHealth = philHealth;
        this.pagIbig = pagIbig;
        this.emergencyContactName = emergencyContactName;
        this.emergencyContactNumber = emergencyContactNumber;
        this.employeeContractDateCompleted = employeeContractDateCompleted;
        this.employeeContractRemarks = employeeContractRemarks;
        this.microsoftAccountDateCompleted = microsoftAccountDateCompleted;
        this.microsoftAccountRemarks = microsoftAccountRemarks;
        this.issuedAssetsDateCompleted = issuedAssetsDateCompleted;
        this.issuedAssetsRemarks = issuedAssetsRemarks;
        this.requiredLicensesDateCompleted = requiredLicensesDateCompleted;
        this.requiredLicensesRemarks = requiredLicensesRemarks;
        this.trelloInviteDateCompleted = trelloInviteDateCompleted;
        this.trelloInviteRemarks = trelloInviteRemarks;
        this.teamsShiftsDateCompleted = teamsShiftsDateCompleted;
        this.teamsShiftsRemarks = teamsShiftsRemarks;
        this.enrolToPayrollDateCompleted = enrolToPayrollDateCompleted;
        this.enrolToPayrollRemarks = enrolToPayrollRemarks;
        this.certificateEmploymentDateCompleted = certificateEmploymentDateCompleted;
        this.certificateEmploymentRemarks = certificateEmploymentRemarks;
        this.birForm2316DateCompleted = birForm2316DateCompleted;
        this.birForm2316Remarks = birForm2316Remarks;
        this.returnIssuedAssetsDateCompleted = returnIssuedAssetsDateCompleted;
        this.returnIssuedAssetsRemarks = returnIssuedAssetsRemarks;
        this.quitclaimFinalPayDateCompleted = quitclaimFinalPayDateCompleted;
        this.quitclaimFinalPayRemarks = quitclaimFinalPayRemarks;
        this.knowledgeTransferSheetDateCompleted = knowledgeTransferSheetDateCompleted;
        this.knowledgeTransferSheetRemarks = knowledgeTransferSheetRemarks;
        this.isResigned = isResigned;
        this.resignationDate = resignationDate;
        this.lastDay = lastDay;
        this.finalPayReleaseDate = finalPayReleaseDate;
        this.employeeFiles = employeeFiles;
    }

    public int getId() { return id; }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getJobPosition() {
        return jobPosition;
    }

    public void setJobPosition(String jobPosition) {
        this.jobPosition = jobPosition;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public LocalDate getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(LocalDate birthdate) {
        this.birthdate = birthdate;
    }

    public String getSss() {
        return sss;
    }

    public void setSss(String sss) {
        this.sss = sss;
    }

    public String getTin() {
        return tin;
    }

    public void setTin(String tin) {
        this.tin = tin;
    }

    public String getPhilHealth() {
        return philHealth;
    }

    public void setPhilHealth(String philHealth) {
        this.philHealth = philHealth;
    }

    public String getPagIbig() {
        return pagIbig;
    }

    public void setPagIbig(String pagIbig) {
        this.pagIbig = pagIbig;
    }

    public String getEmergencyContactName() {
        return emergencyContactName;
    }

    public void setEmergencyContactName(String emergencyContactName) {
        this.emergencyContactName = emergencyContactName;
    }

    public String getEmergencyContactNumber() {
        return emergencyContactNumber;
    }

    public void setEmergencyContactNumber(String emergencyContactNumber) {
        this.emergencyContactNumber = emergencyContactNumber;
    }

    public LocalDate getDateHired() {
        return dateHired;
    }

    public void setDateHired(LocalDate dateHired) {
        this.dateHired = dateHired;
    }

    public LocalDate getEmployeeContractDateCompleted() {
        return employeeContractDateCompleted;
    }

    public void setEmployeeContractDateCompleted(LocalDate employeeContractDateCompleted) {
        this.employeeContractDateCompleted = employeeContractDateCompleted;
    }

    public String getEmployeeContractRemarks() {
        return employeeContractRemarks;
    }

    public void setEmployeeContractRemarks(String employeeContractRemarks) {
        this.employeeContractRemarks = employeeContractRemarks;
    }

    public LocalDate getMicrosoftAccountDateCompleted() {
        return microsoftAccountDateCompleted;
    }

    public void setMicrosoftAccountDateCompleted(LocalDate microsoftAccountDateCompleted) {
        this.microsoftAccountDateCompleted = microsoftAccountDateCompleted;
    }

    public String getMicrosoftAccountRemarks() {
        return microsoftAccountRemarks;
    }

    public void setMicrosoftAccountRemarks(String microsoftAccountRemarks) {
        this.microsoftAccountRemarks = microsoftAccountRemarks;
    }

    public LocalDate getIssuedAssetsDateCompleted() {
        return issuedAssetsDateCompleted;
    }

    public void setIssuedAssetsDateCompleted(LocalDate issuedAssetsDateCompleted) {
        this.issuedAssetsDateCompleted = issuedAssetsDateCompleted;
    }

    public String getIssuedAssetsRemarks() {
        return issuedAssetsRemarks;
    }

    public void setIssuedAssetsRemarks(String issuedAssetsRemarks) {
        this.issuedAssetsRemarks = issuedAssetsRemarks;
    }

    public LocalDate getRequiredLicensesDateCompleted() {
        return requiredLicensesDateCompleted;
    }

    public void setRequiredLicensesDateCompleted(LocalDate requiredLicensesDateCompleted) {
        this.requiredLicensesDateCompleted = requiredLicensesDateCompleted;
    }

    public String getRequiredLicensesRemarks() {
        return requiredLicensesRemarks;
    }

    public void setRequiredLicensesRemarks(String requiredLicensesRemarks) {
        this.requiredLicensesRemarks = requiredLicensesRemarks;
    }

    public LocalDate getTrelloInviteDateCompleted() {
        return trelloInviteDateCompleted;
    }

    public void setTrelloInviteDateCompleted(LocalDate trelloInviteDateCompleted) {
        this.trelloInviteDateCompleted = trelloInviteDateCompleted;
    }

    public String getTrelloInviteRemarks() {
        return trelloInviteRemarks;
    }

    public void setTrelloInviteRemarks(String trelloInviteRemarks) {
        this.trelloInviteRemarks = trelloInviteRemarks;
    }

    public LocalDate getTeamsShiftsDateCompleted() {
        return teamsShiftsDateCompleted;
    }

    public void setTeamsShiftsDateCompleted(LocalDate teamsShiftsDateCompleted) {
        this.teamsShiftsDateCompleted = teamsShiftsDateCompleted;
    }

    public String getTeamsShiftsRemarks() {
        return teamsShiftsRemarks;
    }

    public void setTeamsShiftsRemarks(String teamsShiftsRemarks) {
        this.teamsShiftsRemarks = teamsShiftsRemarks;
    }

    public LocalDate getEnrolToPayrollDateCompleted() {
        return enrolToPayrollDateCompleted;
    }

    public void setEnrolToPayrollDateCompleted(LocalDate enrolToPayrollDateCompleted) {
        this.enrolToPayrollDateCompleted = enrolToPayrollDateCompleted;
    }

    public String getEnrolToPayrollRemarks() {
        return enrolToPayrollRemarks;
    }

    public void setEnrolToPayrollRemarks(String enrolToPayrollRemarks) {
        this.enrolToPayrollRemarks = enrolToPayrollRemarks;
    }

    public LocalDate getCertificateEmploymentDateCompleted() {
        return certificateEmploymentDateCompleted;
    }

    public void setCertificateEmploymentDateCompleted(LocalDate certificateEmploymentDateCompleted) {
        this.certificateEmploymentDateCompleted = certificateEmploymentDateCompleted;
    }

    public String getCertificateEmploymentRemarks() {
        return certificateEmploymentRemarks;
    }

    public void setCertificateEmploymentRemarks(String certificateEmploymentRemarks) {
        this.certificateEmploymentRemarks = certificateEmploymentRemarks;
    }

    public LocalDate getBirForm2316DateCompleted() {
        return birForm2316DateCompleted;
    }

    public void setBirForm2316DateCompleted(LocalDate birForm2316DateCompleted) {
        this.birForm2316DateCompleted = birForm2316DateCompleted;
    }

    public String getBirForm2316Remarks() {
        return birForm2316Remarks;
    }

    public void setBirForm2316Remarks(String birForm2316Remarks) {
        this.birForm2316Remarks = birForm2316Remarks;
    }

    public LocalDate getReturnIssuedAssetsDateCompleted() {
        return returnIssuedAssetsDateCompleted;
    }

    public void setReturnIssuedAssetsDateCompleted(LocalDate returnIssuedAssetsDateCompleted) {
        this.returnIssuedAssetsDateCompleted = returnIssuedAssetsDateCompleted;
    }

    public String getReturnIssuedAssetsRemarks() {
        return returnIssuedAssetsRemarks;
    }

    public void setReturnIssuedAssetsRemarks(String returnIssuedAssetsRemarks) {
        this.returnIssuedAssetsRemarks = returnIssuedAssetsRemarks;
    }

    public LocalDate getQuitclaimFinalPayDateCompleted() {
        return quitclaimFinalPayDateCompleted;
    }

    public void setQuitclaimFinalPayDateCompleted(LocalDate quitclaimFinalPayDateCompleted) {
        this.quitclaimFinalPayDateCompleted = quitclaimFinalPayDateCompleted;
    }

    public String getQuitclaimFinalPayRemarks() {
        return quitclaimFinalPayRemarks;
    }

    public void setQuitclaimFinalPayRemarks(String quitclaimFinalPayRemarks) {
        this.quitclaimFinalPayRemarks = quitclaimFinalPayRemarks;
    }

    public LocalDate getKnowledgeTransferSheetDateCompleted() {
        return knowledgeTransferSheetDateCompleted;
    }

    public void setKnowledgeTransferSheetDateCompleted(LocalDate knowledgeTransferSheetDateCompleted) {
        this.knowledgeTransferSheetDateCompleted = knowledgeTransferSheetDateCompleted;
    }

    public String getKnowledgeTransferSheetRemarks() {
        return knowledgeTransferSheetRemarks;
    }

    public void setKnowledgeTransferSheetRemarks(String knowledgeTransferSheetRemarks) {
        this.knowledgeTransferSheetRemarks = knowledgeTransferSheetRemarks;
    }

    public boolean isResigned() {
        return isResigned;
    }

    public void setResigned(boolean resigned) {
        isResigned = resigned;
    }

    public LocalDate getResignationDate() {
        return resignationDate;
    }

    public void setResignationDate(LocalDate resignationDate) {
        this.resignationDate = resignationDate;
    }

    public LocalDate getLastDay() {
        return lastDay;
    }

    public void setLastDay(LocalDate lastDay) {
        this.lastDay = lastDay;
    }

    public LocalDate getFinalPayReleaseDate() {
        return finalPayReleaseDate;
    }

    public void setFinalPayReleaseDate(LocalDate finalPayReleaseDate) {
        this.finalPayReleaseDate = finalPayReleaseDate;
    }

    public List<EmployeeFile> getEmployeeFiles() {
        return employeeFiles;
    }

    public void setEmployeeFiles(List<EmployeeFile> employeeFiles) {
    }
}
