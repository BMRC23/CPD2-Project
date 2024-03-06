<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Employee Records and File Repository/Dashboard</title>
  <style>
    table {
      border-collapse: collapse;
      width: 80%;
      margin: 20px auto;
    }

    th, td {
      border: 1px solid black;
      padding: 8px;
      text-align: left;
    }
  </style>
</head>
<body>
<h1>Employees Dashboard</h1>
<table>
  <tr>
    <th>First Name</th>
    <th>Middle Name</th>
    <th>Last Name</th>
    <th>Job Position</th>
    <th>Date Hired</th>
    <th>Action</th>
  </tr>
  <c:forEach var="employee" items="${employees}">
    <tr>
      <td>${employee.firstName}</td>
      <td>${employee.middleName}</td>
      <td>${employee.lastName}</td>
      <td>${employee.jobPosition}</td>
      <td>${employee.dateHired}</td>
      <td><a href="#">View</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
