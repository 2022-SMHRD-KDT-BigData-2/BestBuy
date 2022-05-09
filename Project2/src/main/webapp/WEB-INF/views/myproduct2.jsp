<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=1)" />
<meta http-equiv="Page-Exit" content="blendTrans(Duration=1)" />
<title>Document</title>
<link rel="stylesheet" href="${cpath}/resources/css/market.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
<script type="text/javascript">
   function goSend(p_num){
	   var weight=$("#weight"+p_num).val();
	   var formData=$("#frm"+p_num).serialize();
	   //alert(formData);
	    $.ajax({
           url: 'http://220.93.165.132:5000/sendFrame?weight='+weight, 
           //dataType: 'json', // what to expect back from server
           //cache: false,
           //contentType: false,
           //processData: false,
           data: formData,
           type: 'post',
           success: callback,
           error: function (response) {
              alert("error");
           }
        });	   
   }
   function callback(data){
	   alert(data);
   }
</script>	
</head>
<body>
	<div class="top_background">
		<!-- 상단 메뉴바 -->
			<div class="top">
				<h1>FARM & FARM</h1>
				<div class="menu">
					<ul id="nav">							
							<li><a href="${pageContext.request.contextPath}/Market">마켓</a></li>
							<c:if test="${empty mvo.u_num && !empty mvo}">
							<li><a href="${pageContext.request.contextPath}/ShoppingList">장바구니</a></li>
						</c:if>
						<li><a href="#">기업정보</a>
							<ul>
								<li><a href="#">기업리스트</a></li>
								<li><a href="#">기업등록</a></li>
							</ul></li>

						<c:if test="${!empty mvo}">
							<li><a href="#">마이페이지</a>
								<ul>
									<li><a href="memberInfo.html">회원정보 수정</a></li>
									<c:if test="${empty mvo.u_num}">
										<li><a onclick="Updateclick()">사업자 등록</a></li>
									</c:if>
									<c:if test="${!empty mvo.u_num}">
										<li><a href="${pageContext.request.contextPath}/product">물품등록</a></li>
										<li><a href="${pageContext.request.contextPath}/myproduct.do">내물품확인</a></li>
									</c:if>
								</ul>
							</li>
						</c:if>
						<c:if test="${empty mvo}">
							<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
							<li><a onclick="Joinclick()">회원가입</a></li>
						</c:if>
						<c:if test="${!empty mvo}">
							<li><a href="${cpath}/logout.do"
								onclick="alert('로그아웃 하시겠습니까?')">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		<div class="wrapper">
			<div class="top_intro">
				<div class="intro">FARM&FARM은</div>
				<div class="intro2">
					삶의 바탕이 되는 자연과 환경을<br>소중하게 생각합니다.
				</div>
				<div class="intro3">123</div>
			</div>
			<!-- 슬라이드 js 혹은 css 필요 -->
			<div class="container">
				<ul id="slider">
					<li class="item"><img src="${cpath}/resources/css/ListImage\1-1.png"></li>
					<li class="item"><img src="${cpath}/resources/css/ListImage\2-2.png"></li>
					<li class="item"><img src="${cpath}/resources/css/ListImage\3-3.png"></li>
				</ul>
			</div>
		</div>
	</div>
	<!--전체 아이템 리스트 -->
	<div class="item-cover">
		<div class="item_List">
			<ul class="row">
				<li>
					<div class="best_item">
						<h3>내상품리스트</h3>					
					</div>
				
				<input type="hidden"name="p_num" value="${vo.p_num}"/>
				</li>
				<c:forEach var="vo" items="${ list }" varStatus="status">								
    		<tr>
    			<td><img img src="${cpath}/resources/css/image/${vo.i_save}">    		
    			</td>
    		</tr>    		
    		</c:forEach>
    		<table>
    		<tr>
            <td>이름</td>
            <td>종류</td>
            <td>무게</td>
            <td>등급</td>
            <td>가격</td> 
            <td>정보</td>  
            <td>당도</td>
            <td>포장상태</td>
         </tr>
    		<c:forEach var="vo" items="${ list }" end="0" varStatus="status">

    		<tr>
    			<td>${vo.p_name}</td>	    	
    			<td>${vo.p_kind}</td>    		
    			<td>${vo.p_weight}</td>    	  	
    			<td>${vo.p_grade}</td>    		    	
    			<td>${vo.p_price}</td>    		   		
    			<td>${vo.p_data}</td>    		    		
    			<td>${vo.p_sweet}</td>    		    	
    			<td>${vo.p_pack}</td>
    		</tr>
    		<form id="frm${vo.p_num}">	
    		<input type="hidden" id="img1" name="img1" value="${vo.i_save}"/>
    		<input type="hidden" id="img2" name="img2" value="${vo.i_save}"/>
    		<input type="hidden" id="img3" name="img3" value="${vo.i_save}"/>
    		<input type="hidden" id="img4" name="img4" value="${vo.i_save}"/>
    		<tr>
    		    <td>무게:<input type="text" name="weight" id="weight${vo.p_num}"/></td>
    		    
    			<td colspan="8"><button type="button" onclick="goSend(${vo.p_num})">Flask로 전송</button></td>
    		</tr>	
            </form>
    		</c:forEach>
    		</table>		
    				<a href="<c:url value='/myproductUpdate.do/${vo.p_num}'/>" role="button">수정</a>
    				<a href="<c:url value='/myproductDelete.do/${vo.p_num}'/>"role="button">삭제</a>
    				<a href="<c:url value='/myproduct.do'/>" role="button">목록</a>
					
			</ul>			
		</div>
	</div>

	

</body>

</html>