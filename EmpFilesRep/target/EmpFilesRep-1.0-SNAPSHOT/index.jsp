<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Employee Records and File Repository</title>
  <style>
    body {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }
    .container {
      text-align: center;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Welcome to the Employee Records and File Repository!</h1>
  <form action="${pageContext.request.contextPath}/hello-servlet" method="post">
    <input type="submit" value="Go to Login Page">
  </form>
</div>
</body>
</html>
