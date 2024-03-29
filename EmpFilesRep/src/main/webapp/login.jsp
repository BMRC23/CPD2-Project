<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Employee Records and File Repository/Login Page</title>
    <style>
        body {
            text-align: center;
            margin: 10% auto 0;
            color: black;
            background-color: white;
        }
        form {
            display: inline-block;
            text-align: center;
            border: 2px solid black;
            padding: 20px;
        }

        label, input[type="text"], input[type="password"] {
            display: block;
            margin: 10px 0;
        }

        input[type="submit"] {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: gray;
        }

        p {
            color: red;
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
        <p>${errorMessage}</p>
    </c:if>
</form>
</body>
</html>
