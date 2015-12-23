<%-- 
    Document   : about
    Created on : May 15, 2015, 7:56:48 PM
    Author     : UyNguyen.ITUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="tab-section">

    <span>
        <img  src="images/avatar.jpg" id="avatarimage" class="img-circle hidden-xs">
        <p class="bg-success infor"><h1>ỨNG DỤNG JAVA CHO HỆ THỐNG PHÂN TÁN</h1></p>
        <p class="bg-primary infor">Nguyễn Long Uy</p>
        <p class="bg-danger infor">University Of Science</p>
        <p class="bg-info infor">Information Technology</p>
        <p class="bg-warning infor">ID Student: 1212505</p>
        <p class="bg-danger infor">Date of birth: September 19th 1994</p>


    </span>
</div>
<!---->
<div class="tab-section">
    <div class="wrap">
        <div id="horizontalTab">
            <ul class="resp-tabs-list">
                <li><a href="#">FEATURED</a></li>
                <li class="active"><a href="#">JUST ARRIVED</a></li>
                <li><a href="#">SALE</a></li>
                <div class="clearfix"></div>				
            </ul>
            <div class="resp-tabs-container">
                <!---tab1----->
                <div>
                    <div class="course_demo1">
                        <ul id="flexiselDemo1">	
                            <li class="g1">						
                                <img src="images/c1.jpg" alt="" />		

                                <div class="clearfix"></div>
                            </li>
                            <li class="g1">						
                                <img src="images/c2.jpg" alt="" />

                                <div class="clearfix"></div>
                            </li>
                            <li class="g1">						
                                <img src="images/c3.jpg" alt="" />					

                                <div class="clearfix"></div>
                            </li>
                            <li class="g1">						
                                <img src="images/c4.jpg" alt="" />					

                                <div class="clearfix"></div>
                            </li>
                            <li class="g1">						
                                <img src="images/c1.jpg" alt="" />					

                                <div class="clearfix"></div>
                            </li>
                            <li class="g1">						
                                <img src="images/c3.jpg" alt="" />					

                                <div class="clearfix"></div>
                            </li>
                        </ul>
                    </div>
                    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
                    <script type="text/javascript">
                        $(window).load(function () {
                            $("#flexiselDemo1").flexisel({
                                visibleItems: 4,
                                animationSpeed: 1000,
                                autoPlay: true,
                                autoPlaySpeed: 3000,
                                pauseOnHover: true,
                                enableResponsiveBreakpoints: true,
                                responsiveBreakpoints: {
                                    portrait: {
                                        changePoint: 480,
                                        visibleItems: 1
                                    },
                                    landscape: {
                                        changePoint: 640,
                                        visibleItems: 2
                                    },
                                    tablet: {
                                        changePoint: 768,
                                        visibleItems: 3
                                    }
                                }
                            });

                        });
                    </script>
                    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                </div>
                <!---//tab1----->
              
                
            </div>
        </div>
    </div>
  
</div>
