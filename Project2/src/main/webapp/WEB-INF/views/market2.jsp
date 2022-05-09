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
 <link rel="stylesheet" href="${cpath}/product.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
 <script language="JavaScript">
        var sell_price;
        var amount;

        function init () {
            sell_price = document.form.sell_price.value;
            amount = document.form.amount.value;
            document.form.sum.value = sell_price;
            change();
        }

        function add () {
            hm = document.form.amount;
            hm.value ++ ;

            var sum_ = parseInt(hm.value) * sell_price;
        document.getElementById("my_sum").innerHTML=sum_;
        }

        function del () {
            hm = document.form.amount;
                if (hm.value > 1) {
                    hm.value -- ;
                    var sum_ = parseInt(hm.value) * sell_price;
        document.getElementById("my_sum").innerHTML=sum_;
                }
        }

        function change () {
            hm = document.form.amount;

                if (hm.value < 0) {
                    hm.value = 0;
                }
            var sum_ = parseInt(hm.value) * sell_price;
        document.getElementById("my_sum").innerHTML=sum_;
        } 
    </script>

<body>
	<div class="top_background">
		<!-- 상단 메뉴바 -->
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
		<!--마켓 페이지에서 이미지를 클릭하면 상품등록에서 작성했던 내용이 넘어오는 곳-->
        <div class="grid-container">
            <div class="item1" name="chooseFile-image">
            <c:forEach var="vo" items="${ list }" varStatus="status">
                <img img src="${cpath}/resources/css/image/${vo.i_save}">
             </c:forEach>
            </div>
            
            <div class="item2">               
				<c:forEach var="vo" items="${ list }" varStatus="status" end="0">
				<div class="p-title">
                <h2 name="p_name">${vo.p_name}</h2>
                <h2 name="p_price">${vo.p_price}</h2>
                </div>
                <table class="pro-intro" >
                    <colgroup>
                        <col width="30%"/>
                        <col width="auto"/>
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>종류</td>
                            <td name="p_kind">${vo.p_kind}</td>
                        </tr>
                        <tr>
                            <td>중량/용량</td>
                            <td name="p_weight">${vo.p_weight}</td>
                        </tr>
                        <tr>
                            <td>상품등급</td>
                            <td name="p_grade">${vo.p_grade}</td>
                        </tr>
                        <tr>
                            <td>당도</td>
                            <td name="p_sweet">${vo.p_sweet}</td>
                        </tr>
                        <tr>
                            <td>포장타입</td>
                            <td name="p_pack">${vo.p_pack}</td>
                        </tr>
                        <tr>
                            <td>안내사항</td>
                            <td>
                                <p>
                                ${vo.p_data}
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </c:forEach>
		</div>
	<form action="#" name="form" method="get">
                    <div class="init">
                        <div class="my_sum">
                            수량  <input type=hidden name="sell_price" value="6930">
                            <input type="text" class="count" name="amount" value="1" size="3" onchange="change();"> 
                            <input type="button" class="pl-btn" value=" + " onclick="add();">
                            <input type="button" class="mi-btn" value=" - " onclick="del();"><br>
                            <input type="hidden" name="sum" size="11" readonly>
                            총 상품금액<div id="my_sum"></div></div>
                    </div>
                    <div class="button-area">
                        <button class="button" type="submit"><a href="${pageContext.request.contextPath}/ShoppingListinsert.do" onclick="alert('장바구니에 상품 담기를 완료했습니다.');">장바구니 담기</a></button>
                        <button class="button" type="submit"><a href="productBuy.html">구매하기</a></button>
                    </div>
                </form>
            </div>
        </div>
            <div class="main" name="chooseFile-main">
                <p>상품리뷰</p>
                <div class="review">
                    <table class="r-table">
                        <tr class="r-tr">
                            <td name="r_writer">작성자</td>
                            <td name="r_date">작성일</td>
                            <td name="r_star">별점</td>
                            <td name="r_review">상품평</td>
                            <td name="r_grade">상품평균등급</td>
                        </tr>
                        <tr>
                            <td>서*현</td>
                            <td>2022-04-28</td>
                            <td>★★★★☆</td>
                            <td>맛있어서 항상 주문하고 있어용!</td>
                            <td>A등급</td>
                        </tr>
                        <tr>
                            <td>정*국</td>
                            <td>2022-05-03</td>
                            <td>★★★☆☆</td>
                            <td>배송이 조금 늦어서 원하는 날짜에 받아보지 못했어요ㅠㅠ</td>
                            <td>B등급</td>
                        </tr>
                        <tr>
                            <td>이*민</td>
                            <td>2022-05-04</td>
                            <td>★★★★★</td>
                            <td>선물해드렸는데 사진이랑 상태가 똑같았어요</td>
                            <td>A등급</td>
                        </tr>
                    </table>
                </div>
                <p>상세정보</p>
                <img src="${cpath}\ListImage\9.png" class="product-detail">
            </div> 
        </div>
        <div class="footer">
            <p>주)구매하겠조 남구 송암로 60, 2층</p>
        </div>
</body>


</html>