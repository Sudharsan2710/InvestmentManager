<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.chainsys.investmentmanager.model.Gold"%>
<%@ page import="com.chainsys.investmentmanager.model.User"%>
<%@ page import="com.chainsys.investmentmanager.model.BankAccount"%>
<%@ page import="com.chainsys.investmentmanager.dao.AccountDAO"%>
<%@ page import="com.chainsys.investmentmanager.dao.AccountImpl"%>
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
<link rel="stylesheet" href="style.css" >
<style>
   
    .main-content {
        width: 90%;
        margin: 20px auto;
    }

    .chart-container {
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #000;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 20px;
        position: relative;
        height: 360px; 
    }

    .chart-container canvas {
        width: 300px; 
        height: 300px; 
    }

    .text-container {
        position: absolute;
        left: 20px;
        top: 50%;
        transform: translateY(-50%);
        color: white;
        text-align: left;
    }

    .table-container {
        width: 48%;
        margin: 10px 1%;
        display: inline-block;
        vertical-align: top;
    }

    .table-container h3 {
        text-align: center;
    }

    .table-container table {
        width: 100%;
        border-collapse: collapse;
        margin: 10px 0;
    }

    .table-container table th,
    .table-container table td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: center;
    }

    .table-container table thead {
        background-color: #64bcf4;
        color: #fff;
    }

    .table-container:nth-child(2) {
        margin-right: 0; 
    }

    @media (max-width: 768px) {
        .table-container {
            width: 100%;
            margin: 10px 0;
        }

        .chart-container canvas {
            width: 100%;
        }
    }

    .chartjs-render-monitor .doughnut-label {
        fill: #fff !important;
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
    AccountDAO accountDAO = context.getBean(AccountDAO.class);
    double totalAmountInBankAccount= accountDAO.getTotalAmountInvestedByUserId(currentUser.getUserid());
    GoldInvestmentDAO goldInvestmentDAO = context.getBean(GoldInvestmentDAO.class);
    MutualFundInvestmentDAO mutualFundInvestmentDAO = context.getBean(MutualFundInvestmentDAO.class);
    List<Gold> goldInvestments = goldInvestmentDAO.getGoldInvestmentsByUserId(currentUser.getUserid());
    List<MutualFundInvestment> mutualInvestments = mutualFundInvestmentDAO.getMutualFundInvestmentsByUserId(currentUser.getUserid());
    double totalInvestedInGold = goldInvestmentDAO.getTotalGoldAmountInvested(currentUser.getUserid());
    double totalInvestedInMutualFunds=mutualFundInvestmentDAO.getTotalMutualAmountInvestedByUserId(currentUser.getUserid());
%>

<main>
    <div class="big-wrapper light">
        <header>
            <div class="container">
                <div class="logo">
                    <img src="./img/logo.png" alt="Logo" />
                    <a href="home.jsp"><h3>INVESTA</h3></a>
                </div>
                <div class="links">
                    <ul>
                        <li class="dropdown"><a href="#" class="dropbtn">Services&Products</a>
                        <div class="dropdown-content">
									<a href="mutualfund.jsp">Mutual Funds</a> 
									<a href="goldcalculation.jsp">Gold</a>
								</div></li>
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
                <div class="text-container">
                	<h4>Total Amount Invested:<%=request.getAttribute("totalAmountInBankAccount") %></h4>
                	 <h4>Amount Invested on Gold ETF & MutualFund:<%=request.getAttribute("totalInvested") %></h4>
                    <h4>Balance Amount:<%=request.getAttribute("remainingBalance") %></h4>
                   
                </div>
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
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        labels: {
                            color: '#fff'
                        }
                    }
                }
            }
        });
    });
    
   
 
</script>

</body>
</html>
