<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Investa</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
	<main>
		<div class="big-wrapper light">
			<img src="./img/shape.png" alt="" class="shape">
			<header>
				<div class="container">
					<div class="logo">
						<img src="./img/logo.png" alt="Logo"> <a href="index.jsp"><h3>INVESTA</h3></a>
					</div>
					<div class="links">
						<ul>
							<%
							if (session.getAttribute("username") != null) {
							%>
							<li class="dropdown"><input type="hidden" id="status"
								value="${param.status}"> <input type="hidden"
								id="message" value="${param.message}"> <a href="#"
								class="dropbtn">Services&Products</a>
								<div class="dropdown-content">
									<a href="mutualfund.jsp">Mutual Funds</a> <a
										href="goldcalculation.jsp">Gold</a>
								</div></li>
							<li><a href="account.jsp">Bank Account</a></li>
							<li><a href="portfolio.jsp"><i class="fas fa-user"></i> <%=session.getAttribute("username")%></a></li>
							<li><a href="logout" class="btn">Sign out</a></li>
							<%
							} else {
							%>
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
					<div class="overlay"></div>
					<div class="hamburger-menu">
						<div class="bar"></div>
					</div>
				</div>
			</header>
			<div class="showcase-area">
				<div class="container">
					<div class="left">
						<div class="big-title">
							<h1>Future is here,</h1>
							<h1>Start Investing now.</h1>
						</div>
						<p class="text">With a good perspective on history, we can
							have a better understanding of the past and present, and thus a
							clear vision of the future.</p>
						<div class="cta">
							<a href="#" class="btn">Get started</a>
						</div>
					</div>
					<img src="./img/person.jpg" alt="Person Image" class="person">
				</div>
			</div>
			<div class="bottom-area">
				<div class="container">
					<button class="toggle-btn">
						<i class="far fa-moon"></i> <i class="far fa-sun"></i>
					</button>
				</div>
			</div>
		</div>
	</main>
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="./app.js"></script>
	<script>
	 function showMessage(status, message) {
         Swal.fire({
             icon: status === 'success' ? 'success' : 'error',
             title: message
         });
     }

     document.addEventListener('DOMContentLoaded', function() {
         const status = '${status}';
         const message = '${message}';
         if (status && message) {
             showMessage(status, message);
         }
	
	document.addEventListener('DOMContentLoaded', function() {
	    const status = '${status}';
	    const message = '${message}';
	    if (status && message) {
	        showMessage(status, message);
	    }
	});
	</script>
</body>
</html>
