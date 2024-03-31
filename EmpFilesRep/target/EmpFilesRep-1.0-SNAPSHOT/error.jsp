<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Employee Records and File Repository/Error</title>
  <style>
    @font-face {
      font-family: 'Pixeloid Sans';
      src: url('fonts/PixeloidSans-mLxMm.ttf') format('truetype');
    }

    @font-face {
      font-family: 'Pixeloid Mono';
      src: url('fonts/PixeloidMono-d94EV.ttf') format('truetype');
    }

    @font-face {
      font-family: 'Pixeloid Sans Bold';
      src: url('fonts/PixeloidSansBold-PKnYd.ttf') format('truetype');
    }

    body {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 95vh;
      margin: 0;
      background-color: white;
    }
    h1 {
      color: black;
      font-family: 'Pixeloid Sans', sans-serif;
    }
    p {
      color: red;
      font-family: 'Pixeloid Mono', monospace;
    }
    button {
      padding: 10px 20px;
      background-color: black;
      color: white;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s;
      font-size: 16px;
      font-family: 'Pixeloid Sans Bold', sans-serif;
    }
    button:hover {
      background-color: gray;
    }
  </style>
</head>
<body>
<h1>Error</h1>
<p>Invalid / An error has occured</p>
<!-- Button that will go back to the previous page -->
<button onclick="goBack()">Go Back to Previous Page</button>
<script>
  // JavaScript function to go back to the previous page
  function goBack() {
    window.history.back();
  }
</script>
</body>
</html>
