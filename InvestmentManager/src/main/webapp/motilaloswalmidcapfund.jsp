<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Motilal Oswal MidCap Fund </title>
<link rel="stylesheet" href="style.css" />
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
        justify-content: space-between;
        align-items: flex-start;
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 2rem;
    }

    #chart-container {
        width: 60%;
        height: 600px;
    }

    .form-container {
        width: 35%;
        background: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 2rem;
    }

    .mutual-fund-form label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: bold;
    }

    .mutual-fund-form input,
    .mutual-fund-form select {
        width: 100%;
        padding: 0.5rem;
        margin-bottom: 1rem;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .mutual-fund-form button {
        width: 100%;
        padding: 0.75rem;
        background: var(--mainColor);
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 1rem;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .mutual-fund-form button:hover {
        background: var(--hoverColor);
    }

    .mutual-fund-title {
        text-align: center;
        margin-bottom: 2rem;
        color: #333;
    }
     .mutual-fund-title img {
        width: 40px;
        margin-right: 0.6rem;
    }

    .invest-now-button {
        display: none;
        width: 100%;
        padding: 0.75rem;
        background: var(--mainColor);
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 1rem;
        cursor: pointer;
        transition: background 0.3s ease;
        text-align: center;
        margin-top: 1rem;
    }

    .invest-now-button:hover {
        background: var(--hoverColor);
    }
</style>
</head>
<body>
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
            <section class="main-content">
                <div id="chart-container">
                    <canvas id="investmentChart"></canvas>
                </div>
                <div class="form-container">
                    <h1 class="mutual-fund-title">
                     <img src="./img/motilal-oswal.png" alt="Company Logo" /> 
                    Motilal Oswal Mid Cap Fund
                    </h1>
                    <form class="mutual-fund-form" id="investment-form" action="fund" method="post">
                    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
                    <input type="hidden" value="Motilal Oswal Mid CapFund " name="mutualFundName">
    				<input type="hidden" name="dateOfInvestment" id="dateOfInvestment" />			
                        <label>Select Investment Type:</label>
                        <select name="investmentType" id="investmentType" onchange="showForm(this.value)">
                            <option value="">Select</option>
                            <option value="lumpsum">Lumpsum</option>
                            <option value="sip">SIP</option>
                        </select>
                        <br><br>
                        <div id="mutual-fund-lumpsum-form" style="display:none;">
                            <label>Principal Amount:</label>
                            <input type="number" name="principal" id="principal" step="0.01">
                        </div>
                        <div id="mutual-fund-sip-form" style="display:none;">
                            <label>SIP Contribution per period:</label>
                            <input type="number" name="sipContribution" id="sipContribution" step="0.01">
                        </div>
                        <label>Estimated Rate of Return (%):</label>
                        <input type="number" name="rateOfReturn" id="rateOfReturn" value="14.20" step="0.01" readonly>
                        <label>Holding Period (in months):</label>
                        <input type="number" name="holdingPeriod" id="holdingPeriod" required>
                        <br><br>
                        <button type="button" onclick="calculateInvestment()">Calculate</button>
                        <button type="submit" class="invest-now-button" id="invest-now-button" style="display:none;">Invest Now</button>
                    </form>
                </div>
            </section>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        let chart; 
        function showForm(type) {
          
            document.getElementById('mutual-fund-lumpsum-form').style.display = 'none';
            document.getElementById('mutual-fund-sip-form').style.display = 'none';
           
            document.getElementById('principal').value = '';
            document.getElementById('sipContribution').value = '';
            document.getElementById('holdingPeriod').value = '';
          
            if (type) {
                document.getElementById('mutual-fund-' + type + '-form').style.display = 'block';
            }
        }

        function calculateInvestment() {
            const investmentType = document.getElementById('investmentType').value;
            const rateOfReturn = parseFloat(document.getElementById('rateOfReturn').value) / 100;
            const holdingPeriod = parseInt(document.getElementById('holdingPeriod').value);

            let maturityAmount = 0;
            let totalInvestment = 0;
            let data = [];

            if (investmentType === 'lumpsum') {
                const principal = parseFloat(document.getElementById('principal').value);
                const monthlyRate = Math.pow(1 + rateOfReturn, 1 / 12) - 1;
                totalInvestment = principal;
                for (let i = 1; i <= holdingPeriod; i++) {
                    maturityAmount = principal * Math.pow((1 + monthlyRate), i);
                    data.push({
                        period: i,
                        investment: principal,
                        gain: maturityAmount - principal
                    });
                }
            } else if (investmentType === 'sip') {
                const sipContribution = parseFloat(document.getElementById('sipContribution').value);
                const monthlyRate = rateOfReturn / 12;
                for (let i = 1; i <= holdingPeriod; i++) {
                    totalInvestment += sipContribution;
                    maturityAmount += sipContribution * Math.pow((1 + monthlyRate), (holdingPeriod - i + 1));
                    data.push({
                        period: i,
                        investment: totalInvestment,
                        gain: maturityAmount - totalInvestment
                    });
                }
            }

            drawChart(data);
            document.getElementById('invest-now-button').style.display = 'block';
        }

        function drawChart(data) {
            const ctx = document.getElementById('investmentChart').getContext('2d');
            const labels = data.map(entry => `Month ${entry.period}`);
            const investments = data.map(entry => entry.investment);
            const gains = data.map(entry => entry.gain);

            if (chart) {
                chart.destroy();
            }

            chart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Investment',
                            data: investments,
                            borderColor: 'blue',
                            fill: false
                        },
                        {
                            label: 'Gain',
                            data: gains,
                            borderColor: 'green',
                            fill: false
                        }
                    ]
                },
                options: {
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Investment Growth Over Time'
                    },
                    scales: {
                        xAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Month'
                            }
                        }],
                        yAxes: [{
                            display: true,
                            scaleLabel: {
                                display: true,
                                labelString: 'Amount'
                            }
                        }]
                    }
                }
            });
        }
        function showSuccessMessage() {
            Swal.fire({
                icon: 'success',
                title: 'Investment Successful',
                text: 'Your investment has been successfully made!'
            });
        }

        function checkStatus() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('status') === 'success') {
                showSuccessMessage();
            }
        }

        document.addEventListener('DOMContentLoaded', checkStatus);
        
        
    </script>
</body>
</html>
