<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>Mini Calculator - Input</title>
</head>
<body>
  <h1>Mini Calculator - HIT DEVOPS PROJECT</h1>
  <p>Enter two numbers, choose an operation, and click Submit.</p>

  <form method="post" action="result.jsp">
    <label>
      Number A:
      <input type="text" name="a" required />
    </label>
    <br/><br/>

    <label>
      Number B:
      <input type="text" name="b" required />
    </label>
    <br/><br/>

    <label>
      Operation:
      <select name="op" required>
        <option value="add">Add (+)</option>
        <option value="sub">Subtract (-)</option>
        <option value="mul">Multiply (×)</option>
        <option value="div">Divide (÷)</option>
      </select>
    </label>
    <br/><br/>

    <button type="submit">Submit</button>
  </form>

  <p style="margin-top:16px;">
    <a href="about.jsp">About</a>
  </p>
</body>
</html>