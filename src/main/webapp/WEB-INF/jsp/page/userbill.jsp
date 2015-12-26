<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
    function selectAll() {
        var checkBox = $("#checkAll")[0];
        var aa = document.querySelectorAll("input[type=checkbox]");
        if (checkBox.checked == true)
        {

            for (var i = 0; i < aa.length; i++) {
                aa[i].checked = true;
            }
        }
        else
        {
            for (var i = 0; i < aa.length; i++) {
                aa[i].checked = false;
            }
        }
    }
</script>

<script>
    function postUpdateState(id) {

        var domain = $('#domain').text();
        var checkBox = document.querySelectorAll("input[type=checkbox]:not([id='checkAll'])");
        var id_bills = [];
        for (var i = 0; i < checkBox.length; i++) {
            var checkedItem = checkBox[i];
            if (checkedItem.checked == true) {
                id_bills.push(checkedItem.value);
            }
        }
        var test = JSON.stringify({
            id_bills: id_bills,
            id_state: id,
        });
        $.ajax({
            url: domain + "/userbill/updateBills.do",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: test,
            success: function () {
                //   alert('success');
                var item = $('#bill_state_' + id).attr('value');

                for (var i = 0; i < id_bills.length; i++) {
                    $('#bill_' + id_bills[i]).text(item);
                }

                // $('#result').append('Server Response: ' + json.server_response);
            },
            error: function (err) {


                console.log(err);
            }
        });
    }

</script>
<div class="hidden" id="domain">${pageContext.request.contextPath}</div>
<div class="btn-toolbar list-toolbar">

    <form method='POST' action="${pageContext.request.contextPath}/user/postLogin.do">
        <div class="input-group input-group-lg">
            <span class="input-group-addon glyphicon glyphicon-zoom-in" aria-hidden="true" id="sizing-addon1"></span>
            <input type="text" class="form-control" placeholder="Mã đơn hàng, tên đăng nhập, email, tên khách hàng" aria-describedby="sizing-addon1">
        </div>

        <button type="submit" class="btn btn-primary pull-right" value="">Tìm kiếm</button>
        <div class="clearfix"></div>
    </form>
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
            <th>Tình trạng</th>
            <th>Người đặt</th>

            <th style="width: 3.5em;"></th>
            <th>Chọn <input id="checkAll" type="checkbox" onchange="selectAll()"></th>
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
                <td id="bill_${bill.id}">${bill.state.value}</td>
                <td>${bill.account.fullname}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/userbill/getDetail.do/${bill.id}"><i class="fa fa-pencil"></i></a>
                    <a href="#myModal" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>
                </td>
                <td>
                    <div class="checkbox no-margin-top">

                        <input value="${bill.id}" type="checkbox">

                    </div>
                </td>
            </tr>
        </c:forEach>

    </tbody>
</table>
<div class="container">
    <div class="row">
        <div class="col-md-10">

        </div>
        <div class="col-md-2">
            <div class="dropdown">
                <button class="btn btn-danger dropdown-toggle btn_full_width" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    Cập nhật
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <c:forEach var="bill" items="${billState}" varStatus="loop">
                        <li  ><a href="#"><li id="bill_state_${bill.id}" value="${bill.value}" onclick="postUpdateState(${bill.id})">${bill.value}</li></a></li>
                                </c:forEach>

                </ul>
            </div>
        </div>

    </div>
</div>

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

