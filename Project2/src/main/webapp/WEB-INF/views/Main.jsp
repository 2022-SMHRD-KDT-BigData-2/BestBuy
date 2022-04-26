<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Page-Enter" content="blendTrans(Duration=1)" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=1)" />
    <title>Document</title>
    <link rel="stylesheet" href="${cpath}/resources/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

<title>Insert title here</title>
</head>
<body>
<form action="${cpath}/main.do" id="main">
        <div class="img">
            <!-- 상단 메뉴바 -->
            <div class="top">
                <h1>FARM & FARM</h1>
                    <div class="menu">
                        <ul id="nav">
                            <li><a href="#">마켓</a></li>
                            <li><a href="#">기업정보</a>
                                <ul>
                                    <li><a href="#">기업리스트</a></li>
                                    <li><a href="#">기업등록</a></li>
                                </ul>
                            </li>
                        
                            <li><a href ="${pageContext.request.contextPath}/login">로그인</a></li>
                            <li><a href ="${pageContext.request.contextPath}/join">회원가입</a></li>
                        </ul>
                    </div>
            </div>
            <!-- 검색 부분 -->
            <div class="content">
                <h3>Product Search</h3>
                <form action="#">
                    <div class="input-group">
                        <input type="text" class="search" placeholder="검색어 입력">
                        <button class="img-button" type="submit" name="search" value="">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>
            <div class="footer">
                <p>주)구매하겠조 남구 송암로 60, 2층</p>
            </div>
        </div>
<div class="caption">
		 
	</div>
</form>
</body>
</html>