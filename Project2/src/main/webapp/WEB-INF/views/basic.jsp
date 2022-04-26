<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <body>
 <form action="${cpath}/login.do" id="login">
	<div class="int-area">
		USER ID >> <input type="text" name="id" id="id" autocomplete="off" required>
		<label for="id"></label>
	</div>

	<div class="int-area">
		PASSWORD >> <input type="password" name="pw" id="pw" autocomplete="off"required> 
		<label for="pw"></label>
	</div>
	
	<div class="btn-area">
		<button type="submit" >LOGIN</button>
	</div>
</form>
	<div class="caption">
		<a href ="${pageContext.request.contextPath}/join.do">회원가입</a> 
		<a href ="${pageContext.request.contextPath}/pwsearch.do">비밀번호 찾기</a>
	</div>


</body>

</body>
</html>