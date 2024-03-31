<!DOCTYPE html>
<html>
<head>
  <title>Employee Records and File Repository</title>
  <style>
    @font-face {
      font-family: 'Pixeloid Sans Bold';
      src: url('fonts/PixeloidSansBold-PKnYd.ttf') format('truetype');
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
      background-image: url('images/background.jpg');
      background-size: cover;
      background-position: center;
      filter: blur(20px);
      z-index: -1;
    }
    .container {
      text-align: center;
      color: black;
      background-color: white;
      padding: 2vh 2vw; /* Adjust padding based on viewport height and width */
      border-radius: 2vh; /* Adjust border radius based on viewport height */
      box-shadow: 0 2vh 4vh rgba(0, 0, 0, 0.1); /* Adjust box shadow based on viewport height */
      border: 0.5vh solid black; /* Adjust border width based on viewport height */
      font-family: 'Pixeloid Sans Bold', sans-serif;
      text-transform: uppercase;
      font-size: 0.8vw; /* Adjust font size based on viewport width */
    }
    .welcome-message {
      margin-top: 35vh; /* Adjust margin based on viewport height */
    }
    #login-form {
      margin-bottom: 20vh; /* Adjust margin based on viewport height */
    }
    #login-form input[type="submit"] {
      background-color: goldenrod;
      color: black;
      padding: 1vh 2vw; /* Adjust padding based on viewport height and width */
      border-radius: 1vh; /* Adjust border radius based on viewport height */
      cursor: pointer;
      transition: background-color 0.3s;
      font-family: 'Pixeloid Sans Bold', sans-serif;
      font-size: 0.8vw; /* Adjust font size based on viewport width */
    }
    #login-form input[type="submit"]:hover {
      background-color: darkgoldenrod;
    }
    .company-message {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 1vh; /* Adjust margin based on viewport height */
      font-family: 'Pixeloid Sans Bold', sans-serif;
      font-size: 0.8vw; /* Adjust font size based on viewport width */
      color: black;
    }
    .company-message img {
      margin-right: 0.5vw; /* Adjust margin between image and text based on viewport width */
      width: 2.5vw; /* Adjust width of the image based on viewport width */
      height: auto; /* Maintain aspect ratio */
    }
  </style>
</head>
<body>
<div class="background"></div>
<div class="container welcome-message">
  <h1>Welcome to the Employee Records and File Repository!</h1>
</div>
<div id="login-form">
  <form action="${pageContext.request.contextPath}/hello-servlet" method="post">
    <input type="submit" value="Go to Login Page">
  </form>
</div>
<div class="company-message">
  <img src="images/companyLogo.png" alt="Company Logo">
  Pixelated Games Inc.
</div>
</body>
</html>
