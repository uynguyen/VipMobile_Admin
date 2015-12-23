<%-- 
    Document   : cart
    Created on : May 14, 2015, 2:09:26 PM
    Author     : UyNguyen.ITUS
--%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class='cart'> 
    <div class='container'> 

        <c:if test="${paySuccess != null}">
            <c:if test="${paySuccess == true}">
                <h3 style="text-align: center">Giao dịch thành công. Quý khách vui lòng kiểm tra email để xem chi tiết giao dịch</h1> 
                </c:if>
            </c:if>

            <div class='cart-info'> 

                <table class='table table-striped' border='1' width='100%'> 
                    <tr align='center'> 
                        <td width='45' scope='row'><strong>STT</strong></td> 
                        <td width='96'><strong>Mã sản phẩm</strong></td> 
                        <td width='147'><strong>Tên sản phẩm</strong></td> 
                        <td width='102'><strong>Hình ảnh</strong></td> 
                        <td width='89'><strong>Kích thước màn hình</strong></td> 
                        <td width='70'><strong>Màu</strong></td> 
                        <td width='80'><strong>Đơn giá</strong></td> 
                        <td width='72'><strong>Số lượng</strong></td> 
                        <td width='153'><strong>Thành tiền</strong></td> 
                        <td width='200'><strong>Cập nhật số lượng</strong></td> 
                        <td width='200'><strong>Xóa khỏi giỏ hàng</strong></td> 

                    </tr> 


                    <c:forEach var="product" items="${sessionScope.myCart.lstProduct}" varStatus="loop" >


                        <tr>  
                            <td scope='row'>${loop.index}</td>  
                            <td>${product.proCode}</td>  
                            <td>${product.proName}</td>  
                            <td><img src='${product.proImage}' alt='' width='102' height='120' /></td>  
                            <td>${product.proScreenSize}</td>  
                            <td>${product.colorName}</td>  
                            <td><fmt:formatNumber type="number" value="${product.proPrice}" groupingUsed="true" /></td>  
                            <td>${sessionScope.myCart.lstAmountProduct[product.proId]}</td>  
                            <td><fmt:formatNumber type="number" value="${sessionScope.myCart.lstProductMoney[product.proId]}" groupingUsed="true" /> </td>  
                        <form method='get' action='/Spring/uynguyen/cart/updateCart.do'>

                            <td>

                                <input type="text" name="amount" placeholder="Số lượng" />                                
                                <input class="hidden" type='text' name='id' value='${product.proId}' />
                                <button style="margin-top: 10px" class="btn btn-info" type='submit'>Cập nhật</button>

                            </td>
                        </form> 



                        <form method='get' action='/Spring/uynguyen/cart/deleteCart.do'>
                            <td><button class="btn btn-danger" name='id' value='${product.proId}' type='submit'>Xóa</button></td>
                        </form> 

                        </tr>  

                    </c:forEach>
                    <tr>
                        <td height='39' colspan='9' scope='row' >Tổng cộng</td>
                        <td colspan='3'> <b> <fmt:formatNumber type="number" value="${total}" groupingUsed="true" /> VND </b> </td>
                    </tr>
                </table>


                <a href='/Spring/uynguyen/Product.do?page=1'>TIẾP TỤC MUA SẢN PHẨM KHÁC</a> 

                <a href='/Spring/uynguyen/cart/payCart.do'>ĐẶT HÀNG</a> 


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
