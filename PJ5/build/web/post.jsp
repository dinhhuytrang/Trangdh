<%-- 
    Document   : post
    Created on : Nov 1, 2023, 1:44:29 PM
    Author     : trang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xtra Blog</title>
        <link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/templatemo-xtra-blog.css" rel="stylesheet">
        <!--
            
        TemplateMo 553 Xtra Blog
        
        https://templatemo.com/tm-553-xtra-blog
        
        -->
        <style>
            div.content img {
                max-width: 100%;
                height: auto;
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
                        <li class="tm-nav-item "><a href="Home" class="tm-nav-link">
                                <i class="fas fa-home"></i>
                                Blog Home
                            </a></li>

                        <c:if test="${u != null && u.role eq 1}">
                            <li class="tm-nav-item"><a href="Home?service=add" class="tm-nav-link">
                                    <i class="fas fa-pen"></i>
                                    Create a Post
                                </a></li>
                            </c:if>

                        <li class="tm-nav-item active"><a class="tm-nav-link">
                                <i class="fas fa-users"></i>
                                View Detail
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
                <div class="row">
                    <div class="col-lg-8 tm-post-col">
                        <div class="tm-post-full">                    
                            <div class="mb-4" style="max-width: 100%;">
                                <h2 class="pt-2 tm-color-primary tm-post-title">${b.getTitle()}</h2>
                                <fmt:parseDate value="${b.getPostDate()}" pattern="yyyy-MM-dd HH:mm:ss.SSS" var="dateObject" />
                                <fmt:formatDate value="${dateObject}" pattern="MMMM dd, yyyy" var="formattedDate" />
                                <p class="tm-mb-40">${formattedDate} posted by Admin</p>
                                <div class="content">
                                    ${b.getContent()}
                                </div>
                            </div>
                        </div>



                        <!-- Comments -->
                        <div>
                            <h2 class="tm-color-primary tm-post-title">Comments</h2>
                            <hr class="tm-hr-primary tm-mb-45">
                            <c:forEach var="v" items="${comments}">
                                <div class="tm-comment tm-mb-45">
                                    <figure class="tm-comment-figure">
                                        <img src="img/comment-1.jpg" alt="Image" class="mb-2 rounded-circle img-thumbnail">
                                        <jsp:useBean id="myBean" class="DAO.DAO" scope="page" />
                                        <c:set var="name" value="${myBean.getUserById(v.getCommentByUserID())}" />
                                        <figcaption class="tm-color-primary text-center">${name.getUsername()}</figcaption>
                                    </figure>
                                    <div>
                                        <p>
                                            ${v.getCommentText()}
                                        </p>
                                        <div class="d-flex justify-content-between">
                                            <fmt:parseDate value="${v.getCommentDate()}" pattern="yyyy-MM-dd HH:mm:ss.SSS" var="dateObject" />
                                            <fmt:formatDate value="${dateObject}" pattern="MMMM dd, yyyy" var="formattedDate" />
                                            <span class="tm-color-primary">${formattedDate}</span>

                                            <c:if test="${u.getRole() == 1 || v.getCommentByUserID() == u.getId()}">
                                                <form action="DetailBlog" method="post">
                                                    <input type="hidden" name="service" value="deletecomment">
                                                    <input type="hidden" name="commentId" value="${v.getCommentID()}">
                                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure to delete this comment')">Delete</button>
                                                </form>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>



                            <c:choose>
                                <c:when test="${empty u}">
                                    <a href="Login">You need to login for comment</a>
                                </c:when>
                                <c:otherwise>
                                    <form action="DetailBlog" method="post" class="mb-5 tm-comment-form">
                                        <input type="hidden" name="userid" value="${u.getId()}">
                                        <input type="hidden" name="service" value="createcomment">
                                        <h2 class="tm-color-primary tm-post-title mb-4">Your comment</h2>
                                        <div class="mb-4">
                                            <textarea class="form-control" name="text" rows="6"></textarea>
                                        </div>
                                        <div class="text-right">
                                            <button class="tm-btn tm-btn-primary tm-btn-small">Submit</button>                        
                                        </div>
                                    </form>
                                </c:otherwise>
                            </c:choose>


                        </div>
                    </div>

                    <div class="col-lg-4 tm-aside-col">   
                        <div class="tm-post-sidebar">   
                            <hr class="mb-3 tm-hr-primary">
                            <h2 class="tm-mb-40 tm-post-title tm-color-primary">Some New Posts</h2>
                            <c:forEach items="${newestBlogPosts}" var="v">
                                <a href="DetailBlog?id=${v.getPostID()}" class="d-block tm-mb-40">
                                    <figure>
                                        <img src="images/${v.getImageURL()}" alt="Image" class="mb-3 img-fluid">
                                        <figcaption class="tm-color-primary">${v.getSummarise()}</figcaption>
                                    </figure>
                                </a>
                            </c:forEach>
                        </div>                    
                    </div>
                </div>

                <footer class="row tm-row">
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
