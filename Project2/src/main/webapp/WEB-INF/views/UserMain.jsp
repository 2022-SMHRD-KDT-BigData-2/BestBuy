<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${cpath}/UserMain.do" id="UserMain">
<h1>UserMain페이지입니다.</h1>
<label>${mvo.u_nick}님 방문을 환영합니다</label>
</form>
<div class="caption">
	<a href ="${pageContext.request.contextPath}/updateMember">사업자회원전환</a> 
</div>
</body>
</html>