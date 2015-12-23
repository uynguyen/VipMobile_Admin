<%-- 
    Document   : header
    Created on : May 13, 2015, 8:25:13 PM
    Author     : UyNguyen.ITUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="header">
    <div class="container">
        <div class="header-left">
            <div class="top-menu">
                <ul>
                    <c:if test="${menu != null}">
                        <c:choose>
                            <c:when test="${menu == 'product'}">
                                <li ><a href="IndexController.do">TRANG CHỦ</a></li>
                                <li class='active'><a href="/Spring/uynguyen/Product.do?page=1">DANH SÁCH SẢN PHẨM</a></li>	
                                <li><a href="AboutController.do">VỀ CHÚNG TÔI</a></li>
                                </c:when>
                                <c:when test="${menu == 'about'}">
                                <li ><a href="IndexController.do">TRANG CHỦ</a></li>
                                <li><a href="/Spring/uynguyen/Product.do?page=1">DANH SÁCH SẢN PHÂM</a></li>	
                                <li class='active'><a href="AboutController.do">VỀ CHÚNG TÔI</a></li>	
                                </c:when>

                        </c:choose>
                    </c:if>
                    <c:if test="${menu == null}">
                        <li  class='active'><a href="IndexController.do">TRANG CHỦ</a></li>
                        <li><a href="/Spring/uynguyen/Product.do?page=1">DANH SÁCH SẢN PHÂM</a></li>	
                        <li><a href="AboutController.do">VỀ CHÚNG TÔI</a></li>
                        </c:if>

                </ul>

                <!-- script-for-menu -->
                <script>
                    $("span.menu").click(function () {
                        $(".top-menu ul").slideToggle("slow", function () {
                        });
                    });
                </script>
                <!-- script-for-menu -->	 	 

            </div>
        </div>
        <div class="logo">
            <img src="${applicationScope.logoURL}" alt="Logo"/>
        </div>
        <div class="header-right">

            <c:choose>
                <c:when test="${sessionScope.customer == null}">
                    <div class='signin'> 
                        <ul> 
                            <li><a href='/Spring/uynguyen/cart/viewCart.do'><img href='#' src='${applicationScope.cartURL}' alt=''/>GIỎ HÀNG</a> <span>/<span> &nbsp;</li> 
                                        <li><a href='/Spring/uynguyen/users/register.do'>ĐĂNG KÝ</a> <span>/<span> &nbsp;</li> 
                                                    <li><a href='/Spring/uynguyen/users/login.do'> ĐĂNG NHẬP</a></li> 
                                                    </div> 
                                                    </ul>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class='signin'> 
                                                        <div class='cart-sec'> 
                                                            <a href='/Spring/uynguyen/cart/viewCart.do'><img href='cart.html' src='images/cart.png' alt=''/>GIỎ HÀNG </a></div> 
                                                        <ul> 
                                                            <li><a  href="/Spring/uynguyen/users/logout.do"><input type='button' value='ĐĂNG XUẤT' class ='logOut'/></a></li> 
                                                            <li><a href='/Spring/uynguyen/users/accinfor.do'>TÀI KHOẢN</a> </li> 
                                                            <!--<li><a href='HistoryController.do'>LỊCH SỬ MUA HÀNG</a> </li>--> 
                                                            <li><a href='/Spring/uynguyen/bills/getAll.do'>HÓA ĐƠN MUA HÀNG</a> </li> 

                                                        </ul>
                                                    </div> 
                                                </c:otherwise>
                                            </c:choose>
                                            </div> 
                                            </div> 
                                            </div> 

