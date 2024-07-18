<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MF - Investa</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<main>
		<div class="big-wrapper light">


			<header>
				<div class="container">
					<div class="logo">
						<img src="./img/logo.png" alt="Logo" /> <a href="home.jsp"><h3>INVESTA</h3></a>
					</div>

					<div class="links">
						<ul>
							<%
							if (session.getAttribute("username") != null) {
							%>
							<li class="dropdown"><a href="#" class="dropbtn">Services&Products</a>
								<div class="dropdown-content">
									<a href="mutualfund.jsp">Mutual Funds</a> <a
										href="goldcalculation.jsp">Gold</a>
									<!-- Add more dropdown items if needed -->
								</div></li>
							<li><a href="account.jsp">Bank Account</a></li>
							<li><a href="#"><i class="fas fa-user"></i> <%=session.getAttribute("username")%></a></li>
							<li><a href="login.jsp" class="btn">Sign out</a></li>






							<%
							} else {
							%>
							<!-- User is not logged in -->
							<li class="dropdown"><a href="#" class="dropbtn">Services&Products</a>
								<div class="dropdown-content">
									<a href="#">Bank Account</a> <a href="#">Portfolio</a> <a
										href="mutualfund.jsp">Mutual Funds</a>
								</div></li>
							<%
							}
							%>
						</ul>
					</div>



					<div class="hamburger-menu">
						<div class="bar"></div>
					</div>
				</div>
			</header>

			<section class="investment-section">
				<div class="investment-container"></div>
			</section>

			<section class="funds-section">
				<div class="funds-card">
					<div class="card-header">
						<h4 class="card-title">Top 5 Equity Mutual Funds</h4>
					</div>
					<div class="card-content">
						<div class="row header-row">
							<div class="col">Company</div>
							<div class="col returns-col">5Y Returns (Annualized) %</div>
						</div>
						<div class="row content-row">
							<div class="col logo-col">
								<img src="./img/nippon.png" alt="Fund Logo" class="fund-logo" />
							</div>
							<div class="col fund-info-col">
								<a href="nipponindiasmallcapfund.jsp" class="fund-link">Nippon
									India Small Cap Fund</a>
							</div>
							<div class="col returns-col">
								<p class="returns">15.00% p.a.</p>
							</div>
							<div class="col invest-btn-col">

								<input type="hidden" name="fundName"
									value="Nippon India Small Cap Fund"> <a
									href="nipponindiasmallcapfund.jsp"><button type="submit"
										class="invest-btn">Invest</button></a>

							</div>
						</div>
						<div class="row content-row">
							<div class="col logo-col">
								<img src="./img/motilal-oswal.png" alt="Fund Logo"
									class="fund-logo" />
							</div>
							<div class="col fund-info-col">
								<a href="motilaloswalmidcapfund.jsp" class="fund-link">Motilal
									Oswal Midcap Fund</a>
							</div>
							<div class="col returns-col">
								<p class="returns">14.20% p.a.</p>
							</div>
							<div class="col invest-btn-col">

								<input type="hidden" name="fundName"
									value="Motilal Oswal Midcap Fund"> <a
									href="motilaloswalmidcapfund.jsp"><button type="submit"
										class="invest-btn">Invest</button></a>

							</div>
						</div>
						<div class="row content-row">
							<div class="col logo-col">
								<img src="./img/jm-flexicap.png" alt="Fund Logo"
									class="fund-logo" />
							</div>
							<div class="col fund-info-col">
								<a href="jmflexicapfund.jsp" class="fund-link">JM Felixicap
									Fund</a>
							</div>
							<div class="col returns-col">
								<p class="returns">13.48% p.a.</p>
							</div>
							<div class="col invest-btn-col">

								<input type="hidden" name="fundName" value="JM Felixicap Fund">
								<a href="jmflexicapfund.jsp"><button type="submit"
										class="invest-btn">Invest</button></a>

							</div>
						</div>
						<div class="row content-row">
							<div class="col logo-col">
								<img src="./img/icici.png" alt="Fund Logo" class="fund-logo" />
							</div>
							<div class="col fund-info-col">
								<a href="icicprudentialfund.jsp" class="fund-link">ICIC
									Prudential Value Discovery Fund</a>
							</div>
							<div class="col returns-col">
								<p class="returns">13.24% p.a.</p>
							</div>
							<div class="col invest-btn-col">

								<input type="hidden" name="fundName"
									value="ICIC Prudential Value Discovery Fund"> <a
									href="icicprudential.jsp"><button type="submit"
										class="invest-btn">Invest</button></a>

							</div>
						</div>
						<div class="row content-row">
							<div class="col logo-col">
								<img src="./img/nippon.png" alt="Fund Logo" class="fund-logo" />
							</div>
							<div class="col fund-info-col">
								<a href="nipponindiamulticapfund.jsp" class="fund-link">Nippon
									India Multi Cap Fund</a>
							</div>
							<div class="col returns-col">
								<p class="returns">12.00% p.a.</p>
							</div>
							<div class="col invest-btn-col">

								<input type="hidden" name="fundName"
									value="Nippon India Multi Cap Fund"> <a
									href="nipponindiamulticapfund.jsp"><button type="submit"
										class="invest-btn">Invest</button></a>

							</div>
						</div>

					</div>
				</div>
			</section>
		</div>
	</main>
</body>
</html>
