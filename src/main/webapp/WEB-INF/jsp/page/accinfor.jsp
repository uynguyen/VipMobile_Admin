<%-- 
    Document   : accinfor
    Created on : Sep 26, 2015, 10:35:56 PM
    Author     : LeeSan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 

<div class='registration-form'> 
    <div class='container'> 
        <h2>THÔNG TIN TÀI KHOẢN</h2> 
        <div class='col-md-8 reg-form'> 
            <div class='reg'> 

                <form method='post' action='AcccountController.do'> 
                    <ul> 
                        <li class='text-info'>Họ và tên </li> 
                        <li><input class='accText' type='text' name='fullName' value='${customer.cusName}'></li> 
                    </ul> 

                    <ul>  
                        <c:choose>
                            <c:when test="${customer.cusSex == true}">
                                <li class='text-info'>Giới tính: </li>  
                                <label for='male'>Nam</label>  
                                <input type='radio' name='sex' id='male' value='male' checked='checked'>  
                                <label for='female'>Nữ</label>  
                                <input type='radio' name='sex' id='female' value='female'>
                            </c:when>
                            <c:otherwise>
                                <li class='text-info'>Giới tính: </li>  
                                <label for='male'>Name</label>  
                                <input type='radio' name='sex' id='male' value='male'>  
                                <label for='female'>Nữ</label>  
                                <input type='radio' name='sex' id='female' value='female'  checked='checked'>
                            </c:otherwise>
                        </c:choose>

                    </ul>  

                    <input type="text" name='action' value="UPDATE" class="hidden">
                    <ul> 
                        <li class='text-info'>Address: </li> 
                        <li><input type='text' name='address' value='${customer.cusAddress}'></li> 
                    </ul> 

                    <ul> 
                        <li class='text-info'>Email: </li> 
                        <li><input type='text' name='eMail' value='${customer.cusEmail}'></li> 
                    </ul>				  
                    <ul> 
                        <li class='text-info'>Phone: </li> 
                        <li><input type='text' name='phone' value='${customer.cusPhone}'></li> 
                    </ul> 
                    <ul> 
                        <li class='text-info'>Birthday: </li> 
                        <li><input type='text' id='datepicker' name='birthday' value='${customer.cusBirthday}'></li> 
                    </ul> 

                    <input type='submit' name='action' value='Cập nhật thông tin'> 



                    <p class='click'></p> 
                    <c:if test="${resultUpdateInfor != null}">
                        <c:if test='${resultUpdateInfor != ""}'>
                            <p class='click'><${resultUpdateInfor}></p>  
                        </c:if>
                    </c:if>

                </form> 

                <form method='post' action='Account'> 

                    <input type='text' name="action" value='changePass' class="hidden">
                    <input type='submit' value='Thay đổi mật khẩu'> 
                </form>    


            </div> 
        </div> 

        <div class='clearfix'></div> 

    </div> 
</div> 
