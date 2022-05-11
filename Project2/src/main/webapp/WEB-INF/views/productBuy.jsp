<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Page-Enter" content="blendTrans(Duration=1)" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=1)" />
    <title>Document</title>
    <link rel="stylesheet" href="${cpath}/resources/css/product.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script> 
</head>
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
									<li><a href="#">회원정보 수정</a></li>
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
        <div class="sideBanner">
            <span class="txt-label">
                <img src="./ListImage/배너.png">
            </span>
        </div>
        <script>
                // 기본 위치(top)값
            var floatPosition = parseInt($(".sideBanner").css('top'))

            // scroll 인식
            $(window).scroll(function() {
            
                // 현재 스크롤 위치
                var currentTop = $(window).scrollTop();
                var bannerTop = currentTop + floatPosition + "px";

                //이동 애니메이션
                $(".sideBanner").stop().animate({
                "top" : bannerTop
                }, 500);

            }).scroll();
        </script>
            <form action="#" method="get">
                <div class="buy_top">
                    <h2>주문서</h2>
                </div>
                <div class="buy-main">
                    <ul class="buy-form">
                        <li>
                            <table>
                                <tr class="i_tr">
                                    <th>주문상품</th>
                                </tr>
                                <!-- 선택한 상품이 넘어오는 곳-->
                                <tr class="i_tr">
                                    <td class="i_image">
                                        <img src="./ListImage/1-1.png" name="i_idx" >
                                    </td>
                                    <td>
                                        <div class="i_name2"><a href="product.html" name="i_name">영주 별사과 600g</a></div>
                                    </td>
                                    <td name="p_option">
                                        <div class="p_option">1개</div>
                                    </td>
                                    <td name="p_price">
                                        <div class="p_price">6930원</div>
                                    </td>
                                </tr>
                            </table>
                        </li>
                        <li>
                            <table>
                                <tr class="i_tr">
                                    <th>주문자 정보</th>
                                </tr>
                                <tr>
                                    <!--로그인한 회원정보가 넘어오는곳-->
                                    <td>
                                        <table >
                                            <colgroup>
                                                <col width="30%"/>
                                                <col width="auto"/>
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <td class="i_name2"><span>보내는분</span></td>
                                                    <td class="i_td"><input type="text" name="u_name" placeholder="이름을 입력하세요."></td>
                                                </tr>
                                                <tr>
                                                    <td class="i_name2"><span>연락처</span></td>
                                                    <td class="i_td"><input type="text" name="u_pnum"placeholder="연락처를 입력해주세요."></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </li>
                        <li>
                            <table>
                                <tr class="i_tr">
                                    <th>배송정보</th>
                                </tr>
                                <tr>
                                    <td>
                                    <table >
                                        <colgroup>
                                            <col width="30%"/>
                                            <col width="auto"/>
                                        </colgroup>
                                        <tbody>
                                            
                                            <tr>
                                                <td class="i_name2"><span>배송지</span></td>
                                                <td class="i_td"><input type="text" name="u_add" placeholder="배송지를 입력하세요."></td>
                                            </tr>
                                            <tr>
                                                <td class="i_name2"><span>연락처</span></td>
                                                <td class="i_td"><input type="text" name="u_pnum"placeholder="연락처를 입력해주세요."></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </td>
                                </tr>
                            </table>
                        </li>
                        <li>
                            <table>
                                <tr class="i_tr">
                                    <th>결제수단</th>
                                </tr>
                                <tr>
                                    <table >
                                        <colgroup>
                                            <col width="30%"/>
                                            <col width="auto"/>
                                        </colgroup>
                                        <tbody>
                                            <!--결제 방식이 있다는 부분만 보여주기-->
                                            <tr>
                                                <td class="i_name2"><span>결제수단선택</span></td>
                                                <td class="i_td2"><img src="${cpath}/resources/css/ListImage/카카오페이.png"></td>
                                            </tr>
                                            <tr>
                                                <td><span>　</span></td>
                                                <td>
                                                    <div class="pay-button"><button type="button">신용카드</button></div>
                                                    <div class="pay-button"><button type="button">간편결제</button></div>
                                                    <div class="pay-button"><button type="button">휴대폰</button></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </tr>
                            </table>
                        </li>
                    </ul>
                </div>
                <form action="#" name="form" method="get">
                    <div class="button-area2">
                        <button class="buy-button" type="submit"><a href="productReview.html" onclick="alert('구매하기가 완료됐습니다.');">구매하기</a></button>
                    </div>
                </form>
            </form>
            <div class="cart-footer">
                <p>
                    주)구매하겠조 남구 송암로 60, 2층<br>
                    사업자번호 : 000-00-00000<br>
                </p>
            </div>
</body>
</html>