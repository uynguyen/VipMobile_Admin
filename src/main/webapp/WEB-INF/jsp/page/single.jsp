<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>
    // You can also use '$(window).load(function() {'  
    $(function () {
        // Slideshow 1  
        $('#slider2').responsiveSlides({
            auto: true,
            nav: true,
            speed: 500,
            namespace: 'callbacks',
        });
    });
</script>  
<script src='/Spring/js/responsiveslides.min.js'></script>  

<div class='single-section'>  
    <div class='col-md-8 fashions2'>			   
        <div class='slider2'>  
            <ul class='rslides rslider' id='slider2'>				    
                <li><img src='/Spring/${selectedProduct.proImage}' alt=''></li>  

            </ul>  
        </div>  
    </div>   
    <div class='col-md-4 side-bar2'>  
        <div class='product-price'>  
            <div class='product-name'>  
                <h2 style="color: #5bc0de">${selectedProduct.proName.toUpperCase()}</h2>  
                <span>Giá: <fmt:formatNumber type="number" value="${selectedProduct.proPrice}" groupingUsed="true"/> VND </span>  
                <span style="color: #fe3636">SALE OFF: <fmt:formatNumber type="number" value="${selectedProduct.proSale}" groupingUsed="true"/> % </span>  
                <div class='clearfix'></div>  
                <h4>CHI TIẾT</h4>  
            </div>	  
            <div class='product-id'>  

                <h4>Màu sắc: ${selectedProduct.colorName}</h4> 
                <h4>Nhà sản xuất: ${selectedProduct.supplierName}</h4>  
                <h4>Kích thước màn hình: ${selectedProduct.proScreenSize} inch</h4>  
                <h4>Số lượng còn lại:  ${selectedProduct.proAmount}</h4>  
                <h4>Mã sản phẩm: ${selectedProduct.proCode}</h4>  

                <form method='GET' action='/Spring/uynguyen/cart/addToCart.do'>  
                    <div style="margin-top: 30px">  

                        <input style="width: 60%; float: left" type='text' name='amount' value='1' class='form-control' placeholder='Số lượng' aria-describedby='sizing-addon1'>  


                        <button class='add btn btn-primary' name='id' value='${selectedProduct.proId}' type='submit'>Thêm vào giỏ hàng</button>  
                    </div>    
                </form>



            </div>  
        </div>  
    </div>  




    <div class='clearfix'></div>  
</div>

