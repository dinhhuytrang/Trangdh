<%-- 
    Document   : index
    Created on : Nov 1, 2023, 1:39:52 PM
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/UserDetailStyle.css" rel="stylesheet">
        <link href="css/UserDetail.css" rel="stylesheet" />
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.tiny.cloud/1/no-api-key/tinymce/6/tinymce.min.js"
            referrerpolicy="origin"
        ></script>
        <script src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-jquery@2/dist/tinymce-jquery.min.js"></script>

    </head>
    <body>
        <div class="container h-100">
            <div class="row d-flex justify-content-around align-items-center h-100">
                <div class="col-xl-9 col-lg-8 col-xl-5 offset-xl-1">       
                    <form method="POST" action="Update" enctype="multipart/form-data" style="margin-top: 30px" id="form">
                        <div class="card" style="border-radius: 15px;">
                            <h1 class="mb-4" style="text-align: center; margin-top: 20px">UPDATE YOUR BLOG</h1>
                            <div class="card-body">
                                <div class="row align-items-center pt-4 pb-3">
                                    <div class="col-md-3 ps-5">             
                                    </div>
                                    <div class="col-md-9 pe-5">
                                        <p style="color: red; text-align: right">(*) is required</p>                                                    
                                    </div>
                                </div>

                                <div class="row align-items-center pt-4 pb-3">
                                    <div class="col-md-3 ps-5">
                                        <label class="form-label" for="form3Example4">Blog Title <label style="color: red">(*)</label></label>                  
                                    </div>
                                    <div class="col-md-9 pe-5">
                                        <input type="text" name="blogtitle" id="form3Example4" class="form-control form-control-lg" value="${b.getTitle()}" required>
                                    </div>
                                </div>
                                <div class="row align-items-center pt-4 pb-3">
                                    <div class="col-md-3 ps-5">
                                        <label class="form-label" for="form3Example4">Blog Summary <label style="color: red">(*)</label></label>                  
                                    </div>
                                    <div class="col-md-9 pe-5">
                                        <input type="text" name="Summary" id="form3Example4" class="form-control form-control-lg" value="${b.getSummarise()}" required>
                                    </div>
                                </div>
                                <div class="row align-items-center py-3">
                                    <div class="col-md-3 ps-5">
                                        <label class="form-label" for="form3Example4"> Current Cover Image:</label><br>                                
                                    </div>        
                                    <div class="col-md-9 pe-5">
                                        <img src="images/${b.getImageURL()}" alt="img/img-01.jpg" class="img-fluid" style="  max-width: 100%;
                                             height: auto;">     
                                        <p style="color: red">${ERR}</p>
                                    </div>
                                </div>   
                                <div class="row align-items-center py-3">
                                    <div class="col-md-3 ps-5">
                                        <label class="form-label" for="form3Example4">Cover Image</label><br>                                
                                    </div>

                                    <div class="col-md-9 pe-5">
                                        <input type="file" name="coverimage"  >

                                       <p style="color: red">${requestScope.ERR}</p>
                                    </div>
                                </div>   

                                <div class="row align-items-center pt-4 pb-3">
                                    <div class="col-md-3 ps-5">
                                        <label class="form-label" for="form3Example4">Content<label style="color: red">(*)</label></label>                                
                                    </div>
                                    <div class="col-md-9 pe-5">
                                        <textarea id="tiny" name="content"  required>&lt;p&gt;${b.getContent()}&lt;/p&gt;</textarea>
                                    </div>
                                </div> 
                                <div class="row align-items-center py-3" style="display: flex;justify-content: end"> 
                                    <div class="col-md-3 ps-5">
                                        <button type="submit"  value="0"class="btn btn-primary btn-lg" onclick="confirm('Are you sure to update this blog')"style=" color: white; background: red">Post</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <script>
            $('textarea#tiny').tinymce({
                height: 500,
                menubar: false,
                plugins: [
                    'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
                    'anchor', 'searchreplace', 'visualblocks', 'fullscreen',
                    'insertdatetime', 'media', 'table', 'code', 'help', 'wordcount'
                ],
                toolbar: 'undo redo | blocks | bold italic backcolor | ' +
                        'alignleft aligncenter alignright alignjustify | ' +
                        'bullist numlist outdent indent | removeformat | help'
            });
        </script>
    </body>
</html>
