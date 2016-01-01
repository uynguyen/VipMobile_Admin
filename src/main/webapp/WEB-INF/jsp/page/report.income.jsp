<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--SPRING WEB FORM-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--FUNC-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="hidden" id="domain">${pageContext.request.contextPath}</div>
<div class="hidden" id="link-html">${linkHtml}</div>
<br />
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h2 class="text-center">Báo cáo doanh thu</h2>
        </div>
    </div>

     <div class="row">
        <div class="col-md-6 col-md-offset-3">
           <ul class="nav nav-pills">
  <li role="presentation" class="time-menu ${page_type[0]}" id="menu-week">
      <a href="${pageContext.request.contextPath}/dashboard/report/income.do/week">Tuần</a></li>
  <li role="presentation" class="time-menu ${page_type[1]}" id="menu-month">
      <a href="${pageContext.request.contextPath}/dashboard/report/income.do/month">Tháng</a></li>
  <li role="presentation" class="time-menu ${page_type[2]}" id="menu-quarter">
      <a href="${pageContext.request.contextPath}/dashboard/report/income.do/quarter">Quý</a></li>
  <li role="presentation" class="time-menu ${page_type[3]}" id="menu-year">
      <a href="${pageContext.request.contextPath}/dashboard/report/income.do/year">Năm</a></li>
</ul>
        </div>
    </div>
    <script>
        var chooseType = function(){
            $('.menu').removeClass('active');
            $('.report-view').addClass('hide');
        }
    </script>
    <div class="row">
        <div class="col-md-12">
            <ul class="nav nav-tabs">
                <li role="presentation" id="htmlview" class="menu active">
                    <a href="#" onclick="chooseType(); 
                        if (!$('#htmlview').hasClass('active')){ 
                            $('#htmlview').addClass('active');
                            $('#html-view').removeClass('hide');
                        }">Html</a></li>
                <li role="presentation" id="pdfview"  class="menu">
                    <a href="#" onclick="chooseType(); 
                        if (!$('#pdfview').hasClass('active')){
                            $('#pdfview').addClass('active');
                            $('#pdf-view').removeClass('hide');
                        }">Pdf</a></li>
                <li role="presentation" id="excelview"  class="menu ">
                    <a href="#" onclick="chooseType(); 
                        if (!$('#excelview').hasClass('active')){
                            $('#excelview').addClass('active');
                            $('#xls-view').removeClass('hide');
                        }">Excel</a></li>
            </ul>
            <div class="report-view" id="html-view">
                <div id="html-view-body" ></div>
                <script>
                    $.ajax({
                        url: $('#link-html').text(),
                        type: "GET",
                        success: function (msg) {
                            console.log(msg);
                            $('#html-view-body').html(msg);
                        }
                    });
                </script>
            </div>
            <div class="report-view hide" id="pdf-view">
                <embed src="${linkPdf}" width="1024" height="700" alt="pdf" 
                       pluginspage="http://www.adobe.com/products/acrobat/readstep2.html">
            </div>
            <div class="report-view hide" id="xls-view">
                <h2 class="text-center"><a href="${linkXls}">Tải trực tiếp tại đây</a></h2>
                
            </div>
        </div>
    </div>
</div>
