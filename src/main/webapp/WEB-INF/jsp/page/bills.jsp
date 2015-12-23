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
        <h3 style='text-align: center'>DANH SÁCH HÓA ĐƠN MUA HÀNG</h3>
        <div class='cart-info'> 

            <table class='table table-striped' border='1' width='100%'> 
                <tr align='center'> 
                    <td width='45' scope='row'><strong>STT</strong></td> 
                    <td width='147'><strong>Mã hóa đơn</strong></td> 
                    <td width='147'><strong>Ngày giao dịch</strong></td> 

                    <td width='70'><strong>Tổng cộng</strong></td> 
                    <td width='80'><strong>Trạng thái</strong></td> 
                    <td width='80'><strong>Xem chi tiết hóa đơn</strong></td> 

                </tr> 
                <c:forEach var="bill" items="${myBills}" varStatus="loop">
                    <tr>  
                        <td scope='row'>${loop.index}</td>  
                        <td>${bill.code}</td>  
                        <td>${bill.date}</td>  

                        <td><fmt:formatNumber type="number" value="${bill.total}" groupingUsed="true"/> VND</td>  

                        <c:if test="${bill.state == false}">
                            <td>  Chưa thanh toán </td>  
                        </c:if>
                        <c:if test="${bill.state == true}">
                            <td>  Đã thanh toán </td>  
                        </c:if>

                    <form method='get' action='/Spring/uynguyen/bills/detail.do'>
                        <td><button class="btn btn-danger" name='detail' value='${bill.code}' type='submit'>Chi tiết</button></td>
                    </form> 

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
