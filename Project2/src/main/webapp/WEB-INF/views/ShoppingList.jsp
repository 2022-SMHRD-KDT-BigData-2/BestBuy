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
    <link rel="stylesheet" href="${cpath}/resources/css/product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script type="text/javascript">
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
</head>
<body onload="init();">
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
		</div>
            <div class="cart-grid-container">
                <div class="grid-top">
                    <h2>장바구니</h2>
                </div>
                <div class="grid-left">
                    <table>
                        <tr>
                            <td><input type="checkbox" id="check"><label for="check"></label></td>
                            <td>전체선택</td>
                            <td>선택삭제</td>
                        </tr>
                        <tr>
                            <form action="#" name="form" method="get">
                            <td><input type="checkbox" id="check"><label for="check"></label></td>
                            <td><img src="./ListImage/1-1.png" id="i_idx" name="i_idx"></td>
                            <td><div class="i_name"><a href="product.html" name="i_name">영주 별사과 600g</a></div></td>
                            <td>
                                    <div class="init">
                                        <div class="my_sum">
                                            <input type=hidden name="sell_price" value="6930">
                                            <input type="text" class="count" name="amount" value="1" size="3" onchange="change();"> 
                                            <input type="button" class="pl-btn" value=" + " onclick="add();">
                                            <input type="button" class="mi-btn" value=" - " onclick="del();"><br>
                                            <input type="hidden" name="sum" size="11" readonly>
                                        </div>
                                    </div>
                                </form>
                            </td>
                            <td><div id="my_sum"></div></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" id="check"><label for="check"></label></td>
                            <td><img src="./ListImage/2-2.png" id="i_idx" name="i_idx"></td>
                            <td><div class="i_name"><a href="product.html" name="i_name">용암 참외 1.2kg</a></div></td>
                            <td>
                                <form action="#" name="form" method="get">
                                    <div class="init">
                                        <div class="my_sum">
                                            <input type=hidden name="sell_price" value="16900">
                                            <input type="text" class="count" name="amount" value="1" size="3" onchange="change();"> 
                                            <input type="button" class="pl-btn" value=" + " onclick="add();">
                                            <input type="button" class="mi-btn" value=" - " onclick="del();"><br>
                                            <input type="hidden" name="sum" size="11" readonly>
                                        </div>
                                    </div>
                                </form>
                            </td>
                            <td><div id="my_sum"></div></td>
                        </tr>
                    </table>

                </div>
                <div class="grid-right">
                    <div class="address">
                        <h4 class="add-top">배송지</h4>
                        <div class="add-content">
                            배송지를 입력하고<br>
                            배송유형을 확인하세요
                        </div>
                        <button class="add-button" type="submit" id="member_post" onclick="findAddr()"><a href="productBuy.html">주소검색</a></button>
                        <script>
                            function findAddr(){
                                new daum.Postcode({
                                    oncomplete: function(data) {
                                        
                                        console.log(data);
                                        
                                        var roadAddr = data.roadAddress; 
                                        var jibunAddr = data.jibunAddress;
                                        document.getElementById('member_post').value = data.zonecode;
                                        if(roadAddr !== ''){
                                            document.getElementById("member_addr").value = roadAddr;
                                        } 
                                        else if(jibunAddr !== ''){
                                            document.getElementById("member_addr").value = jibunAddr;
                                        }
                                    }
                                }).open();
                            }
                            </script>
                            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    </div>
                    <div class="cart-price">
                        <form action="#" name="form" method="get">
                            <div class="total-pri">
                                <div class="total">
                                    <table>
                                        <tr>
                                            <td>배송비</td>
                                            <td colspan="3">3000원</td>
                                        </tr>
                                        <tr>
                                            <td>총 상품금액</td>
                                            <td colspan="2"><div id="my_sum"></div></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="button-area">
                                <button class="button" type="submit"><a href="productBuy.html">구매하기</a></button>
                            </div>
                        </form>
                        <div class="total-bottom">
                            · [배송준비중] 이전까지 주문 취소 가능합니다.<br>
                            · [장바구니]에서 직접 취소 가능합니다.
                        </div>
                    </div>
                </div>
            </div>
            <div class="cart-footer">
                <p>
                    주)구매하겠조 남구 송암로 60, 2층<br>
                    사업자번호 : 000-00-00000<br>
                    
                </p>
            </div>

</body>

</html>