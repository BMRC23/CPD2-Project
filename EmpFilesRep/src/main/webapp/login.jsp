<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Records and File Repository/Login Page</title>
    <style>
        body {
            text-align: center;
            margin: 20% auto;
        }
        form {
            display: inline-block;
            text-align: left;
        }
        input[type="submit"] {
            display: block;
            margin: 10px auto;
        }
    </style>
</head>
<body>
<form action="login" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br>

    <input type="submit" value="Login">
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
</form>
</body>
</html>
