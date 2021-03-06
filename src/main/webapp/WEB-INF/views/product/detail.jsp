<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=utf-8"%>

<head>
<script>

//멤버 사이즈
var userSize = new Object;
//상품 사이즈
var productSize = new Object;
//베스트 사이즈
var bestSize = new Object;

</script>



<style>

.cart {
	margin-bottom : 10px;
}

.style-40:hover {
	background : #333;
	color : white;
}

.present {
	background : #333;
	color : white;
}

.present:hover {
	background : white;
	color : #333;
}

img {
	max-width: 100%;
	
}


</style>
</head>

<body class="style-10">


  <!-- HEADER -->
  <div class="header-wrapper style-10">
    <div class="clear"></div>
  </div>

  <div class="content-push container">

  <form action="/order/" method="post" id="orderForm">
    <div class="information-blocks">
      <div class="row">
        <div class="col-sm-5 col-md-4 col-lg-5 information-entry">
          <div class="product-preview-box">
            <div class="swiper-container product-preview-swiper"
              data-autoplay="0" data-speed="500"
              data-center="0" data-slides-per-view="1">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                  <div class="product-zoom-image">
                    <img src="/resources/upload/${product.frontImage}" alt="" />
                  </div>
                </div>
              </div>

              <!-- Add Pagination -->
              <div class="swiper-pagination"></div>

              <div class="pagination"></div>
              <div class="product-zoom-container">
                <div class="move-box">
                  <img class="default-image" src="/resources/upload/${product.frontImage}" alt="" />
                </div>
                <div class="zoom-area"></div>
              </div>
            </div>
          </div>
        </div>

        <!-- 상품 정보 -->
          <div class="col-sm-7 col-md-4 information-entry">
            <div class="product-detail-box">
              <h1 class="product-title">${product.name}</h1>
              <h3 class="product-subtitle">${product.subName}</h3>

              <div class="rating-box" id="avgGrade"></div>
			  <c:set var="total" value="${product.price}" />
				
              <div class="price detail-info-entry">
                <div class="current"><fmt:formatNumber value="${product.price}" type="currency" groupingUsed="true"/></div>
              </div>
              <c:choose>
				  <c:when test="${product.stock > 0}">	            
		            <div class="quantity-selector detail-info-entry">
		              <div class="detail-info-entry-title">주문수량 (재고 : ${product.stock})</div>
		              <div class="entry number-minus">&nbsp;</div>
		              <div class="entry number">1</div>
		              <div class="entry number-plus">&nbsp;</div>
		           	</div>
					<h3 class="product-plaintitle" id="total">총 금액 : <fmt:formatNumber value="${total}" groupingUsed="true"/> 원</h3>
	              	<div class="cart"><a class="button style-10" id="cart"> 장바구니에 담기 </a></div>
	              	<div><a class="button style-10" id="order"> 주문하기 </a></div>
	               </c:when>
	               
               	<c:otherwise>
               	<label>재고가 부족해 주문이 불가능합니다.</label>
               
               </c:otherwise>	
              </c:choose>
              <div class="enterContent-3"></div>

              <div class="detail-info-entry buttonDiv">
                <div class="clear"></div>
              </div>


            </div>
          </div>
        <!-- /.상품 정보 -->

        <!-- js 사용을 위한 hidden Value -->
        <input type="hidden" id="productNo" value="${product.productNo}">
        <input type="hidden" id="memberNo" value="${login}">
        <!-- /.js 사용을 위한 hidden Value -->

        <div class="clear visible-xs visible-sm"></div>

        <!-- Side 추천 상품 정보 -->
        <div class="col-md-4 col-lg-3 information-entry product-sidebar">
          <div class="row">
            <div class="col-md-12">
              <div class="information-blocks">
                
                <br><br>
                
              </div>
            </div>
          </div>
        </div>
        <!-- /.Side 추천 상품 정보 -->
      </div>
      
      <div class="enterContent-1"></div>
      
       <!-- 상품 Keyword(Tag) -->
      <div class="tags-selector detail-info-entry col-sm-6" style="margin-top: 20px; margin-bottom: 20px">
        <div class="detail-info-entry-title">Tags: </div>
       <c:forEach var="keyword" items="${keyword}">
          <a href="#">${keyword.name}</a>&nbsp;
          <c:if test="${not status.last}">/&nbsp; </c:if>
       </c:forEach>
      </div>
      <!-- /.상품 Keyword(Tag) -->
      
    </div>
    </form>
    
    <div class="clear"></div>

    <div id="productInfo1"></div>
    <div class="information-blocks">
    <div class="enterContent-4"></div>
      <div>
        <a class="button style-40 present" href="#productInfo1">상세 정보</a> 
        <a class="button style-40" href="#productInfo2">상품 리뷰</a> 
      </div>

      <div class="inline-product-entry">${product.content}</div>

      <div id="productInfo2"></div>
      
      <div class="enterContent-4"></div>
      <div>
        <a class="button style-40" href="#productInfo1">상세 정보</a> 
        <a class="button style-40 present" href="#productInfo2">상품 리뷰</a>
      </div>

      

      <div id="reviewList"></div>


    </div>
  </div>

  <div class="clear"></div>

  <br>
  <br>

  <script src="/resources/js/moment.js"></script>
  <script src="/resources/js/ko.js"></script>
  <script src="/resources/js/gpurchase/product.js"></script>
  <script src="/resources/js/jquery.raty.js"></script>

<script>

$(document).ready(function() {
	var stock = ${product.stock};
	
	$(document).on('click', '.entry', function() {
		if($(".number").html() > stock) {
			alert("재고가 부족합니다.");
			
			$(".number").html($(".number").html()-1);
			return false;
		}
		
		var number = $(".number").html() * ${total};
		
		$("#total").html("총 금액 : " + numberWithCommas(number) + " 원");
	})
	
	$("#cart").click(function() {
		
		var amount = $(".number").html();
		var productNo = $("#productNo").val();
		
		$.ajax({
			url : "/cart",
			dataType : "json",
			type : "POST",
			data : {
				productNo : productNo,
				amount : amount
			},
			success : function(data) {
				alert("물품이 장바구니에 성공적으로 담겼습니다.");
			},
			error : function(data) {
				console.log("System ERROR");
				console.log(data);
			}
		})
	})
	
	$("#order").click(function() {
		if(stock <= 0) {
			alert("재고가 부족해 물품 주문이 불가능합니다.");
			return false;
		}
		
		var productNo = $("#productNo").val();
		var amount = $(".number").html();
		
		var cookieObj = [];
		cookieObj.push({
			productNo : productNo,
			amount : amount
		});
		
		$.ajax({
			url : "/order/ordersCookie",
			type : "post",
			data : {
				ordersData : JSON.stringify(cookieObj)
			},
			success : function(data) {
				if(data == "SUCCESS") {
					alert("주문 창으로 이동합니다.");
					
					$(location).attr('href', "/orderForm");
				}
			},
			error : function(data) {
				return false;
			}
		})
	})
	
})

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>


</body>
