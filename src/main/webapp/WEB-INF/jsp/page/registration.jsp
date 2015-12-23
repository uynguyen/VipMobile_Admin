<%-- 
    Document   : registration
    Created on : May 14, 2015, 8:54:11 PM
    Author     : UyNguyen.ITUS
--%>
<!--JSTL-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--SPRING WEB FORM-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 

<div class='registration-form'> 
    <div class='container'> 

        <h2 style="text-align: center" >ĐĂNG KÝ TÀI KHOẢN</h2> 
        <p class='click'></p>  
        <c:if test="${resultRegistration != -1}">
            <p class='click'>${resultRegistration}</p>  
        </c:if>




        <div class='col-md-8 reg-form'> 
            <div class='reg'> 
                <p>Chào mừng bạn đến với TURBO MOBILE.</p>
                <p>Để thực hiện đăng ký tài khoản, vui lòng điền đủ thông tin phía dưới.</p> 

                <form:form  method="POST" action='/Spring/uynguyen/users/addAccount.do' modelAttribute="account"> 
                    <ul> 

                        <li><form:input value='${param.fullName}' placeholder="Họ và tên"  path="fullName" /></li> 
                        <li><form:input value='${param.address}' placeholder="Địa chỉ" path="address"/></li> 
                        <li>Giới tính</li>
                        <li>
                            Name <form:radiobutton value='true' path="gender"/>
                            Nữ <form:radiobutton value='false' path="gender"/>

                        </li>



                        <li><form:input value="${param.eMail}" placeholder="Địa chỉ email" path="email"/></li> 
                        <li><form:input value="${param.phone}" placeholder="Số điện thoại" path="phone"/></li> 
                        <li><form:input placeholder="Ngày tháng năm sinh" value="${param.birthday}" id='datepicker' name='birthday' path="birthday"/></li> 
                        <li><form:input value='${param.userName}' placeholder="Tên đăng nhập" path="username" /></li>
                        <li><form:password value='' placeholder="Mật khẩu" path="password"/></li> 
                        <li><form:password value='' placeholder="Nhập lại mật khẩu" path="password2"/></li> 




                        <input class="btn btn-primary" type='submit' value='Đăng ký'> 

                    </ul> 

                </form:form> 
            </div> 
        </div> 
        <div class='col-md-4 reg-right'> 
            <h3>SÀNH ĐIỆU</h3> 
            <p>Chúng tôi cam kết mang đến cho quý khách những chiếc điện thoại sành điệu, trẻ trung nhất trên thị trường</p> 
            <h3 class='lorem'>THỜI TRANG.</h3> 
            <p>Chúng tôi cam kết mang đến cho quý khách những chiếc điện thoại nóng bỏng nhất, phong cách nhất trên thị trường</p> 
            <h3 class='lorem'>TIỆN LỢI</h3> 
            <p>Chúng tôi cam kết mang đến cho quý khách sự hài lòng với đội ngũ chăm sóc khách hàng tận tâm, chu đáo</p> 
            <h3 class='lorem'>TIẾT KIỆM</h3> 
            <p>Chúng tôi cam kết mang đến cho quý khách những ưu đãi về giá cả hơn bất kỳ nơi nào khác trên thị trường</p> 

        </div> 
        <div class='clearfix'></div> 

    </div> 
</div> 

