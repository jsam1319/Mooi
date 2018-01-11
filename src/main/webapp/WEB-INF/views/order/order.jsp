<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body class="style-10">

 <form id="orderForm" action="/order/orders" method="POST">
  <div class="content-push">
    <div class="breadcrumb-box">
      <a href="#">Home</a> <a href="#">Shop</a> <a href="#">Order</a>
    </div>

    <div class="information-blocks">

      <div class="row">
        <div class="col-sm-9 information-entry">
          <h3 class="cart-column-title size-1">Products</h3>
          
 
          <c:forEach items="${orderList}" var="order">
            <div class="traditional-cart-entry style-1">
              <a href="#" class="image"><img class="order-image"
                src="${order.frontImage}" alt=""></a>
              <div class="content">
                <div class="cell-view" name="dataset">
                  <a class="tag" href="#">tag</a> 
                  <a class="title" href="#">title</a>
                  <div class="inline-description">Order Qty : ${order.amount}</div>
                  <div class="price">
                    <div class="current">￦<fmt:formatNumber value="${order.PRICE * order.qty}" groupingUsed="true"/></div>
                    
                    <input type="hidden" name="qty" value="${order.count}">
                    <input type="hidden"  id="orderPrice" value="${order.price}">
                    
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>

        <div class="col-sm-3 information-entry totalOrder">
          <h3 class="cart-column-title size-1"
            style="text-align: center;">Subtotal</h3>
          <div class="sidebar-subtotal">
            <div class="price-data">
              <div class="main totalPrice"></div>
              <div class="title">총 주문수량 : <label class="qty"></label> </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="clear"></div>
  <div class="enterContent-4"></div>

    <div class="orderinfomation-blocks">
      <div class="accordeon">
        <div class="accordeon-title active">
          <h3 class="block-title order-main-heading">주문자 정보</h3>
        </div>
        <div style="display: block;" class="accordeon-entry">
          <div class="article-container style-1">
            <div class="row">
              <div class="col-sm-4 form-group">
                <label class="Pname">성명<span>*</span></label> <input
                  class="simple-field" type="text" id="orderName"
                  required value="${member.name}" readonly="readonly" />
              </div>
              <div class="col-sm-4 form-group">
                <label>전화번호<span>*</span></label> <input
                  class="simple-field" type="text" id="orderPhone"
                  required value="${member.phone}" readonly="readonly" />
              </div>
              <div class="col-sm-1"></div>
            </div>
            <div class="row">
              <div class="col-sm-3 form-group">
                <label>주소 <span>*</span></label> <input
                  class="simple-field" type="text" id="orderPost"
                  value="${member.postcode}" readonly="readonly" />
              </div>
              <div class="clear"></div>
              <div class="col-sm-6 form-group">
                <input class="simple-field" type="text"
                  id="orderAddress" required value="${member.address}"
                  readonly="readonly" />
              </div>
              <div class="col-sm-3"></div>
              <div class="col-sm-3">
                <label class="checkbox-entry"> <input
                  type="checkbox" id="orderInfoCk" name="orderInfoCk" />
                  <span class="check"></span> 배송정보와 주문정보가 같습니다
                </label>
              </div>
            </div>
          </div>
        </div>

        <div class="enterContent-1"></div>

        <div class="accordeon-title active">
          <h3 class="block-title order-main-heading">배송지 정보</h3>
        </div>
        <div class="accordeon-entry">
          <div class="article-container style-1">
            <div class="row">
              <div class="col-sm-4 form-group">
                <label>성명<span>*</span></label> <input
                  class="simple-field" type="text" id="receiverName"
                  required placeholder="성명" value="" name="receiver" />
              </div>
              <div class="col-sm-4 form-group">
                <label>전화번호<span>*</span></label> <input
                  class="simple-field" type="text" id="receiverPhone"
                  placeholder="ex) 010-1234-1234" required value=""
                  name="phone" />
              </div>
            </div>
            <div class="row">
              <div class="col-sm-3 form-group">
                <label>주소 <span>*</span></label> <input
                  class="simple-field" type="text" id="receiverPost"
                  value="" name="postcode" placeholder="우편번호" />
              </div>
              <div class="col-sm-4 form-group">
                <label><span></span></label> <input type="button"
                  value="우편번호 찾기" class="button style-10 daumPost">
              </div>
              <div class="clear"></div>
              <div class="col-sm-5 form-group">
                <input class="simple-field" type="text"
                  id="receiverAddress1" required value=""
                  placeholder="기본주소" />
              </div>
              <div class="col-sm-5 form-group">
                <input class="simple-field" type="text"
                  id="receiverAddress2" required value=""
                  placeholder="상세주소" />
              </div>
            </div>
            <div class="row">
              <div class="col-sm-10 form-group">
                <label>배송 메세지 <span>*</span></label>
                <textarea class="simple-field" required name="message"></textarea>
              </div>
            </div>
          </div>
        </div>

        <div class="clear"></div>

        <div class="enterContent-1"></div>

        <div class="accordeon-title">
          <h3 class="block-title order-main-heading">결제 정보</h3>
        </div>
        <div class="accordeon-entry">
          <div class="article-container style-1">
            <div class="row">
              <div class="col-sm-2 form-group">
                <label class="checkbox-entry radio"> <input
                  type="radio" name="method" value="card"> <span
                  class="check"></span> 신용카드
                </label>
              </div>
              <div class="col-sm-2 form-group">
                <label class="checkbox-entry radio"> <input
                  type="radio" name="method" value="phone"> <span
                  class="check"></span> 휴대폰결제
                </label>
              </div>
              <div class="col-sm-2 form-group">
                <label class="checkbox-entry radio"> <input
                  type="radio" name="method" value="bankbook"> <span
                  class="check"></span> 무통장입금
                </label>
              </div>
              <div class="col-sm-2 form-group">
                <label class="checkbox-entry radio"> <input
                  type="radio" name="method" value="creditTransfer">
                  <span class="check"></span> 계좌이체
                </label>
              </div>
              <div class="col-sm-2 form-group">
                <label class="checkbox-entry radio"> <input
                  type="radio" name="method" value="kakaoPay"> <span
                  class="check"></span> 카카오페이
                </label>
              </div>
            </div>
          </div>
        </div>

        <div class='col-sm-10 cardChoice'></div>
        <div class="cardInfo"></div>
        <input type="hidden" id="orderlist" value="${orderList}">

      </div>

      <div>
        <div class="col-sm-10"></div>
          <input type="submit" value="결제하기" class='button style-10'/>
      </div>

    </div>
  </form>
  <div class="enterContent-2"></div>

  <div class="clear"></div>

  <script src="/resources/js/order/order.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.0.3/js.cookie.js"></script>


</body>
