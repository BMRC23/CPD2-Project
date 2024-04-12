# CPD2-Project
Group 2 of LBYCPD2- EQ3 for Term 2 of A.Y. 2023-2024

## Proposed Project: Employee Records and Files Repository

Members:
  - Calado, Brent Mitchel R.
  - Cid, Brent Benette F.
  - Mendoza, Christian Rae D.
  - Wang, Kevin Louis H.

HR TOOL SPECS: https://docs.google.com/spreadsheets/d/1APuKFJnujuE1CN1z0Hg33RYUavhyCbGdLFFAn6F2k5c/edit?usp=sharing
<br />
<br />
<br />
## How to Use the Program?
### For Deployment:
1. To be able to deploy the program, first download it as a ZIP file and extract it into your local computer.
2. Next, after extraction, install the `apache-tomcat-10.1.20.exe` file. You may read the following guide on how to properly install Apache Tomcat -- [Guide Link](https://medium.com/@6unpnp/install-apache-tom-440b7f9e135d).
3. After installation, copy the file `EmpFilesRep.war` from the extracted ZIP file and paste it to the `webapps` directory of Apache Tomcat found in your local computer's Program Files.

![image](https://github.com/BMRC23/CPD2-Project/assets/127077350/bbef7e54-72e0-4686-9102-a84476f3a60f)

4. Once the .WAR file has been pasted, open `Services` in your Local Computer and restart the `Apache Tomcat 10.1 Tomcat10` application. It will be similar to the following image.

![image](https://github.com/BMRC23/CPD2-Project/assets/127077350/5389d1f2-fdc1-4248-a881-1c337fbef353)

5. After restarting, type the following URL into your browser: `http://localhost:8080/EmpFilesRep/`
6. The program should now be working!

<br />

### For Testing (Run in IDE, preferably IntelliJ IDEA):
1. First, download the program as a ZIP file and extract it into your local computer.
2. Next, after extraction, install the `apache-tomcat-10.1.20.exe` file. You may read the following guide on how to properly install Apache Tomcat -- [Guide Link](https://medium.com/@6unpnp/install-apache-tom-440b7f9e135d).
3. After installation, open the program `EmpFilesRep` in your IDE.
4. Afterwards, edit the configurations of the program by adding a new configuration using `Tomcat Server - Local`.

![image](https://github.com/BMRC23/CPD2-Project/assets/127077350/719bba3c-d0d9-456d-b95c-6fa191c7270b)

5. Configure the application server by selecting the home and base directory of Apache Tomcat in your local computer.

![image](https://github.com/BMRC23/CPD2-Project/assets/127077350/010cc0a2-b4d7-40fc-ab61-25c96bd20d62)

6. After clicking ok in the application server configuration, leave the remaining values as the default and click the `Deployment` tab at the top.
7. Click the + to add a new deployment artifact and select `Artifact`.
8. Select `MyWebApp:war exploded`. This will allow you to update the application code without redeploying or restarting the server.

![image](https://github.com/BMRC23/CPD2-Project/assets/127077350/36622cdf-909e-4d02-9ad8-327b0c8d8fff)

9. Click OK to finish configuring the Run configuration.
10. The program should now be working. You should now be able to run the program in your IDE.
