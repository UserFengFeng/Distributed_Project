<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="taglibs.jsp"%>
<head>
    <title>学生管理</title>

</head>
<h2><samp class="t03"></samp>学生管理</h2>
<ul class="ul">
    <li><a href="${path}/shop/item/list.jsp"><samp class="t05"></samp>入学管理</a></li>
    <li><a href="${path}/shop/item/listAudit.jsp?auditStatus=0&showStatus=1"><samp class="t05"></samp>考试管理</a></li>
</ul>

