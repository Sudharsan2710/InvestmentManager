<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Investa</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<link rel="stylesheet" href="js/sweetalert2.all.min.css">
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

            <section class="register-section">
                <div class="container">
                    <form class="register-form" method="post" action="/login">
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="contact">Contact:</label>
                            <input type="text" id="contact" name="contact" required>
                        </div>
                         <input type="hidden" id="status" name="status" value="${param.status}">
                        <button type="submit" class="btn">Register</button>
                       <a href="forgot.jsp"> <p class="forgot-password">Forgot your password?</p></a>
                    </form>
                </div>
            </section>
        </div>
    </main>
    <script>
    // Function to handle response from the servlet
    function handleResponse(status, message) {
        if (status === 'success') {
            swal("Success!", message, "success");
        } else {
            swal("Error!", message, "error");
        }
    }

    // Get the status and message from hidden input field
    const status = document.getElementById('status').value;
    const message = "${param.message}";

    // If status and message exist, handle the response
    if (status && message) {
        handleResponse(status, message);
    }
    
 
    function validateForm() {
        // Validate username
        const username = document.getElementById('username').value;
        if (username.trim() === "") {
            swal("Error!", "Username cannot be empty.", "error");
            return false;
        }

        // Validate email
        const email = document.getElementById('email').value;
        if (!email.includes("@")) {
            swal("Error!", "Email must contain '@' symbol.", "error");
            return false;
        }

        // Validate password
        const password = document.getElementById('password').value;
        const passwordPattern = /^[A-Z].{7,}$/;
        if (!passwordPattern.test(password)) {
            swal("Error!", "Password must be at least 8 characters long and start with a capital letter.", "error");
            return false;
        }

        // Validate contact
        const contact = document.getElementById('contact').value;
        const contactPattern = /^\d{10}$/;
        if (!contactPattern.test(contact)) {
            swal("Error!", "Contact must contain exactly 10 digits.", "error");
            return false;
        }

        return true;
    }
</script>
</body>
</html>