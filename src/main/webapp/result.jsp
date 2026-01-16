<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");

  String aStr = request.getParameter("a");
  String bStr = request.getParameter("b");
  String op   = request.getParameter("op");

  String error = null;
  Double result = null;
  String opSymbol = "?";
  String opName = "Unknown";

  if (aStr == null || aStr.trim().isEmpty() || bStr == null || bStr.trim().isEmpty()) {
    error = "Please enter both numbers.";
  } else if (op == null || op.trim().isEmpty()) {
    error = "Please choose an operation.";
  } else {
    try {
      double a = Double.parseDouble(aStr.trim());
      double b = Double.parseDouble(bStr.trim());

      switch (op) {
        case "add":
          result = a + b;
          opSymbol = "+";
          opName = "Addition";
          break;
        case "sub":
          result = a - b;
          opSymbol = "-";
          opName = "Subtraction";
          break;
        case "mul":
          result = a * b;
          opSymbol = "×";
          opName = "Multiplication";
          break;
        case "div":
          opSymbol = "÷";
          opName = "Division";
          if (b == 0.0) error = "Cannot divide by zero.";
          else result = a / b;
          break;
        default:
          error = "Unknown operation.";
      }
    } catch (NumberFormatException e) {
      error = "Invalid number format. Please use digits (e.g., 12 or 3.5).";
    }
  }
%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>Mini Calculator - Result</title>
</head>
<body>
  <h1>Result</h1>

  <% if (error != null) { %>
    <p style="color:red;"><strong>Error:</strong> <%= error %></p>
    <p><a href="index.jsp">Back to calculator</a></p>
  <% } else { %>
    <p><strong>Operation:</strong> <%= opName %></p>
    <p>
      <strong><%= aStr %></strong> <%= opSymbol %> <strong><%= bStr %></strong>
      = <strong><%= result %></strong>
    </p>

    <hr/>
    <p>Thank you for using our calculator 🙂</p>

    <p>
      <a href="index.jsp">Calculate again</a>
    </p>
  <% } %>
</body>
</html>