<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<head>
 <%-- 주소 API --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
      function daumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                  var extraRoadAddr = ''; // 도로명 조합형 주소 변수
  
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraRoadAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraRoadAddr !== ''){
                      extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }
                  // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                  if(fullRoadAddr !== ''){
                      fullRoadAddr += extraRoadAddr;
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('address').value = fullRoadAddr;
                   document.getElementById('address').removeAttribute('disabled');
                   document.getElementById('postcode').removeAttribute('disabled');
                  document.getElementById('guide').placeholder = '(상세주소를 추가 입력해주세요. 예 : 101동 101호)'; 
                  
              }
          }).open();
      }
	</script>


</head>

<body class="style-10">

 <form id="orderForm" action="/order" method="POST">
  <div class="content-push">
    <div class="information-blocks">

      <div class="row">
        <div class="col-sm-9 information-entry" id="orderList">
          <h3 class="cart-column-title size-1">주문 상품</h3>
          
        </div>

        <div class="col-sm-3 information-entry totalOrder">
          <h3 class="cart-column-title size-1"
            style="text-align: center;">주문 총 금액</h3>
          <div class="sidebar-subtotal">
            <div class="price-data">
              <div class="main totalPrice"></div>
              <div class="title"><div class="price"><div class='current' id="total"></div></div> </div>
              <input type="hidden" value="" id="hiddenPrice" name="price">
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
                  class="simple-field" name="ordererName" type="text" id="orderName"
                  required value="${member.name}"/>
              </div>
              <div class="col-sm-4 form-group">
                <label>전화번호<span>*</span></label> <input
                  class="simple-field" name="ordererPhone" type="text" id="orderPhone"
                  required value="${member.phone}"/>
              </div>
              <div class="col-sm-1"></div>
            </div>
            <div class="row">
                <input class="simple-field" type="hidden" id="orderPost"
                  value="${member.postcode}" readonly="readonly" />
                <input class="simple-field" type="hidden"
                  id="orderAddress" required value="${member.address}"
                  readonly="readonly" />
	              <input class="simple-field" type="hidden"
	                  id="remainAddress" required value="${member.remainAddr}"
	                  readonly="readonly" />
                
            </div>
          </div>
        </div>

        <div class="enterContent-1"></div>

        <div class="accordeon-title active">
          <h3 class="block-title order-main-heading">배송지 정보</h3> 
          
        </div>
        <div class="accordeon-entry">
          <div class="article-container style-1">
            <div class="row" style="margin-bottom: 20px">
            	<div class="col-sm-12 form-group" style="float: right; text-align: right">
	            	<label class="checkbox-entry"> <input
	                  type="checkbox" id="orderInfoCk" name="orderInfoCk" />
	                  <span class="check"></span> 배송정보와 주문정보가 같습니다
	          		</label>
          		</div>
            </div>
            
            <div class="row">
              <div class="col-sm-4 form-group">
                <label>성명<span>*</span></label> <input
                  class="simple-field" type="text" id="receiverName"
                  required placeholder="성명" value="" name="name" />
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
                  class="simple-field" type="text"
                  value="" name="postcode" placeholder="우편번호" id="postcode" disabled/>
              </div>
              <div class="col-sm-4 form-group">
                <label><span></span></label> <input type="button"
                  value="우편번호 찾기" onclick="daumPostcode()" class="button style-10 daumPost">
              </div>
              <div class="clear"></div>
              <div class="col-sm-5 form-group">
                <input class="simple-field" type="text" name="address"
                  id="address" required value=""
                  placeholder="기본주소" disabled />
              </div>
              <div class="col-sm-5 form-group">
                <input class="simple-field" type="text" name="remainAddr"
                  id="guide" required value=""
                  placeholder="상세주소"/>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-10 form-group">
                <label>배송 메세지</label>
                <textarea class="simple-field" name="content"></textarea>
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
                  type="radio" name="method" value="bankbook" checked="checked" disabled> <span
                  class="check"></span> 무통장입금
                </label>
              </div>
            </div>
          </div>
        </div>

        <div class='col-sm-10 cardChoice'></div>
        <div class="cardInfo"></div>
        <input type="hidden" id="orderlist" value="${orderList}">

      </div>
	  <textarea id="ordersCookie" name="ordersCookie" hidden="true"></textarea>
      <div>
        <div class="col-sm-10"></div>
          <input type="submit" value="결제하기" id="order" class='button style-10'/>
      </div>

    </div>
  </form>
  <div class="enterContent-2"></div>

  <div class="clear"></div>

  <script src="/resources/js/order/order.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.0.3/js.cookie.js"></script>


<script>

$(document).ready(function() {
	var cookieData = ${cookie.orderCookie.value};
	var totalAmount = 0;
	
	$("#ordersCookie").val(JSON.stringify(cookieData));

	console.log($("#ordersCookie").val());
	
	for(var i in cookieData) {
		totalAmount = totalAmount + Number(cookieData[i].amount);
		appendEntry(cookieData[i]);
	}
	
	$("#amount").html(totalAmount);
	
	$("#orderInfoCk").click(function() {
		if($(this).is(':checked') == true) duplicateInfo();
	})
	
	
})

function appendEntry(data) {
	var amount = data.amount;
	var productNo = data.productNo;
	
	$.ajax({
		url : "/product/" + productNo,
		dataType : "json",
		success : function(product) {
			$("#orderList").append(getEntryStr(product, amount));
			
			var totalPrice = 0;
			var prices = $("input[name='unitPrice']");
			
			for(var i=0; i<prices.length; i++) {
				totalPrice = totalPrice + Number($(prices[i]).val());
			}
			
			$("#total").html(numberWithCommas(totalPrice) + " 원");
			$("#hiddenPrice").val(totalPrice);
		},
		error : function(data) {
			console.log(data);
		}
	})
}

function getEntryStr(product, amount) {
	var returnStr = "";
	
	returnStr += "<div class='traditional-cart-entry style-1'>\n" + 
				 "  <a href='#' class='image'><img class='order-image'\n src='/resources/upload/" + product.frontImage + "' alt=''></a>\n" + 
				 "  <div class='content'>\n" + 
				 "     <div class='cell-view' name='dataset'>\n" + 
				 "        <a class='tag' href='#'>" + product.subName + "</a>\n" + 
				 "        <a class='title' href='#'>" + product.name + "</a>\n" + 
				 "        <div class='inline-description'>주문 수량 : " + amount + "</div>\n" + 
				 "        <div class='price'>\n" + 
				 "            <div class='current'>￦" + numberWithCommas(amount * product.price) + "</div>\n" + 
				 "            <input type='hidden' name='qty' value='" + amount + "'>\n" + 
				 "            <input type='hidden' name='unitPrice' value='" + amount * product.price + "'>\n" + 
				 "        </div>\n" + 
				 "    </div>\n" + 
				 "  </div>\n" + 
				 "</div>";
	
	return returnStr;
}


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function duplicateInfo() {
	$("#receiverName").val("${member.name}");
	$("#receiverPhone").val("${member.phone}");
	$("#postcode").val("${member.postcode}");
	$("#address").val("${member.address}");
	$("#guide").val("${member.remainAddr}");
}

</script>

</body>
