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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
   var p;
   function goSend(p_num){
     p = p_num;
      var weight=$("#weight"+p_num).val();
      var formData=$("#frm"+p_num).serialize();
      //alert(formData);
       $.ajax({
           url: 'http://localhost:5000/sendFrame?weight='+weight, 
           //dataType: 'json', // what to expect back from server
           //cache: false,
           //contentType: false,
           //processData: false,
           data: formData,
           type: 'post',
           success: function(data){
              location.href="http://localhost:8081/controller/insertGo.do?p_num="+p+"&p_grade="+data;
           },
           error: function (response) {
              alert("error");
           }
        });      
   }   
</script>
<style>
.test123 {
    border:5px solid #ececec;
    font-size:20px;
    color:#4c4c4c; 
    height:100px; 
    padding:10px; 
    width:60%; 
    align:center;
    text-align:center;
    
}
.test1234{
border:0;
border-bottom:1; 
solid: #FF0000;
height: 35px;

}
.deltest{
font-size:20px;
color: #4c4c4c; 
padding:10px; 
}

</style>
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
                  <li><a href="${pageContext.request.contextPath}/ShoppingList">장바구니</a></li>
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
                           <li><a
                              href="${pageContext.request.contextPath}/myproduct.do">내물품확인</a></li>
                        </c:if>
                     </ul></li>
               </c:if>
               <c:if test="${empty mvo}">
                  <li><a onclick="Loginclick()">로그인</a></li>
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
            <div class="intro3"><img src="${cpath}/resources/css/ListImage/선요소.png"></div>
         </div>
         <!-- 슬라이드 js 혹은 css 필요 -->
         <div class="container">
            <ul id="slider">
               <li class="item"><img
                  src="${cpath}/resources/css/ListImage\1-1.png"></li>
               <li class="item"><img
                  src="${cpath}/resources/css/ListImage\2-2.png"></li>
               <li class="item"><img
                  src="${cpath}/resources/css/ListImage\3-3.png"></li>
            </ul>
         </div>
      </div>
   </div>
   <!--전체 아이템 리스트 -->
   <div class="item-cover">
      <div class="item_List" style="height: 900px;">
         <ul class="row">
          
            <li>
               <div class="best_item" >
                  <h2 style="padding-left:0%; color:#4c4c4c;">${list[0].p_name}</h2>
               </div> 
               <input type="hidden" name="p_num" value="${vo.p_num}" />
            </li>
        	<div>
            <br>
            <br>         
            </div>
            <c:forEach var="vo" items="${ list }" varStatus="status">
               <tr>
                  <td><img style="width:230px;" src="${cpath}/resources/css/image/${vo.i_save}">
                  </td>
               </tr>
            </c:forEach>
            <div>
            <br>
            <br>         
            </div>
            <div align="center">
            <table class="test123" width="auto">
            
						<colgroup>
						<!-- 	<col width="30%" /> -->
							<col width="100px" />
						</colgroup>
						<tbody >
							<tr style="height:50px;" >
								<td>종류</td>
								<td name="p_kind">${list[0].p_kind}</td>
							</tr>
							
							<tr style="height:50px;">
								<td>중량/용량</td>
								<td name="p_weight">${list[0].p_weight}</td>
							</tr>
					
							<tr style="height:50px;">
								<td>상품등급</td>
								<td name="p_grade">${list[0].p_grade}</td>
							</tr>
							<tr style="height:50px;">
								<td>당도</td>
								<td name="p_sweet">${list[0].p_sweet}</td>
							</tr>
							<tr style="height:50px;">
								<td>포장타입</td>
								<td name="p_pack">${list[0].p_pack}</td>
							</tr>
							<tr style="height:50px;">
								<td>안내사항</td>
								<td>
									${list[0].p_data}
								</td>
							</tr>
						</tbody>
				

            


               <form id="frm${list[0].p_num}">
                  <input type="hidden" id="p_num" name="p_num"value="${list[0].p_num}" />
                  <c:forEach var="vo" items="${ list }" varStatus="status">
                     <input type="hidden" id="img${status.index}"name="img${status.index}" value="${vo.i_save}" />
                  </c:forEach>
				<c:if test="${empty list[0].p_grade}">
                  <tr>
                     <td>무게:<input class="test1234" type="text" name="weight" id="weight${list[0].p_num}" /></td>

                     <td colspan="8"><a onclick="goSend(${list[0].p_num})" style="color:#436135; font-weight:bold;">[등급측정]</a></td>
                  </tr>
                  </c:if>
               </form>
               


            </table>
            </div>
            <div>
            <br>
            <br>         
            </div>
            <a class="deltest" href="<c:url value='/myproductDelete.do/${list[0].p_num}'/>" >삭제</a>
           
            <a class="deltest" href="javascript:history.back();">돌아가기</a>
		<div>
            <br>
            <br>         
         </div>
         </ul>
         		
      </div>
   </div>
            <br> 
            
<div class="footer">
<div>
            <br>
            <br>         
         </div>
		<p>주)구매하겠조 남구 송암로 60, 2층</p>
	</div>

</body>

</html>