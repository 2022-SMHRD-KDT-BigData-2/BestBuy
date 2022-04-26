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
				<h1>구매잘했조</h1>


			<form action="${cpath}/join.do" method="post" id="join">

				<div>
					<h3>
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id"> <input type="text" 
						maxlength="20" id="u_id" name="u_id" placeholder="아이디를 입력하세요"></span>
				</div>

				<div>
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input type="password" name="u_pw"
						id="u_pw" class="int" maxlength="20" placeholder="비밀번호를 입력하세요"></span>
				</div>
				
				<div>
					<h3 class="join_title">
						<label for="name">닉네임</label>
					</h3>
					<span class="box int_name"> <input type="text" name="u_nick"
						id="u_nick" class="int" maxlength="20" placeholder="닉네임을 입력하세요"></span>
				</div>


				<div>
					<h3 class="join_title">
						<label for="phoneNo">휴대전화</label>
					</h3>
					<span class="box int_mobile"> <input type="tel" name="u_pnum" id="u_pnum"
						class="int" maxlength="16" placeholder="전화번호를 입력하세요"></span>
				</div>

	<br>
				<div class="btn_area">
					<button onclick="location.href='javascript:history.back();'" type="button" id="btnJoin2">
						<span>돌아가기</span>
					</button>
					<button type="submit" id="btnJoin">
						<span>가입하기</span>
					</button>
				</div>
			</form>

</body>
</html>