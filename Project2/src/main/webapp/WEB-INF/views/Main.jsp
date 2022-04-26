<%@page import="kr.pro.entity.Member"%>
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

<script type="text/javascript">
	function Loginclick(){
		document.getElementById("login").style.display ='block';
	}
	function Joinclick(){
		document.getElementById("join").style.display ='block';
	}
	function Joinclick2(){
		document.getElementById("join").style.display ='none';
	}
</script>
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
                                    <c:if test="${empty mvo.u_num}">
                                    <li><a href ="${pageContext.request.contextPath}/updateMember">기업등록</a></li>
                                    </c:if>
                                    <c:if test="${!empty mvo.u_num}">
                                    <li><a href ="${pageContext.request.contextPath}/Myproduct">물품등록</a></li>
                                    </c:if>

                                </ul>
                            </li> 
                            <c:if test="${empty mvo}">                      
                            <li><a onclick="Loginclick()">로그인</a></li>
                            <li><a onclick="Joinclick()">회원가입</a></li>
                            </c:if>
                            <c:if test="${!empty mvo}">                      
                            <li><a href ="${cpath}/logout.do" >로그아웃</a></li>                           
                            </c:if>
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

	<!--로그인 페이지 부분-->
    <div class="login-cover" style="display: none" id="login">
        <form action="${cpath}/login.do" method="post">
            <div class="login">
                <div class="login_top">
                    <h1>FARM & FARM</h1>
                </div>
                <div class="login_id">
                    <h3>ID</h3>
                    <input type="text" id ="u_id" name="u_id" placeholder="아이디를 입력하세요.">
                </div>
                <div class="login_pw">
                    <h3>PW</h3>
                    <input type="password" id="u_pw" name="u_pw" placeholder="비밀번호를 입력하세요.">
                </div>
                <div class="login_etc">
                    <div class="join">
                        <a href ="${pageContext.request.contextPath}/join">회원가입</a>
                    </div>
                    <div class="forgot_pw">
                        <a href ="${pageContext.request.contextPath}/pwsearch.do">아이디 / 비밀번호 찾기</a>
                    </div>
                </div>
                <div class="submit">
                    <button type="submit" class="submit" name="login">로그인</button>
                </div>
            </div>
        </form>
        </div>
        
	<!--회원가입 페이지 부분-->
    <div class="login-cover" style="display: none" id="join">
    <form action="${cpath}/join.do" method="post">
    	<div class="container">
        	<div class="form_txtInput">
            	<div class="join_top">
                <h3>회원가입</h3>
                </div>
            <div class="join_form">
            	<table>
                <colgroup>
                	<col width="30%"/>
                	<col width="auto"/>
                </colgroup>
                <tbody>
                 	<tr>
                 		<th><span>아이디</span></th>
                 		<td><input type="text" id="u_id" name="u_id" placeholder="아이디를 입력하세요."></td>
                 	</tr>
                 	<tr>
                    	<th><span>비밀번호</span></th>
                    	<td><input type="text" name="u_pw" id="u_pw" placeholder="비밀번호를 입력해주세요."></td>
                    </tr>
                    <tr>
                    	<th><span>닉네임</span></th>
                    	<td><input type="text" name="u_nick" id="u_nick" placeholder="닉네임을 입력해주세요."></td>
                    </tr>
                    
                    <!-- 
                    <tr>
                    	<th><span>비밀번호 확인</span></th>
                    	<td><input type="text" name="pwcheck"placeholder="비밀번호를 확인하세요"></td>
                    </tr>
                     -->
                    	<tr class="email">
                    	<th><span>연락처</span></th>
                    	<td><input type="text" name="u_pnum" id="u_pnum" placeholder="연락처를 입력해주세요."></td>
                    </tr>
                    </tbody>
                    </table>
                    	<div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
                    	</div>
                    	<div class="btn_wrap"> 
                    	<button type="submit" class="submit" name="">회원가입</button>
                    	<button type="button" class="submit" onclick="Joinclick2()">돌아가기</button>
                    	</div>               
             	</div>               
            </div>
            </form>
        </div>
        
	<!--비밀번호 재확인 부분-->
    <div class="login-cover">
        <form action="#">
            <div class="login">
                <div class="login_top">
                    <h2>사업자등록</h2>
                </div>
                <div class="login_id">
                    <h3>비밀번호 확인</h3>
                    <input type="password" name="pwcheck" placeholder="비밀번호를 입력하세요.">
                </div>
                <div class="modify">
                    <button type="submit" class="modify" name="modify">정보수정</button>
                </div>
            </div>
        </form>
    </div>
</form>
</body>
</html>