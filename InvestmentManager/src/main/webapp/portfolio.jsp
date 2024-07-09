<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.chainsys.investmentmanager.model.Gold"%>
<%@ page import="com.chainsys.investmentmanager.model.User"%>
<%@ page import="com.chainsys.investmentmanager.model.MutualFundInvestment"%>
<%@ page import="com.chainsys.investmentmanager.dao.MutualFundInvestmentDAO"%>
<%@ page import="com.chainsys.investmentmanager.dao.MutualFundInvestmentImpl"%>
<%@ page import="com.chainsys.investmentmanager.dao.GoldInvestmentDAO"%>
<%@ page import="com.chainsys.investmentmanager.dao.GoldImpl"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Portfolio Dashboard</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.12.2/dist/sweetalert2.min.css">
<style>
/* CSS styling */
:root {
    --mainColor: #64bcf4;
    --hoverColor: #5bacdf;
}

.light {
    --backgroundColor: #f1f8fc;
    --darkOne: #312f3a;
    --darkTwo: #45424b;
    --lightOne: #919191;
    --lightTwo: #aaa;
}

.dark {
    --backgroundColor: #192e3a;
    --darkOne: #f3f3f3;
    --darkTwo: #fff;
    --lightOne: #ccc;
    --lightTwo: #e7e3e3;
}

*,
*::before,
*::after {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

body {
    font-family: "Poppins", sans-serif;
}

.big-wrapper {
    padding: 1.7rem 0 2rem;
    width: 100%;
    min-height: 100vh;
    background-color: var(--backgroundColor);
}

header {
    width: 100%;
}

header .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
}

.logo {
    display: flex;
    align-items: center;
    cursor: pointer;
}

.logo img {
    width: 40px;
    margin-right: 0.6rem;
}

.logo h3 {
    color: var(--mainColor);
    font-size: 1.55rem;
    font-weight: 700;
}

.links ul {
    list-style: none;
    display: flex;
}

.links ul li {
    margin: 0 1rem;
}

.links ul li a {
    text-decoration: none;
    color: var(--darkOne);
    font-weight: 500;
}

.btn {
    background-color: var(--mainColor);
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 5px;
    text-decoration: none;
}

.main-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem;
}

.chart-container, .table-container {
    background: #fff;
    padding: 20px;
    border-radius: 5px;
    margin-bottom: 2rem;
    width: 80%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.chart-container {
    display: flex;
    align-items: center;
    justify-content: center;
}

table {
    width: 100%;
    border-collapse: collapse;
    font-family: Verdana, Helvetica, Arial, sans-serif;
}

table th, table td {
    padding: 8px;
    text-align: left;
}

table th {
    background-color: #f2f2f2;
}

table tbody td {
    border: none;
}

@media (max-width: 768px) {
    .main-content {
        flex-direction: column;
        align-items: center;
    }
    .chart-container, .table-container {
        width: 100%;
    }
}
</style>
</head>
<body>

<%
    session = request.getSession();
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    ApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
    GoldInvestmentDAO goldInvestmentDAO = context.getBean(GoldInvestmentDAO.class);
    MutualFundInvestmentDAO mutualFundInvestmentDAO = context.getBean(MutualFundInvestmentDAO.class);
    List<Gold> goldInvestments = goldInvestmentDAO.getGoldInvestmentsByUserId(currentUser.getUserid());
    List<MutualFundInvestment> mutualInvestments = mutualFundInvestmentDAO.getMutualFundInvestmentsByUserId(currentUser.getUserid());
%>

<main>
    <div class="big-wrapper light">
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
                        <li><a href="login.jsp" class="btn">Sign out</a></li>
                    </ul>
                </div>
                <div class="overlay"></div>
                <div class="hamburger-menu">
                    <div class="bar"></div>
                </div>
            </div>
        </header>
        <main class="main-content">
            <div class="chart-container">
                <canvas id="allocationChart"></canvas>
            </div>
            <div class="table-container">
                <h3>Gold Investment Details</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Gold Rate</th>
                            <th>Grams Purchased</th>
                            <th>Amount Invested</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Gold gold : goldInvestments) { %>
                        <tr>
                            <td><%= gold.getGoldRate() %></td>
                            <td><%= gold.getGramsPurchased() %></td>
                            <td><%= gold.getInvestmentAmountGold() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div class="table-container">
                <h3>Mutual Fund Investment Details</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Mutual Fund Name</th>
                            <th>Mutual Fund Type</th>
                            <th>Amount Invested</th>
                            <th>Months</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (MutualFundInvestment mfi : mutualInvestments) { %>
                        <tr>
                            <td><%= mfi.getMutualFundName() %></td>
                            <td><%= mfi.getCategoryName() %></td>
                            <td><%= mfi.getAmountInvestedOnFund() %></td>
                            <td><%= mfi.getHoldingMonths() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</main>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const allocationCtx = document.getElementById('allocationChart').getContext('2d');
        const allocationChart = new Chart(allocationCtx, {
            type: 'doughnut',
            data: {
                labels: ['Gold', 'Mutual Fund'],
                datasets: [{
                    data: [50, 50], // Update this with actual data
                    backgroundColor: ['#64bcf4', '#ffa500'],
                    hoverBackgroundColor: ['#5bacdf', '#ff8c00']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
    });
</script>

</body>
</html>
