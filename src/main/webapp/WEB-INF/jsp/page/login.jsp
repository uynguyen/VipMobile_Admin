
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--SPRING WEB FORM-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class='login'>  
    <div class='container'>  
        <h2>ĐĂNG NHẬP</h2>  
        <div class='col-md-6 log'>			   
            <c:if test="${require != null}">
                <p style="color: #fe3636">Bạn phải đăng nhập để tiếp tục</p>  
            </c:if>

            <c:if test="${ValidLoginResult != null}">
                <c:if test="${ValidLoginResult == 'false'}">
                    <p style="color: #fe3636"> Tên đăng nhập hoặc mật khẩu không hợp lệ </p>
                </c:if>
            </c:if>

            <form:form method='post' action='/Spring/uynguyen/users/postLogin.do' modelAttribute="loginForm">  
                <h5>Tên đăng nhập:</h5>	  
                <form:input type='text' name='username' value='${param.username}' path="username"/>  
                <h5>Mật khẩu:</h5>  
                <form:password name='password' value='' path="password" />

                <input type='submit' value="Đăng nhập">  
                <a href='ForgotPassword'>Bạn quên mật khẩu ?</a>  
            </form:form>				   
        </div>  
        <div class='col-md-6 login-right'>  
            <h3>TẠO MỚI TÀI KHOẢN</h3>  
            <p>Đăng ký tài khoản đề bạn có thể mua hàng và thanh toán trực tuyến với cửa hàng chúng tôi</p>  
            <a class='acount-btn' href='AccountController.do?act=regis'>ĐĂNG KÝ TÀI KHOẢN</a>  
        </div>  




        <div class='clearfix'></div>  

        <div class='navigation'>  
            <ul>  
                <li><a href='about.html'>ABOUT</a></li>  
                <li><a href='woman.html'>STOCKITS</a></li>  
                <li><a href='contact.html'>CONTACT</a></li>  
                <li><a href='man.html'>STORE</a></li>  
                <li><a href='terms.html'>TERMS & CONDITION</a></li>  
                <li><a href='man.html'>SHOW TO BUY</a></li>  
                <li><a href='404.html'>SHIPPING</a></li>  
                <li><a href='404.html'>RETURNS</a></li>  
                <li><a href='single.html'>SIZE CHART</a></li>  
            </ul>  
        </div>  
    </div>  
</div>  

