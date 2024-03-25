<%@ page contentType="text/html;charset=UTF-8" %>
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
            text-align: center;
        }

        label, input[type="text"], input[type="password"] {
            display: inline-block;
            margin: 5px;
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
    <input type="text" id="username" name="username" required>
    <br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br><br>

    <input type="submit" value="Login">
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
</form>
</body>
</html>
