<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--SPRING WEB FORM-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dialog">
    <div class="panel panel-default">
        <p class="panel-heading no-collapse">Sign In</p>
        <div class="panel-body">
            <form:form method='POST' action="${pageContext.request.contextPath}/user/postLogin.do" modelAttribute="loginForm">
                <div class="form-group">
                    <label>Username</label>
                    <form:input type="text" class="form-control span12" value="${params.username}" path="username"/>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <form:input type="password" class="form-control span12 form-control" path="password" />
                </div>
                 <div class="form-group">
                    <label class="text-danger">${mess}</label>
                </div>
                <button type="submit" class="btn btn-primary pull-right" value="">Đăng nhập</button>
                <label class="remember-me"><input type="checkbox"> Remember me</label>
                
                <div class="clearfix"></div>
            </form:form>
        </div>
    </div>
    <p class="pull-right" style=""><a href="http://www.portnine.com" target="blank" style="font-size: .75em; margin-top: .25em;">Design by Portnine</a></p>
    <p><a href="reset-password.html">Forgot your password?</a></p>
</div>
