<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="btn-toolbar list-toolbar">
    <button class="btn btn-primary"><i class="fa fa-plus"></i> New User</button>
    <button class="btn btn-default">Import</button>
    <button class="btn btn-default">Export</button>
    <div class="btn-group">
    </div>
</div>
<table class="table">
    <thead>
        <tr>
            <th>#</th>
            <th>Mã hóa đơn</th>
            <th>Ngày đặt hàng</th>
            <th>VAT</th>
            <th>Giảm giá</th>
            <th>Tổng cộng</th>
            <th>Người đặt</th>
            <th style="width: 3.5em;"></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="bill" items="${bills}" varStatus="loop">
            <tr>
                <td>${loop.index + 1}</td>
                <td>${bill.code}</td>
                <td>${bill.bookDate}</td>
                <td></td>
                <td></td>
                <td><fmt:formatNumber type="number" value="${bill.total}" groupingUsed="true"/></td>
                <td>${bill.account.fullname}</td>
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

