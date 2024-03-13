<%-- 
    Document   : login
    Created on : Nov 1, 2023, 1:49:48 PM
    Author     : trang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xtra Blog</title>
        <link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/templatemo-xtra-blog.css" rel="stylesheet">

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@700&family=Poppins:wght@400;500;600&display=swap');
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }
            body{
                margin: 0;
                padding: 0;
                background: linear-gradient(120deg,#2980b9, #8e44ad);
                height: 100vh;
                overflow: hidden;
            }
            .center{
                position: absolute;
                top: 50%;
                left: 50%;
                margin-left: 200%;
                transform: translate(-50%, -50%);
                width: 400px;
                background: white;
                border-radius: 10px;
                box-shadow: 10px 10px 15px rgba(0,0,0,0.05);
            }
            .center h1{
                text-align: center;
                padding: 20px 0;
                border-bottom: 1px solid silver;
            }
            .center form{
                padding: 0 40px;
                box-sizing: border-box;
            }
            form .txt_field{
                position: relative;
                border-bottom: 2px solid #adadad;
                margin: 30px 0;
            }
            .txt_field input{
                width: 100%;
                padding: 0 5px;
                height: 40px;
                font-size: 16px;
                border: none;
                background: none;
                outline: none;
            }
            .txt_field label{
                position: absolute;
                top: 50%;
                left: 5px;
                color: #adadad;
                transform: translateY(-50%);
                font-size: 16px;
                pointer-events: none;
                transition: .5s;
            }
            .txt_field span::before{
                content: '';
                position: absolute;
                top: 40px;
                left: 0;
                width: 0%;
                height: 2px;
                background: #2691d9;
                transition: .5s;
            }
            .txt_field input:focus ~ label,
            .txt_field input:valid ~ label{
                top: -5px;
                color: #2691d9;
            }
            .txt_field input:focus ~ span::before,
            .txt_field input:valid ~ span::before{
                width: 100%;
            }
            .pass{
                margin: -5px 0 20px 5px;
                color: #a6a6a6;
                cursor: pointer;
            }
            .pass:hover{
                text-decoration: underline;
            }
            input[type="submit"]{
                width: 100%;
                height: 50px;
                border: 1px solid;
                background: #2691d9;
                border-radius: 25px;
                font-size: 18px;
                color: #e9f4fb;
                font-weight: 700;
                cursor: pointer;
                outline: none;
            }
            input[type="submit"]:hover{
                border-color: #2691d9;
                transition: .5s;
            }
            .signup_link{
                margin: 30px 0;
                text-align: center;
                font-size: 16px;
                color: #666666;
            }
            .signup_link a{
                color: #2691d9;
                text-decoration: none;
            }
            .signup_link a:hover{
                text-decoration: underline;
            }

        </style>

    </head>
    <body>
        <header class="tm-header" id="tm-header">
            <div class="tm-header-wrapper">
                <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="tm-site-header">
                    <div class="mb-3 mx-auto tm-site-logo"><i class="fas fa-times fa-2x"></i></div>            
                    <h1 class="text-center">Xtra Blog</h1>
                </div>
                <nav class="tm-nav" id="tm-nav">            
                    <ul>
                        <li class="tm-nav-item"><a href="Home" class="tm-nav-link">
                                <i class="fas fa-home"></i>
                                Blog Home
                            </a></li>
                        <li class="tm-nav-item"><a href="about.jsp" class="tm-nav-link">
                                <i class="fas fa-users"></i>
                                About Xtra
                            </a></li>
                        <li class="tm-nav-item"><a href="contact.jsp" class="tm-nav-link">
                                <i class="far fa-comments"></i>
                                Contact Us
                            </a></li>
                        <li class="tm-nav-item active"><a href="Register" class="tm-nav-link">
                                <i class="far fa-comments"></i>
                                Register
                            </a></li>
                    </ul>
                </nav>
                <div class="tm-mb-65">
                    <a href="https://facebook.com" class="tm-social-link">
                        <i class="fab fa-facebook tm-social-icon"></i>
                    </a>
                    <a href="https://twitter.com" class="tm-social-link">
                        <i class="fab fa-twitter tm-social-icon"></i>
                    </a>
                    <a href="https://instagram.com" class="tm-social-link">
                        <i class="fab fa-instagram tm-social-icon"></i>
                    </a>
                    <a href="https://linkedin.com" class="tm-social-link">
                        <i class="fab fa-linkedin tm-social-icon"></i>
                    </a>
                </div>
                <p class="tm-mb-80 pr-5 text-white">
                    Xtra Blog is a multi-purpose HTML template from TemplateMo website. Left side is a sticky menu bar. Right side content will scroll up and down.
                </p>
            </div>

            <div class="container-fluid">
                <main class="tm-main">

                    <div class="center">
                        <h1>Sign Up</h1>
                        <form method="post" action="Register">
                            <input name="service" value="register" type="hidden">
                            <div class="txt_field">
                                <input type="text" name="user" required>
                                <span></span>
                                <label>Username</label>
                            </div>
                            <div class="txt_field">
                                <input type="password" name="password" required>
                                <span></span>
                                <label>Password</label>
                            </div>
                            <div class="txt_field">
                                <input type="password" name="repass" required>
                                <span></span>
                                <label>Re Password</label>
                            </div>
                            <div class="signup_link">
                                Have a account? <a href="Login">Sign in</a>
                            </div>
                            <p style="color: red;text-align: center">${error}</p>
                            <input type="submit" value="Sign Up">
                        </form>
                    </div>


































                </main>











            </div>
    </body>
</html>
