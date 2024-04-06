<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Employee Records and File Repository/Login Page</title>
    <style>
        @font-face {
            font-family: 'Pixeloid Sans Bold';
            src: url('fonts/PixeloidSansBold-PKnYd.ttf') format('truetype');
        }

        @font-face {
            font-family: 'Pixeloid Mono';
            src: url('fonts/PixeloidMono-d94EV.ttf') format('truetype');
        }

        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
            height: 100vh;
            margin: 0;
            overflow: hidden;
            position: relative;
        }
        .background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: white;
            background-size: cover;
            background-position: center;
            z-index: -1;
        }
        form {
            text-align: center;
            border: 2px solid black;
            padding: 2vw; /* Adjust padding using viewport width */
            background-color: goldenrod;
            margin-top: 15vh;
            margin: auto; /* Center the form horizontally */
        }

        label {
            text-align: center;
            display: inline-block;
            margin: 2vh 0.5vh;
            font-family: 'Pixeloid Mono', monospace;
            font-size: 1.5vh;
        }

        input[type="text"], input[type="password"] {
            text-align: center;
            display: inline-block;
            margin: 2vh 0.5vh;
            font-size: 1.5vh;
        }

        input[type="submit"] {
            display: inline-block;
            background-color: dodgerblue;
            color: black;
            padding: 1vh 1vw; /* Adjust padding based on viewport height and width */
            border-radius: 1vh; /* Adjust border radius based on viewport height */
            cursor: pointer;
            transition: background-color 0.3s;
            font-family: 'Pixeloid Sans Bold', sans-serif;
            font-size: 0.8vw; /* Adjust font size based on viewport width */
        }

        input[type="submit"]:hover {
            background-color: #000040;
            color: goldenrod;
        }
        .company-message {
            position: absolute; /* Set company message position to absolute */
            bottom: 0; /* Adjust distance from bottom using viewport height */
            left: 50%; /* Center horizontally */
            transform: translateX(-50%); /* Center horizontally */
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1vh; /* Adjust margin based on viewport height */
            font-family: 'Pixeloid Sans Bold', sans-serif;
            font-size: 0.8vw; /* Adjust font size using viewport width */
            color: black;
        }
        .company-message img {
            margin-right: 0.5vw; /* Adjust margin between image and text using viewport width */
            width: 2.5vw; /* Adjust width of the image using viewport width */
            height: auto; /* Maintain aspect ratio */
        }
    </style>
</head>
<body>
<div class="background"></div>
<form action="login" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br><br>

    <input type="submit" value="Log In">
</form>
<div class="company-message">
    <img src="images/companyLogo.png" alt="Company Logo">
    Pixelated Games Inc.
</div>
</body>
</html>
