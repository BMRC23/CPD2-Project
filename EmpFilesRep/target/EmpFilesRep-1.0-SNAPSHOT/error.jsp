<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Employee Records and File Repository/Login Error</title>
  <style>
    body {
      text-align: center;
      margin: 20% auto;
    }
  </style>
</head>
<body>
<h1>Error</h1>
<p style="color: red;">${errorMessage}</p>
<!-- Button that will go back to the previous page -->
<button onclick="goBack()">Go back to Previous Page</button>
<script>
  // JavaScript function to go back to the previous page
  function goBack() {
    window.history.back();
  }
</script>
</body>
</html>
