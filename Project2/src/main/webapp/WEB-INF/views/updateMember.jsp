<%@page import="kr.pro.entity.Member"%>
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
<form action="${cpath}/updateMember.do" id="updateMember" method="post">
 <h1>구매잘했조</h1>
 <label>${mvo.u_nick}님 방문을 환영합니다</label>
	<div class="int-area">
		사업자번호등록 >> <input type="text" name="u_num" id="u_num" autocomplete="off"> 
		<input type="hidden" name="u_id" value="${mvo.u_id}"/>
	</div>
	
	<div class="btn-area">
		<button type="submit" >제출</button>
	</div>
</form>
</body>
</body>
</html>