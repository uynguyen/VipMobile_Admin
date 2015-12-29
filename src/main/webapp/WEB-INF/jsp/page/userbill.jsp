<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--SPRING WEB FORM-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--FUNC-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
            url: domain + "/dashboard/userbill/updateBills.do",
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


<br />
<div class="container">
    <div class="row">
        <div class="col-md-offset-2 col-md-10">
            <form:form method='GET' action="${pageContext.request.contextPath}/userbill/searchBills.do" >
                <input type="text" class="hidden" name="page" value="1"/>
                <div class="container">
                    <div class="row">
                        <div class="col-md-5">


                            <input name='query_str' value="${param.query_str}" type="text" class="form-control" placeholder="Mã đơn hàng, tên đăng nhập, email, tên khách hàng" aria-describedby="sizing-addon1" />


                        </div>
                        <div class="col-md-3">
                            <div id="sandbox-container">    
                                <div class="input-group date">
                                    <input type="text" class="form-control" name='date_time' value="${param.date_time}" /><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                </div>
                            </div>

                            <script>
                                $('#sandbox-container .input-group.date').datepicker({
                                    todayHighlight: true,
                                    format: "dd-mm-yyyy"
                                });
                            </script>
                        </div>
                        <div class="col-md-2">
                            <div>
                                <button type="submit" class="btn btn-primary pull-right" value="">Tìm kiếm</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </form:form>
        </div>
    </div>

</div>
<br />
<table class="table table-hover">
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
        <c:forEach var="bill" items="${bills.result}" varStatus="loop">
            <tr>
                <td>${loop.index + 1}</td>
                <td>${bill.code}</td>

                <td>${bill.bookDate}</td>
                <td></td>
                <td></td>
                <td><fmt:formatNumber type="number" value="${bill.total}" groupingUsed="true"/></td>
                <td id="bill_${bill.id}">${bill.state.value}</td>
                <td>${bill.account.fullName}</td>
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

<c:if test="${fn:length(bills.result) > 0}">


    <ul class='pagination'>  

        <li>   
            <span>Trang ${param.page} / ${bills.total}</span>
        </li>   
        <li>   
            <span class="invisible"></span>
        </li>   
        <li>
            <c:choose>
                <c:when test='${param.page == 1}'>
                    <a href='${pageContext.request.contextPath}/dashboard/userbill/${endPoint}?page=1${ext}' aria-label='Previous'>   
                        <span aria-hidden='true'>&laquo;</span>   
                    </a>  
                </c:when>    
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/dashboard/userbill/${endPoint}?page=${param.page - 1}${ext}" aria-label="Previous">   
                        <span aria-hidden='true'>&laquo;</span>   
                    </a>  
                </c:otherwise>

            </c:choose>
        </li>
        <c:forEach var="index" items="${pageLine}">
            <c:if test="${index <= bills.total}">

                <c:choose>
                    <c:when test='${index == param.page}'>
                        <li class="active"><a href='${pageContext.request.contextPath}/dashboard/userbill/${endPoint}?page=${index}${ext}'> ${index} </a></li>   
                        </c:when>    
                        <c:otherwise>
                        <li><a href='${pageContext.request.contextPath}/dashboard/userbill/${endPoint}?page=${index}${ext}'> ${index} </a></li>   
                        </c:otherwise>

                </c:choose>

            </c:if>
        </c:forEach>
        <li>
            <c:choose>
                <c:when test='${param.page >= bills.total}'>
                    <a href='${pageContext.request.contextPath}/dashboard/userbill/${endPoint}?page=${bills.total}${ext}' aria-label='Next'>   
                        <span aria-hidden='true'>&raquo;</span>   
                    </a>  
                </c:when>    
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/dashboard/userbill/${endPoint}?page=${param.page + 1}${ext}" aria-label="Next">   
                        <span aria-hidden='true'>&raquo;</span>   
                    </a>  
                </c:otherwise>

            </c:choose>

        </li>

    </ul>   

</c:if>
<c:if test="${fn:length(bills.result) <= 0}">
    <div class='title'>   
        <h3>Không tìm thấy hóa đơn nào.</h3>   
    </div>  

</c:if>

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

