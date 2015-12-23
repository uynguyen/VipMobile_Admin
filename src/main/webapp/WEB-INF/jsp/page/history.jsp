<%-- 
    Document   : history
    Created on : May 15, 2015, 10:33:38 AM
    Author     : UyNguyen.ITUS
--%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class='cart'> 
    <div class='container'> 
        <h3 style='text-align: center'>CHI TIẾT HÓA ĐƠN MUA HÀNG</h3>
        <div class='cart-info'> 



            <table class='table table-striped' border='1' width='100%'> 
                <tr align='center'> 
                    <td width='45' scope='row'><strong>STT</strong></td> 
                    <td width='96'><strong>Mã hóa đơn</strong></td> 
                    <td width='147'><strong>Tên sản phẩm</strong></td> 
                    <td width='102'><strong>Hình ảnh</strong></td> 
                    <td width='89'><strong>Số lượng</strong></td> 
                    <td width='70'><strong>Thành tiền (VND)</strong></td> 
                    <td width='80'><strong>Ngày giao dịch</strong></td> 

                </tr> 
                <c:forEach var="history" items="${myHistory.lstHistorys}" varStatus="loop">
                    <tr>  
                        <td scope='row'>${loop.index}</td>  
                        <td>${history.code}</td>  
                        <td>${myHistory.lstProduct[loop.index].proName}</td>  
                        <td><img src='${myHistory.lstProduct[loop.index].proImage}' alt='' width='102' height='120' /></td> 
                        <td>${history.amount}</td>  
                        <td><fmt:formatNumber type="number" value="${history.totalPrice}" groupingUsed="true"/> VND</td>  
                        <td>  ${history.datetimeDeal} </td>  
                    </tr>  
                </c:forEach>
            </table>
        </div> 
        <div class='cart-list'> 
            <h3>Categories</h3> 
            <div class='col-md-4 carting'>			 
                <ul> 
                    <li><a href='#'>Always free from repetition</a></li> 
                    <li><a href='#'>Vestibulum rhoncus nibh quis dui fermentum iaculis.</a></li> 
                    <li><a href='#'>The standard chunk of Lorem Ipsum</a></li> 
                    <li><a href='#'>In consequat dolor in lorem egestas ultrices.</a></li> 
                    <li><a href='#'>Aliquam sollicitudin eros id luctus consequat.</a></li> 
                    <li><a href='#'>Always free from repetition</a></li> 
                </ul>	 
            </div> 
            <div class='col-md-4 carting'>			 
                <ul> 
                    <li><a href='#'>Always free from repetition</a></li> 
                    <li><a href='#'>Vestibulum rhoncus nibh quis dui fermentum iaculis.</a></li> 
                    <li><a href='#'>The standard chunk of Lorem Ipsum</a></li> 
                    <li><a href='#'>In consequat dolor in lorem egestas ultrices.</a></li> 
                    <li><a href='#'>Aliquam sollicitudin eros id luctus consequat.</a></li> 
                    <li><a href='#'>Always free from repetition</a></li> 
                </ul>	 
            </div> 
            <div class='col-md-4 carting'>			 
                <ul> 
                    <li><a href='#'>Always free from repetition</a></li> 
                    <li><a href='#'>Vestibulum rhoncus nibh quis dui fermentum iaculis.</a></li> 
                    <li><a href='#'>The standard chunk of Lorem Ipsum</a></li> 
                    <li><a href='#'>In consequat dolor in lorem egestas ultrices.</a></li> 
                    <li><a href='#'>Aliquam sollicitudin eros id luctus consequat.</a></li> 
                    <li><a href='#'>Always free from repetition</a></li> 
                </ul>	 
            </div> 
            <div class='clearfix'></div> 
        </div> 
    </div> 
</div>