<%-- 
    Document   : about
    Created on : Nov 1, 2023, 1:42:18 PM
    Author     : trang
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!--
            
        TemplateMo 553 Xtra Blog
        
        https://templatemo.com/tm-553-xtra-blog
        
        -->
    </head>
    <body>
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

                        <li class="tm-nav-item active"><a href="about.jsp" class="tm-nav-link">
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
                        <form method="GET" class="form-inline tm-mb-80 tm-search-form">                
                            <input class="form-control tm-search-input" name="query" type="text" placeholder="Search..." aria-label="Search">
                            <button class="tm-search-button" type="submit">
                                <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                            </button>                                
                        </form>
                    </div>                
                </div>            
                <div class="row tm-row tm-mb-45">
                    <div class="col-12">
                        <hr class="tm-hr-primary tm-mb-55">
                        <img src="img/about-01.jpg" alt="Image" class="img-fluid">
                    </div>
                </div>
                <div class="row tm-row tm-mb-40">
                    <div class="col-12">                    
                        <div class="mb-4">
                            <h2 class="pt-2 tm-mb-40 tm-color-primary tm-post-title">About this xtra blog</h2>
                            <p>
                                XBlog là một nền tảng du lịch đáng tin cậy và chân thành, được thiết kế với mục đích giới thiệu cảnh vật Ninh Bình và những trải nghiệm du lịch độc đáo tại đây. Với sứ mệnh khám phá và chia sẻ những điểm đến tuyệt vời, XBlog không chỉ là một trang web thông tin, mà còn là nguồn cảm hứng cho những người yêu thích du lịch.
                            </p>
                            <p>
                                Ninh Bình 
                                Với cảnh vật tuyệt đẹp, Ninh Bình được mệnh danh là "Hạ Long trên cạn" và "Thần đồng tự nhiên của Việt Nam". XBlog muốn giới thiệu vẻ đẹp hoang sơ của các danh thắng nổi tiếng như Tam Cốc - Bích Động, Cúc Phương, Tràng An và nhiều điểm đến khác. Bạn sẽ có cơ hội khám phá những rừng núi, hang động độc đáo và thưởng ngoạn khoảnh khắc tĩnh lặng giữa thiên nhiên tuyệt vời.
                            </p>                            
                        </div>                    
                    </div>
                </div>
                <div class="row tm-row tm-mb-120">
                    <div class="col-lg-4 tm-about-col">
                        <div class="tm-bg-gray tm-about-pad">
                            <div class="text-center tm-mt-40 tm-mb-60">
                                <i class="fas fa-bezier-curve fa-4x tm-color-primary"></i>                            
                            </div>                        
                            <h2 class="mb-3 tm-color-primary tm-post-title">Background</h2>
                            <p class="mb-0 tm-line-height-short">
                                XBlog ra đời với mong muốn tạo ra một diễn đàn trực tuyến mang tính độc lập
                                và chân thành về du lịch Ninh Bình. Chúng tôi là một nhóm các nhà yêu thích 
                                du lịch đã trải nghiệm và khám phá toàn bộ vẻ đẹp của Ninh Bình. Với tình yêu
                                và đam mê, chúng tôi quyết định tạo nên XBlog như một cống hiến vì giáo dục du
                                lịch và sự phát triển bền vững của vùng đất này.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4 tm-about-col">
                        <div class="tm-bg-gray tm-about-pad">
                            <div class="text-center tm-mt-40 tm-mb-60">
                                <i class="fas fa-users-cog fa-4x tm-color-primary"></i>                            
                            </div>                        
                            <h2 class="mb-3 tm-color-primary tm-post-title">Teamwork</h2>
                            <p class="mb-0 tm-line-height-short">
                                Gia đình XBlog tự hào được xây dựng dựa trên tinh thần Teamwork
                                - một giá trị quan trọng mà chúng tôi đặt lên hàng đầu trong mọi
                                hoạt động. Chúng tôi tin rằng, khi làm việc nhóm một cách hòa hợp
                                và hiệu quả, chúng ta có thể đạt được những kỳ vọng và mục tiêu cao hơn.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4 tm-about-col">
                        <div class="tm-bg-gray tm-about-pad">
                            <div class="text-center tm-mt-40 tm-mb-60">
                                <i class="fab fa-creative-commons-sampling fa-4x tm-color-primary"></i>                            
                            </div>                        
                            <h2 class="mb-3 tm-color-primary tm-post-title">Our Core Value</h2>
                            <p class="mb-0 tm-line-height-short">
                                Ở Xtra, chúng tôi tin tưởng mạnh mẽ vào sức mạnh của các giá trị,
                                chúng tạo nên danh tính của công ty chúng tôi và thúc đẩy mọi hành động của chúng tôi. 
                            </p>
                        </div>
                    </div>
                </div>            
                <div class="row tm-row tm-mb-60">
                    <div class="col-12">
                        <hr class="tm-hr-primary  tm-mb-55">
                    </div>                
                    <div class="col-lg-6 tm-mb-60 tm-person-col">
                        <div class="media tm-person">
                            <img src="img/about-06.jpg" width="140px" height="210px"  alt="Image" class="img-fluid mr-4">
                            <div class="media-body">
                                <h2 class="tm-color-primary tm-post-title mb-2">Đinh Huy Tráng</h2>
                                <h3 class="tm-h3 mb-3">CEO/Founder</h3>
                                <p class="mb-0 tm-line-height-short">
                                    A Founder CEO, often written as Founder / CEO and also as Founder & CEO 
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 tm-mb-60 tm-person-col">
                        <div class="media tm-person">
                            <img src="img/about-07.jpg" width="130px" height="180px" alt="Image" class="img-fluid mr-4">
                            <div class="media-body">
                                <h2 class="tm-color-primary tm-post-title mb-2">Bùi Ngọc Anh</h2>
                                <h3 class="tm-h3 mb-3">Project Director</h3>
                                <p class="mb-0 tm-line-height-short">
                                    A project director is a person responsible for leading a team of project managers.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 tm-mb-60 tm-person-col">
                        <div class="media tm-person">
                            <img src="img/about-06.jpg" width="140px" height="210px"  alt="Image" class="img-fluid mr-4">
                            <div class="media-body">
                                <h2 class="tm-color-primary tm-post-title mb-2">Trần Thanh Bình</h2>
                                <h3 class="tm-h3 mb-3">Supervisor</h3>
                                <p class="mb-0 tm-line-height-short">
                                    The supervisor's overall role is to communicate organizational needs, oversee employees' performance.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 tm-mb-60 tm-person-col">
                        <div class="media tm-person">
                            <img src="img/about-07.jpg" width="130px" height="180px" alt="Image" class="img-fluid mr-4">
                            <div class="media-body">
                                <h2 class="tm-color-primary tm-post-title mb-2">Đinh Quang Duy</h2>
                                <h3 class="tm-h3 mb-3">Team Leader</h3>
                                <p class="mb-0 tm-line-height-short">
                                    A person who rules or guides or inspires others. Antonyms: follower. a person who accepts the leadership of another.
                                </p>
                            </div>
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
