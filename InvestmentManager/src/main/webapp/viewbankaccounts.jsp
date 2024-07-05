<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.chainsys.investmentmanager.model.BankAccount" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Bank Accounts</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<main>
    <div class="big-wrapper light">
        <img src="./img/shape.png" alt="" class="shape">

        <header>
            <div class="container">
                <div class="logo">
                    <img src="./img/logo.png" alt="Logo">
                    <a href="index.jsp"><h3>INVESTA</h3></a>
                </div>

                <div class="links">
                    <ul>
                        <li><a href="#">Services</a></li>
                        <li><a href="#">Bank Account</a></li>
                        <li><a href="#">Portfolio</a></li>
                        <li><a href="#" class="btn">Sign In</a></li>
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
                <h1>Your Bank Accounts</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Bank Name</th>
                            <th>PAN</th>
                            <th>Account Number</th>
                            <th>Account Type</th>
                            <th>Amount Investing</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<BankAccount> accountList = (List<BankAccount>) request.getAttribute("accountList");
                            for (BankAccount account : accountList) {
                        %>
                        <tr>
                            <td><%= account.getBankname() %></td>
                            <td><%= account.getPan() %></td>
                            <td><%= account.getAcNum() %></td>
                            <td><%= account.getAccountType() %></td>
                            <td><%= account.getAmountInvesting() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</main>
</body>
</html>
