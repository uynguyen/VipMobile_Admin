<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--<div class="btn-toolbar list-toolbar">
    <button class="btn btn-primary"><i class="fa fa-arrow-left"></i><a href="${pageContext.request.contextPath}/userbill/getAll.do" /> Trở về</button>

    <div class="btn-group">
    </div>-->

<!--</div>-->
<!--<div class="container">
    <div class="row">
                <div class="col-md-3">
                   
                </div>
        <div class="col-md-4">
            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Cập nhật
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li class="active"><a href="#">Đã thanh toán</a></li>
                    <li><a href="#">Chưa thanh toán</a></li>

                    <li role="separator" class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                </ul>
            </div>
        </div>

    </div>
</div>-->


<table class="table">
    <br/>

    <br/>
    <label class="btn btn-info btn_with_full_width">CHI TIẾT HÓA ĐƠN</label>
    <br/>
    <br/>
    <thead>
        <tr>
            <th>#</th>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th>Thành tiền</th>
            <!--<th style="width: 3.5em;"></th>-->
        </tr>
    </thead>
    <tbody>
        <c:forEach var="bill" items="${BillDetail}" varStatus="loop">
            <tr>
                <td>${loop.index + 1}</td>

                <td>${bill.code}</td>
                <td>${bill.name}</td>
                <td>${bill.amount}</td>
                <td>${bill.price}</td>
                <td><fmt:formatNumber type="number" value="${bill.price}" groupingUsed="true"/></td>

                <td><fmt:formatNumber type="number" value="${bill.total_price}" groupingUsed="true"/></td>

                <!--                <td>
                                    <a href="#"><i class="fa fa-pencil"></i></a>
                                    <a href="#myModal" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
                                </td>-->
            </tr>
        </c:forEach>

    </tbody>
</table>

<!--<ul class="pagination">
    <li><a href="#">&laquo;</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>-->

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

