<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>

<body class="style-10">

  <!-- LOADER -->
  <div id="loader-wrapper">
    <div class="bubbles">
      <div class="title">loading</div>
      <span></span> <span id="bubble2"></span> <span id="bubble3"></span>
    </div>
  </div>

  <!-- HEADER -->
  <div class="header-wrapper style-10">
    <div class="clear"></div>
  </div>

  <div class="content-push container">

    <div class="breadcrumb-box">
      <a href="/">Home</a> <a href="#">Shop</a> <a href="#">T-shirts</a>
      <a href="#">Careers</a> <a href="#">T-shirt Stampata</a>
    </div>
    
  <form action="/order/" method="post" id="orderForm">
    <div class="information-blocks">
      <div class="row">
        <div class="col-sm-5 col-md-4 col-lg-5 information-entry">
          <div class="product-preview-box">
            <div class="swiper-container product-preview-swiper slider"
              data-autoplay="0" data-loop="1" data-speed="500"
              data-center="0" data-slides-per-view="1">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                  <div class="product-zoom-image">
                    <img src="${gpurchase.frontImg}" alt="" />
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="product-zoom-image">
                    <img src="${gpurchase.toggleImg}" alt="" />
                  </div>
                </div>
              </div>

              <!-- Add Pagination -->
              <div class="swiper-pagination"></div>

              <div class="pagination"></div>
              <div class="product-zoom-container">
                <div class="move-box">
                  <img class="default-image" src="${gpurchase.frontImg}" alt="" />
                </div>
                <div class="zoom-area"></div>
              </div>
            </div>
          </div>
        </div>

        <!-- 상품 정보 -->
          <div class="col-sm-7 col-md-4 information-entry">
            <div class="product-detail-box">
              <h1 class="product-title">${gpurchase.gname}</h1>
              <h3 class="product-subtitle">${gpurchase.cname}</h3>

              <div class="rating-box" id="avgGrade"></div>

              <div class="price detail-info-entry">
                <div class="current">￦<fmt:formatNumber value="${gpurchase.price}" groupingUsed="true"/></div>
              </div>
              <div class="size-selector detail-info-entry">
                <div class="detail-info-entry-title sizeDiv">Size</div>
                
                <!-- 상의/하의 구분해 데이터 출력  -->
                <c:forEach var="size" items="${size}">
                  <c:choose>
                    <c:when test="${size.TOPSNO != null}">
                      <div class="entry size" name="TOP" id="${size.TOPSNO}">${size.SIZES}</div>
                    </c:when>
                    <c:when test="${size.BOTTOMNO != null}">
                      <div class="entry size" name="BOTTOM" id="${size.BOTTOMNO}">${size.SIZES}</div>
                    </c:when>
                  </c:choose>
                </c:forEach>
              </div>
            
              <div class="orderListDiv col-sm-12">
                <div class="accordeon">
                  <div class="accordeon-title">주문항목</div>
                  <!-- 주문항목 appendDiv -->
                  <div class="accordeon-entry orderItem" style="display: block;">
                  </div>
                  <!-- /.주문항목 appendDiv -->
                </div>
              </div>
              
              <div class="enterContent-3"></div>
              <div class="purchaseNum">
              <c:if test="${gpurchase.status == 1}">
                <div class="col-xs-5 pNumDiv">(${gpurchase.pnum} / ${gpurchase.min}) 참여</div>
              </c:if>
                <div class="detail-info-entry col-xs-7 btnDiv">
                  <div class="clear"></div>
                </div>
              </div>
              <div class="col-sm-7 enterContent-3"></div>

              <div class="detail-info-entry buttonDiv">
                <div class="clear"></div>
              </div>


            </div>
          </div>
        <!-- /.상품 정보 -->

        <!-- js 사용을 위한 hidden Value -->
        <input type="hidden" id="gpurchaseNo" value="${gpurchase.gpurchaseNo}">
        <input type="hidden" id="goodsNo" value="${gpurchase.goodsNo}">
        <input type="hidden" id="memberNo" value="${no}">
        <input type="hidden" id="status" value="${gpurchase.status}">
        <input type="hidden" id="askCnt" value="${askCnt}">
        <!-- /.js 사용을 위한 hidden Value -->

        <div class="clear visible-xs visible-sm"></div>

        <!-- Side 추천 상품 정보 -->
        <div class="col-md-4 col-lg-3 information-entry product-sidebar">
          <div class="row">
            <div class="col-md-12">
              <div class="information-blocks">
                
                <!-- 체형별 사이즈 정보 제공 시작 -->
                 <div class="information-entry products-list">
                  <h3 class="block-title inline-product-column-title" style="line-height:150%;"> 체형별 사이즈 정보 </h3>
                  <div class="inline-product-entry">
                       	<div class="price">
                       		<div class="current" id="sizeAnnounce"></div>
						</div>
						<h3 class="compare product-subtitle" style="text-decoration:none;  line-height: 150%;"></h3>
                    <div class="clear"></div>
                  </div>
                </div>
                <!-- 체형별 사이즈 정보 제공 끝 -->
                
                <br><br>
                
              </div>
            </div>
          </div>
        </div>
        <!-- /.Side 추천 상품 정보 -->
      </div>
      
      <div class="enterContent-1"></div>
      
       <!-- 상품 Keyword(Tag) -->
      <div class="tags-selector detail-info-entry col-sm-6">
        <div class="detail-info-entry-title">Tags: </div>
       <c:forEach var="keyword" items="${keyword}">
          <a href="#">${keyword}</a>&nbsp;
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
        <a class="button style-14" href="#productInfo1">상세 정보</a> <a
          class="button style-40" href="#productInfo2">상품 리뷰</a> <a
          class="button style-40" href="#productInfo3">유의 사항</a>
      </div>

      <div class="inline-product-entry">${gpurchase.detail}<br>${orderCheck}</div>

      <div id="productInfo2"></div>
      
      <div class="enterContent-4"></div>
      <div>
        <a class="button style-40" href="#productInfo1">상세 정보</a> <a
          class="button style-14" href="#productInfo2">상품 리뷰</a> <a
          class="button style-40" href="#productInfo3">유의 사항</a>
      </div>

      <c:if test="${orderCheck > 0}">
          <div class="inline-product-entry">
            <form id="replyform" method="post"
              enctype="multipart/form-data">
              <div class="row">
                <div class=" col-md-8">
                  <label>리뷰 작성<span>*</span></label>
                  <textarea class="simple-field" style="resize: none;"
                    id="content" name="content"
                    placeholder="Your message content (required)"></textarea>
                </div>
                <div class="col-md-4">
                  <div style="margin-top: 10%">
                    <input type="file" id="attachFile" name="attachFile"
                      accept="image/*">
                  </div>

                  <div id="targetType" style="margin-top: 10%"></div>
                  <div id="targetType-hint" class="input hint"></div>

                  <div class="button style-10" style="margin-top: 10%">
                    리뷰 작성<input type="button" id="reviewBtn" value="">
                  </div>
                </div>
              </div>
            </form>
          </div>
          </c:if>

      <div id="reviewList"></div>

      <div class="page-selector">
          <a class="moreView"> <i class="fa fa-angle-down"></i>
          </a>
      </div>

      <div id="productInfo3"></div>
      <div class="enterContent-4"></div>
      <div>
        <a class="button style-40" href="#productInfo1">상세 정보</a> <a
          class="button style-40" href="#productInfo2">상품 리뷰</a> <a
          class="button style-14" href="#productInfo3">유의 사항</a>
      </div>
      <c:choose>
        <c:when test="${gpurchase.status == 1 }">
          <div class="inline-product-entry">
            <p>진행중인 공동구매입니다.</p>
            <p>공동구매 상품이므로 반품은 불가능합니다.</p>
            <p>구매는 한번에 한 상품씩 가능합니다.</p>
          </div>
        </c:when>
        <c:when test="${gpurchase.status == 2 }">
          <div class="inline-product-entry">
            <p>마감된 공동구매입니다.</p>
            <p>해당 상품 공동구매를 원하시면 재공구요청을 해주세요.</p>
          </div>
        </c:when>
      </c:choose>
    </div>
  </div>

  <div class="clear"></div>

  <br>
  <br>

  <script src="/resources/js/moment.js"></script>
  <script src="/resources/js/ko.js"></script>
  <script src="/resources/js/gpurchase/product.js"></script>
  <script src="/resources/js/jquery.raty.js"></script>
  <link href="/resources/css/gpurchase.css" rel="stylesheet" type="text/css"></link>

</body>
