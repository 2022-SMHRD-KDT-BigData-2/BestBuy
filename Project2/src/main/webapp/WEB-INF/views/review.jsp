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
    <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
  
   function goSend(){
      
      //var rList=$('input[type=radio]').is(":checked");
      //alert(rList);
      
     //alert('${mvo.u_id}'); 
     var formData=new FormData();
     var inputFile=$("input[name='i_class']");
     var files=inputFile[0].files;
     console.log(files[0]);   
     formData.append("upload", files[0]);
     
     $.ajax( { 
        url : "uploadreview.do",
        contentType: false,
          processData: false,
        data : formData,
        type : "POST",
        success : function(fileName){
           //var file = $("#real-upload").val().split("\\");
            //var fileName = file[file.length-1]; // 파일명
            //alert(fileName);
             $.ajax({
                 url: 'http://localhost:5005/sendFrame', 
                 //dataType: 'json', // what to expect back from server
                 //cache: false,
                 //contentType: false,
                 //processData: false,
                 data: { "img0" : fileName},
                 type: 'post',
                 success: function(data){
                     var r_review=$("#r_review").val();
                     var r_star = $('input[name=rating]:checked').val();
                     $.ajax({
                         url : "reviewinsert.do",
                            type : "post",
                            data : { "p_num":${p_num},"r_review" : r_review, "r_star":r_star,  "r_grade" : data, "r_writer": ${mvo.u_id} },
                            success : function(){ 
                               location.href="http://localhost:8081/controller/market2.do/"+${p_num};   
                            },
                            error : function(){ alert("error"); }
                     });
                    //location.href="http://localhost:8081/controller/review.do?p_num="+p+"&p_grade="+data;
                     //alert(data)
                  },
                  error: function (response) {
                     alert("error");
                  }
              });    
        },
        error : function(){ alert("error"); }
     });
     
     //var formData=new FormData(); 
       
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
                            <li><a href="market.html">마켓</a></li>
                            <li><a href="ShoppingCart.html">장바구니</a></li>
                            <li><a href="#">기업정보</a>
                                <ul>
                                    <li><a href="CompanyList.html">기업리스트</a></li>
                                    <li><a href="CompanyInfo.html">기업등록</a></li>
                                </ul>
                            </li>
                            <li><a href="#">마이페이지</a>
                                <ul>
                                    <li><a href="memberInfo.html">회원정보 수정</a></li>
                                    <li><a href="BusinessInfo.html">사업자 등록</a></li>
                                </ul>
                            </li>
                            <li><a href="main-login.html" onclick="alert('로그아웃 하시겠습니까?')">로그아웃</a></li>
                        </ul>
                    </div>
            </div>
        </div>
        <div class="rv-cover">
            <div class="rv-container">
                <div class="rv-form">
                    <div class="rv-top">
                        <h3>구매후기</h3>
                    </div>                 
                            <table class="rv-write">
                                <colgroup>
                                    <col width="30%"/>
                                    <col width="auto"/>
                                </colgroup>
                                <tbody>
                                    
                                    <tr>
                                        <td><span>상품별점</span></td>
                                        <td>
                                            <div class="star-rating">
                                                <input type="radio" id="5-stars" name="rating" value="5" />
                                                <label for="5-stars" class="star">&#9733;</label>
                                                <input type="radio" id="4-stars" name="rating" value="4" />
                                                <label for="4-stars" class="star">&#9733;</label>
                                                <input type="radio" id="3-stars" name="rating" value="3" />
                                                <label for="3-stars" class="star">&#9733;</label>
                                                <input type="radio" id="2-stars" name="rating" value="2" />
                                                <label for="2-stars" class="star">&#9733;</label>
                                                <input type="radio" id="1-star" name="rating" value="1" />
                                                <label for="1-star" class="star">&#9733;</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span>상품평</span></td>
                                        <td>
                                            <textarea rows="4" cols="50" name="r_review" id="r_review" placeholder="만족도 및 후기를 작성해주세요." required></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>　</td>
                                        <td>
                                            <ul class="rv-image-preview" >
                                                <li></li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span>사진등록</span></td>
                                        <td>
                                            <form enctype="multipart/form-data" id="frm">
                                                <label for="real-upload">
                                                </label>
                                            <div class="rv-file">
                                            <input type="file"  id="real-upload" name="i_class"/>
                                            </div>
                                            </form>
                                               <!-- 
                                                <script type="text/javascript">
                                                    
                                                    //input->div
                                                    const realUpload = document.querySelector('.real-upload');
                                                    const upload = document.querySelector('.upload');
                                                    upload.addEventListener('click', () => realUpload.click());
                                                    realUpload.addEventListener('change', getImageFiles);
                                                </script>  -->
                                            </td>
                                        </tr>
                              
                                    </tbody>
                                </table>
                            <div class="btn_wrap"> 
                                <button type="button" class="btn" onclick="goSend()">후기등록</button>
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