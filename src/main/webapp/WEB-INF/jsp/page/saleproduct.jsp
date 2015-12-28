<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="btn-toolbar list-toolbar">
    <a  href="${pageContext.request.contextPath}/product/addSaleProduct.do">Thêm khuyến mãi</a>
    <!--    <button class="btn btn-default">Import</button>
        <button class="btn btn-default">Export</button>-->
    <div class="btn-group">
    </div>
</div>
<table class="table table-striped">
    <thead>
        <tr>


            <th>#</th>
            <th>Tên sản phẩm</th>
            <th>Mã sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng còn lại</th>
            <th>Ngày nhập kho</th>
            <th>Giảm giá (%)</th>
            <th>Thời hạn</th>
            <th style="width: 3.5em;"></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${saleProducts}" varStatus="loop">
            <tr>
                <td>${loop.index + 1}</td>
                <td>${product.idProduct.name}</td>
                <td>${product.idProduct.code}</td>
                <td><fmt:formatNumber type="number" value="${product.idProduct.price}" groupingUsed="true"/></td>
                <td>${product.idProduct.amount}</td>
                <td>${product.idProduct.importDate}</td>
                <td>${product.salePercent}</td>
                <td>${product.validDate}</td>
                <td><image class="image_of_sale_product" src="${serverDomain}${product.idProduct.image}"/></td>
                <td>
                    <a href="user.html"><i class="fa fa-pencil"></i></a>
                    <a href="#myModal" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<ul class="pagination">
    <li><a href="#">&laquo;</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>

<div class="modal small fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">Delete Confirmation</h3>
            </div>
            <div class="modal-body">
                <p class="error-text"><i class="fa fa-warning modal-icon"></i>Are you sure you want to delete the user?<br>This cannot be undone.</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <button class="btn btn-danger" data-dismiss="modal">Delete</button>
            </div>
        </div>
    </div>
</div>




