<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="${cpath}/resources/css/product.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<style>
.img2{
width:200px;
height: 200px;
}
#centerarea{
padding-left:850px;
padding-bottom: 100px;
}
</style>
<script type="text/javascript">

</script>
</head>	
<body>

	<div class="top_background">
		<!-- 상단 메뉴바 -->
		<div class="top">
			<h1 onclick="location.href='${pageContext.request.contextPath}/main.do'">FARM & FARM</h1>
			<div class="menu">
				<ul id="nav">
					<li><a href="${pageContext.request.contextPath}/Market">마켓</a></li>
					<c:if test="${empty mvo.u_num && !empty mvo}">
						<li><a href="${pageContext.request.contextPath}/ShoppingList/${mvo.u_id}">장바구니</a></li>
					</c:if>
					<li><a href="#">농산물가격예측</a>
							<ul>
								<li><a href="http://127.0.0.1:9000/">가격예측</a></li>
							</ul>
						</li>

					<c:if test="${!empty mvo}">
						<li><a href="#">마이페이지</a>
							<ul>
								<li><a href="#">회원정보 수정</a></li>
								<c:if test="${empty mvo.u_num}">
									<li><a onclick="Updateclick()">사업자 등록</a></li>
								</c:if>
								<c:if test="${!empty mvo.u_num}">
									<li><a href="${pageContext.request.contextPath}/product">물품등록</a></li>
									<li><a href="${pageContext.request.contextPath}/myproduct.do">내물품확인</a></li>
								</c:if>
							</ul></li>
					</c:if>
					<c:if test="${empty mvo}">
						<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
						<li><a onclick="Joinclick()">회원가입</a></li>
					</c:if>
					<c:if test="${!empty mvo}">
						<li><a href="${cpath}/logout.do" onclick="alert('로그아웃 하시겠습니까?')">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<!--마켓 페이지에서 이미지를 클릭하면 상품등록에서 작성했던 내용이 넘어오는 곳-->
		<div class="grid-container">
			<div class="item1" name="chooseFile-image" style= "height: 600px; width: 600px; padding-left:300px">
			
				<c:forEach var="vo" items="${ list }" varStatus="status">
					<img class="img2" src="${cpath}/resources/css/image/${vo.i_save}">
				</c:forEach>
			</div>

			<div class="item2" style="width:600px;">
					<div class="p-title">
						<h2 name="p_name">${list[0].p_name}</h2>
						<h2 name="p_price"><fmt:formatNumber value="${list[0].p_price}" pattern="#,###"/>원</h2>
					</div>
					<table class="pro-intro">
						<colgroup>
							<col width="30%" />
							<col width="auto" />
						</colgroup>
						<tbody>
							<tr>
								<td>종류</td>
								<td name="p_kind">${list[0].p_kind}</td>
							</tr>
							<tr>
								<td>중량/용량</td>
								<td name="p_weight">${list[0].p_weight}</td>
							</tr>
							<tr>
								<td>상품등급</td>
								<td name="p_grade">${list[0].p_grade}</td>
							</tr>
							<tr>
								<td>당도</td>
								<td name="p_sweet">${list[0].p_sweet}</td>
							</tr>
							<tr>
								<td>포장타입</td>
								<td name="p_pack">${list[0].p_pack}</td>
							</tr>
							<tr>
								<td>안내사항</td>
								<td>
									<p>${list[0].p_data}</p>
								</td>
							</tr>
						</tbody>
					</table>
			</div>
			<c:if test="${!empty mvo}">
			<form action="${cpath}/ShoppingListinsert.do" method="post" name="form">
				<div>
					<div>
					<input type="hidden" name="u_id" value="${mvo.u_id}" /> 
					<input type="hidden" name="p_num" value="${list[0].p_num}" />
					<input type="hidden" name="s_price" value="${list[0].p_price}" />
					수량 : <input type="text" name="s_amount">개
					</div>
				</div>
				<div class="button-area" id="centerarea">
					<button class="button" type="submit">
						<a onclick="alert('장바구니에 상품 담기를 완료했습니다.');">장바구니 담기</a>
					</button>
				<c:forEach var="vo" items="${ list }" varStatus="status" end="0">
               <button class="button" type="button"> 
                  <a href="${pageContext.request.contextPath}/productBuy/${mvo.u_id}">구매하기</a>
               </button>
               </c:forEach>
            </div>
         </form>
      </c:if>
      </div>
   </div>
   <div class="main" name="chooseFile-main">
      <p><span><a href="${cpath}/review.do?p_num=${list[0].p_num}" style = "text-decoration: none; color: #000000;">상품리뷰등록</a></span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   </span>
      <div class="review">
         <table class="r-table">
            <tr class="r-tr">
               <td name="r_writer">작성자</td>
               <td name="r_date">작성일</td>
               <td name="r_star">별점</td>
               <td name="r_review">상품평</td>
               <td name="r_grade">상품등급</td>
            </tr>
            <c:forEach var="rvo" items="${rlist}">
               <tr>
                  <td>${rvo.r_writer}</td>
                  <td>${rvo.r_date}</td>
                  <c:if test="${rvo.r_star==1}">                
                  <td>★☆☆☆☆</td>
                  </c:if>
                  <c:if test="${rvo.r_star==2}">                
                  <td>★★☆☆☆</td>
                  </c:if>
                  <c:if test="${rvo.r_star==3}">                
                  <td>★★★☆☆</td>
                  </c:if>
                  <c:if test="${rvo.r_star==4}">                
                  <td>★★★★☆</td>
                  </c:if>
                  <c:if test="${rvo.r_star==5}">                
                  <td>★★★★★</td>
                  </c:if>
                  <td>${rvo.r_review}</td>
                  <td>${rvo.r_grade}</td>
               </tr>
             </c:forEach>
         </table>
      </div>
      <p>상세정보</p>
      <img src="${cpath}/resources/css/ListImage/9.png" class="product-detail">
   </div>

   <div class="footer">
      <p>주)구매하겠조 남구 송암로 60, 2층</p>
   </div>
</body>