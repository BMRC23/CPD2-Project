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
    private boolean employeeContract;
    private LocalDate employeeContractDateCompleted;
    private String employeeContractRemarks;
    private boolean microsoftAccount;
    private LocalDate microsoftAccountDateCompleted;
    private String microsoftAccountRemarks;
    private boolean issuedAssets;
    private LocalDate issuedAssetsDateCompleted;
    private String issuedAssetsRemarks;
    private boolean requiredLicenses;
    private LocalDate requiredLicensesDateCompleted;
    private String requiredLicensesRemarks;
    private boolean trelloInvite;
    private LocalDate trelloInviteDateCompleted;
    private String trelloInviteRemarks;
    private boolean teamsShifts;
    private LocalDate teamsShiftsDateCompleted;
    private String teamsShiftsRemarks;
    private boolean enrolToPayroll;
    private LocalDate enrolToPayrollDateCompleted;
    private String enrolToPayrollRemarks;

    // Additional fields for offboarding checklist
    private boolean certificateEmployment;
    private LocalDate certificateEmploymentDateCompleted;
    private String certificateEmploymentRemarks;
    private boolean birForm2316;
    private LocalDate birForm2316DateCompleted;
    private String birForm2316Remarks;
    private boolean returnIssuedAssets;
    private LocalDate returnIssuedAssetsDateCompleted;
    private String returnIssuedAssetsRemarks;
    private boolean quitclaimFinalPay;
    private LocalDate quitclaimFinalPayDateCompleted;
    private String quitclaimFinalPayRemarks;
    private boolean knowledgeTransferSheet;
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
                    String sss, String tin, String philHealth, String pagIbig, String emergencyContactName, String emergencyContactNumber, boolean employeeContract,
                    LocalDate employeeContractDateCompleted, String employeeContractRemarks, boolean microsoftAccount, LocalDate microsoftAccountDateCompleted, String microsoftAccountRemarks,
                    boolean issuedAssets, LocalDate issuedAssetsDateCompleted, String issuedAssetsRemarks, boolean requiredLicenses, LocalDate requiredLicensesDateCompleted, String requiredLicensesRemarks,
                    boolean trelloInvite, LocalDate trelloInviteDateCompleted, String trelloInviteRemarks, boolean teamsShifts, LocalDate teamsShiftsDateCompleted, String teamsShiftsRemarks,
                    boolean enrolToPayroll, LocalDate enrolToPayrollDateCompleted, String enrolToPayrollRemarks, boolean certificateEmployment, LocalDate certificateEmploymentDateCompleted,
                    String certificateEmploymentRemarks, boolean birForm2316, LocalDate birForm2316DateCompleted, String birForm2316Remarks, boolean returnIssuedAssets, LocalDate returnIssuedAssetsDateCompleted,
                    String returnIssuedAssetsRemarks, boolean quitclaimFinalPay, LocalDate quitclaimFinalPayDateCompleted, String quitclaimFinalPayRemarks,
                    boolean knowledgeTransferSheet, LocalDate knowledgeTransferSheetDateCompleted, String knowledgeTransferSheetRemarks, boolean isResigned, LocalDate resignationDate,
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
        this.employeeContract = employeeContract;
        this.employeeContractDateCompleted = employeeContractDateCompleted;
        this.employeeContractRemarks = employeeContractRemarks;
        this.microsoftAccount = microsoftAccount;
        this.microsoftAccountDateCompleted = microsoftAccountDateCompleted;
        this.microsoftAccountRemarks = microsoftAccountRemarks;
        this.issuedAssets = issuedAssets;
        this.issuedAssetsDateCompleted = issuedAssetsDateCompleted;
        this.issuedAssetsRemarks = issuedAssetsRemarks;
        this.requiredLicenses = requiredLicenses;
        this.requiredLicensesDateCompleted = requiredLicensesDateCompleted;
        this.requiredLicensesRemarks = requiredLicensesRemarks;
        this.trelloInvite = trelloInvite;
        this.trelloInviteDateCompleted = trelloInviteDateCompleted;
        this.trelloInviteRemarks = trelloInviteRemarks;
        this.teamsShifts = teamsShifts;
        this.teamsShiftsDateCompleted = teamsShiftsDateCompleted;
        this.teamsShiftsRemarks = teamsShiftsRemarks;
        this.enrolToPayroll = enrolToPayroll;
        this.enrolToPayrollDateCompleted = enrolToPayrollDateCompleted;
        this.enrolToPayrollRemarks = enrolToPayrollRemarks;
        this.certificateEmployment = certificateEmployment;
        this.certificateEmploymentDateCompleted = certificateEmploymentDateCompleted;
        this.certificateEmploymentRemarks = certificateEmploymentRemarks;
        this.birForm2316 = birForm2316;
        this.birForm2316DateCompleted = birForm2316DateCompleted;
        this.birForm2316Remarks = birForm2316Remarks;
        this.returnIssuedAssets = returnIssuedAssets;
        this.returnIssuedAssetsDateCompleted = returnIssuedAssetsDateCompleted;
        this.returnIssuedAssetsRemarks = returnIssuedAssetsRemarks;
        this.quitclaimFinalPay = quitclaimFinalPay;
        this.quitclaimFinalPayDateCompleted = quitclaimFinalPayDateCompleted;
        this.quitclaimFinalPayRemarks = quitclaimFinalPayRemarks;
        this.knowledgeTransferSheet = knowledgeTransferSheet;
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

    public boolean isEmployeeContract() {
        return employeeContract;
    }

    public void setEmployeeContract(boolean employeeContract) {
        this.employeeContract = employeeContract;
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

    public boolean isMicrosoftAccount() {
        return microsoftAccount;
    }

    public void setMicrosoftAccount(boolean microsoftAccount) {
        this.microsoftAccount = microsoftAccount;
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

    public boolean isIssuedAssets() {
        return issuedAssets;
    }

    public void setIssuedAssets(boolean issuedAssets) {
        this.issuedAssets = issuedAssets;
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

    public boolean isRequiredLicenses() {
        return requiredLicenses;
    }

    public void setRequiredLicenses(boolean requiredLicenses) {
        this.requiredLicenses = requiredLicenses;
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

    public boolean isTrelloInvite() {
        return trelloInvite;
    }

    public void setTrelloInvite(boolean trelloInvite) {
        this.trelloInvite = trelloInvite;
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

    public boolean isTeamsShifts() {
        return teamsShifts;
    }

    public void setTeamsShifts(boolean teamsShifts) {
        this.teamsShifts = teamsShifts;
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

    public boolean isEnrolToPayroll() {
        return enrolToPayroll;
    }

    public void setEnrolToPayroll(boolean enrolToPayroll) {
        this.enrolToPayroll = enrolToPayroll;
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

    public boolean isCertificateEmployment() {
        return certificateEmployment;
    }

    public void setCertificateEmployment(boolean certificateEmployment) {
        this.certificateEmployment = certificateEmployment;
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

    public boolean isBirForm2316() {
        return birForm2316;
    }

    public void setBirForm2316(boolean birForm2316) {
        this.birForm2316 = birForm2316;
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

    public boolean isReturnIssuedAssets() {
        return returnIssuedAssets;
    }

    public void setReturnIssuedAssets(boolean returnIssuedAssets) {
        this.returnIssuedAssets = returnIssuedAssets;
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

    public boolean isQuitclaimFinalPay() {
        return quitclaimFinalPay;
    }

    public void setQuitclaimFinalPay(boolean quitclaimFinalPay) {
        this.quitclaimFinalPay = quitclaimFinalPay;
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

    public boolean isKnowledgeTransferSheet() {
        return knowledgeTransferSheet;
    }

    public void setKnowledgeTransferSheet(boolean knowledgeTrasferSheet) {
        this.knowledgeTransferSheet = knowledgeTrasferSheet;
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

    public String getStatus() {
        if (sss == null || tin == null || philHealth == null || pagIbig == null || !employeeContract || !microsoftAccount || !issuedAssets || !requiredLicenses
                || !trelloInvite || !teamsShifts || !enrolToPayroll || !certificateEmployment || !birForm2316 || !returnIssuedAssets || !quitclaimFinalPay || !knowledgeTransferSheet ||
                employeeContractRemarks == null || employeeContractDateCompleted == null || microsoftAccountRemarks == null || microsoftAccountDateCompleted == null ||
                issuedAssetsRemarks == null || issuedAssetsDateCompleted == null || requiredLicensesRemarks == null || requiredLicensesDateCompleted == null ||
                trelloInviteRemarks == null || trelloInviteDateCompleted == null || teamsShiftsRemarks == null || teamsShiftsDateCompleted == null ||
                enrolToPayrollRemarks == null || enrolToPayrollDateCompleted == null || certificateEmploymentRemarks == null || certificateEmploymentDateCompleted == null ||
                birForm2316Remarks == null || birForm2316DateCompleted == null || returnIssuedAssetsRemarks == null || returnIssuedAssetsDateCompleted == null ||
                quitclaimFinalPayRemarks == null || quitclaimFinalPayDateCompleted == null || knowledgeTransferSheetRemarks == null || knowledgeTransferSheetDateCompleted == null ||
                (isResigned && (resignationDate == null || lastDay == null || finalPayReleaseDate == null))) {
            return "Partially Complete Details";
        } else {
            return "Complete Details";
        }
    }
}
