<%-- 
    Document   : index
    Created on : Nov 1, 2023, 1:39:52 PM
    Author     : trang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            :root {
                --delete-red: red;
            }

            body {
                margin: 32px;
            }

            .btn {
                display: flex;
                align-items: center;
                background: none;
                border: 1px solid #ccc;
                height: 48px;
                padding: 0 24px 0 16px;
                letter-spacing: 0.25px;
                border-radius: 24px;
                cursor: pointer;
            }

            .btn:focus {
                outline: none;
            }

            .btn .mdi {
                margin-right: 8px;
            }

            .btn-delete {
                font-size: 16px;
                color: var(--delete-red);
            }
            .btn-delete > .mdi-delete-empty {
                display: none;
            }

            .btn-delete:hover {
                background-color: #ff9999;
            }

            .btn-delete:hover > .mdi-delete-empty {
                display: block;
            }

            .btn-delete:hover > .mdi-delete {
                display: none;
            }

            .btn-delete:focus {
                box-shadow: 0 0 0 4px #ff6666;
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
                        <li class="tm-nav-item active"><a href="Home" class="tm-nav-link">
                                <i class="fas fa-home"></i>
                                Blog Home
                            </a></li>

                        <c:if test="${u != null && u.role eq 1}">
                            <li class="tm-nav-item"><a href="Home?service=add" class="tm-nav-link">
                                    <i class="fas fa-pen"></i>
                                    Create a Post
                                </a></li>
                            </c:if>

                        <li class="tm-nav-item"><a href="about.jsp" class="tm-nav-link">
                                <i class="fas fa-users"></i>
                                About Xtra
                            </a></li>
                        <li class="tm-nav-item"><a href="contact.jsp" class="tm-nav-link">
                                <i class="far fa-comments"></i>
                                Contact Us
                            </a></li>

                        <c:choose>
                            <c:when test="${u != null}">
                                <li class="tm-nav-item"><a href="Login?service=logout" class="tm-nav-link">
                                        <i class="far fa-comments"></i>
                                        Logout
                                    </a></li>
                                </c:when>
                                <c:otherwise>
                                <li class="tm-nav-item"><a href="Login" class="tm-nav-link">
                                        <i class="far fa-comments"></i>
                                        Login
                                    </a></li>
                                </c:otherwise>
                            </c:choose>
                    </ul>

                </nav>
                <div class="tm-mb-65">
                    <a rel="nofollow" href="https://fb.com/templatemo" class="tm-social-link">
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
        </header>
        <div class="container-fluid">
            <main class="tm-main">
                <!-- Search form -->
                <div class="row tm-row">
                    <div class="col-12">
                        <form method="POST" action="Home" class="form-inline tm-mb-80 tm-search-form">       
                            <input type="hidden" name="service" value="search">
                            <input class="form-control tm-search-input" name="content" type="text" placeholder="Search..." aria-label="Search">
                            <button class="tm-search-button" type="submit">
                                <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                            </button>                                
                        </form>
                    </div>                
                </div>            
                <div class="row tm-row">
                    <c:forEach items="${data}" var="v">
                        <article class="col-12 col-md-6 tm-post">
                            <hr class="tm-hr-primary"> 

                            <a href="DetailBlog?id=${v.getPostID()}" class="effect-lily tm-post-link tm-pt-60">
                                <div class="tm-post-link-inner">
                                    <img src="images/${v.getImageURL()}" alt="img/img-01.jpg" class="img-fluid">                            
                                </div>
                                <h2 class="tm-pt-30 tm-color-primary tm-post-title">${v.getTitle()}</h2>
                            </a> 

                            <p class="tm-pt-30">
                                ${v.getSummarise()}
                            </p>
                            <div class="d-flex justify-content-between tm-pt-45">
                                <fmt:parseDate value="${v.getPostDate()}" pattern="yyyy-MM-dd HH:mm:ss.SSS" var="dateObject" />
                                <fmt:formatDate value="${dateObject}" pattern="MMMM dd, yyyy" var="formattedDate" />
                                <span class="tm-color-primary">${formattedDate}

                                </span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <jsp:useBean id="myBean" class="DAO.DAO" scope="page" />

                                <c:set var="result" value="${myBean.countCommentsForPost(v.getPostID())}" />
                                <span>${result} comments</span>
                                <span>by Admin</span>
                                <span> <c:if test="${u != null && u.role eq 1}">
                                        <form action="Home" method="post">
                                            <input type="hidden" name="service" value="delete">
                                            <input type="hidden" name="postID" value="${v.getPostID()}">
                                            <button type="submit" class="btn btn-delete" onclick="return confirm('Are you sure to delete this post')">
                                                <span class="mdi mdi-delete mdi-24px"></span>
                                                <span class="mdi mdi-delete-empty mdi-24px"></span>
                                                <span>Delete</span>
                                            </button>
                                        </form>
                                        <form action="Update" method="">
                                            <input type="hidden" name="postID" value="${v.getPostID()}">
                                            <button type="submit" class="btn btn-delete">
                                                <span class="mdi mdi-delete mdi-24px"></span>
                                                <span class="mdi mdi-delete-empty mdi-24px"></span>
                                                <span>Update</span>
                                            </button>
                                        </form>

                                    </c:if></span>
                            </div>
                        </article>
                    </c:forEach>
                </div>

                <footer class="row tm-row">
                    <hr class="col-12">
                    <div class="col-md-6 col-12 tm-color-gray">
                        Design: <a rel="nofollow" target="_parent" href="https://templatemo.com" class="tm-external-link">TemplateMo</a>
                    </div>
                    <div class="col-md-6 col-12 tm-color-gray tm-copyright">
                        Copyright 2020 Xtra Blog Company Co. Ltd.
                    </div>
                </footer>
            </main>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/templatemo-script.js"></script>
    </body>
</html>
