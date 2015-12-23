<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class='men-fashions'>   
    <div class='container'>		   
        <div class='col-md-9 fashions'>   
            <div class='title'>   
                <h3>DANH SÁCH SẢN PHẨM</h3>   
            </div>   
            <div class='fashion-section'>   
                <div class='fashion-grid1'>   
                    <c:forEach var="p" items="${lstProduct}">

                        <div class='col-md-4 fashion-grid'>   
                            <a href='single.html'><img src='/Spring/${p.proImage}'/>   
                                <div class='product'>   
                                    <h3> ${p.proName} </h3>   
                                    <p><span></span> <fmt:formatNumber type="number" value="${p.proPrice}" groupingUsed="true" /> VND</p>								    
                                </div>							    
                            </a>   
                            <div class='fashion-view'><span></span>   
                                <div class='clearfix'></div>   
                                <h4><a href='SingleController.do?id=${p.proId}'>XEM CHI TIẾT</a></h4>   
                            </div>   
                        </div>   
                    </c:forEach>
                    <div class='clearfix'></div>   
                </div>   
                <nav>   

                    <c:if test="${fn:length(lstProduct) <= 0}">
                        <div class='title'>   
                            <h3>Không tìm thấy sản phẩm nào.</h3>   
                        </div>  

                    </c:if>

                </nav>   
            </div>   
            <div class='clearfix'></div>   
        </div>  
        <div class='col-md-3 side-bar'>   
            <div class='categories'>   
                <div class="sales"> 
                    <h3> Tìm theo hãng sản xuất</h3>   
                    <div class='dropdown' id='mydropdown'>   
                        <button class='btn btn-default dropdown-toggle' type='button' id='dropdownMenu1' data-toggle='dropdown' aria-expanded='true'>   
                            Hãng sản xuất  
                            <span class='caret'></span>   
                        </button>   
                        <ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'>   
                            <c:forEach var="s" items="${lstSups}">
                                <li role='presentation'><a role='menuitem' href='/Spring/uynguyen/searchBySup.do?id=${s.supId}&page=1'> ${s.supName} </a></li>
                                </c:forEach>
                        </ul>   
                    </div>   
                </div>  
                

                <div class="sales">   
                    <h3> Tìm theo màu sắc </h3>   
                    <div class='dropdown' id='mydropdown'>   
                        <button class='btn btn-default dropdown-toggle' type='button' id='dropdownMenu1' data-toggle='dropdown' aria-expanded='true'>   
                            Màu sắc   
                            <span class='caret'></span>   
                        </button>   
                        <ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'>   

                                <c:forEach var="color" items="${lstColors}">
                                <li role='presentation'><a role='menuitem' href='/Spring/uynguyen/searchByColor.do?id=${color.colorId}&page=1'> ${color.colorValue} </a> </li>
                                </c:forEach>

                        </ul>   
                    </div>   
                </div>   
            </div>   
            <div class='sales'>   
                <form method="get" action="/Spring/uynguyen/searchByPrice.do">
                    <div class='pricing'>   
                        <h3>Tìm theo giá</h3>   
                        <input type='text' name='fromPrice' placeholder='Giá từ' required/>   
                        <input type='text' name="toPrice" placeholder='đến' required/>   
                     
                        <input class="btn btn-info" type='submit' value="Tìm" required/>  
                        <div class='clearfix'></div>   
                    </div>   
                </form>
            </div>   
        </div>  
    </div> 
</div>