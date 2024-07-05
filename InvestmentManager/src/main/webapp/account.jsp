<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.chainsys.investmentmanager.model.User" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account</title>
<link rel="stylesheet" href="style.css">
</head>
<body class="light">
<%
	HttpSession session1 = request.getSession(false);
    User currentUser = (User) session.getAttribute("currentUser");

    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<main>
    <div class="big-wrapper light">
        <img src="./img/shape.png" alt="" class="shape" />

        <header>
            <div class="container">
                <div class="logo">
                    <img src="./img/logo.png" alt="Logo" /> 
                    <a href="index.jsp"><h3>INVESTA</h3></a>
                </div>

                <div class="links">
                    <ul>
                        <li><a href="#">Services</a></li>
                        <li><a href="#">Bank Account</a></li>
                        <li><a href="#">Portfolio</a></li>
                        <li><a href="#"><i class="fas fa-user"></i> <%= currentUser.getUsername() %></a></li>
                        <li><a href="login.jsp" class="btn">Sign out</a></li>
                    </ul>
                </div>

                <div class="overlay"></div>

                <div class="hamburger-menu">
                    <div class="bar"></div>
                </div>
            </div>
        </header>

        <section class="account-info">
            <div class="container">
                <h1>Welcome, <%= currentUser.getUsername() %></h1>
                <p>User ID: <%= currentUser.getUserid() %></p>
                <p>Email: <%= currentUser.getEmail() %></p>
               
            </div>
        </section>

        <section class="bank-account-link">
            <div class="container">
                <form class="login-form" action="BankAccount" method="post">
                    <div class="form-group">
                        <label for="bankName">Bank Name</label>
                        <input type="text" id="bankName" name="bankName" required>
                    </div>

                    <div class="form-group">
                        <label for="userPan">User PAN</label>
                        <input type="text" id="userPan" name="userPan" required>
                    </div>

                    <div class="form-group">
                        <label for="accountNumber">Account Number</label>
                        <input type="text" id="accountNumber" name="accountNumber" required>
                    </div>

                    <div class="form-group">
                        <label for="accountType">Account Type</label>
                        <select id="accountType" name="accountType" required>
                            <option value="current">Current</option>
                            <option value="savings">Savings</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="amountInvesting">Amount Investing</label>
                        <input type="number" id="amountInvesting" name="amountInvesting" required>
                    </div>

                    <button type="submit" class="btn">Link Account</button>
                    <% if (request.getParameter("error") != null) { %>
                        <p style="color:red;">Failed to link bank account. Please try again.</p>
                    <% } %>
                </form>
            </div>
        </section>
    </div>
</main>
</body>
</html>
