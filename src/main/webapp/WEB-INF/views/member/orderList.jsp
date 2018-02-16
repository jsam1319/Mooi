<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<head>

<style>
.cart-table .content {
	margin-left : 0px;
}

.cart-table .column-1 {
	width : 200px;
}


.cart-table .column-3 {
	width : 300px;
}

.cart-table td {
	padding : 0px 30px;
}


.modal-backdrop {
z-index : 0;
}

</style>


</head>

<div class="modal fade" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h3 class="block-title order-main-heading"> 주문 상세보기 </h3>
	      </div>
	      <div class="modal-body">
	        
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
		        <div class="accordeon-title">
		          <h4 class="block-title order-main-heading">주문자 정보</h4>
		        </div>
		        <div style="display: block;" class="accordeon-entry">
		          <div class="article-container style-1">
		            <div class="row">
		              <div class="col-sm-4 form-group">
		                <label class="Pname">성명</label> <input
		                  class="simple-field" name="ordererName" type="text" id="orderName"
		                  required value="" readonly="readonly" />
		              </div>
		              <div class="col-sm-4 form-group">
		                <label>전화번호</label> <input
		                  class="simple-field" name="ordererPhone" type="text" id="orderPhone"
		                  required value="" readonly="readonly" />
		              </div>
		              <div class="col-sm-1"></div>
		            </div>
		          </div>
		        </div>
		
		        <div class="enterContent-1"></div>
		
		        <div class="accordeon-title active">
		          <h4 class="block-title order-main-heading">배송지 정보</h4> 
		          
		        </div>
		        <div class="accordeon-entry">
		          <div class="article-container style-1">
		            
		            
		            <div class="row">
		              <div class="col-sm-4 form-group" id="orderInfo">
		                <label>성명</label> <input
		                  class="simple-field" type="text" id="receiverName"
		                  required placeholder="성명" value="" name="name" readonly/>
		              </div>
		              <div class="col-sm-4 form-group">
		                <label>전화번호</label> <input
		                  class="simple-field" type="text" id="receiverPhone"
		                  placeholder="ex) 010-1234-1234" readonly value=""
		                  name="phone" />
		              </div>
		            </div>
		            <div class="row">
		              <div class="col-sm-3 form-group">
		                <label>주소 </label> <input
		                  class="simple-field" type="text" id="receiverPost"
		                  value="" name="postcode" readonly placeholder="우편번호" />
		              </div>
		              <div class="clear"></div>
		              <div class="col-sm-12 form-group">
		                <input class="simple-field" type="text" name="address"
		                  id="receiverAddress1" required value=""
		                  placeholder="기본주소" readonly />
		              </div>
		              <div class="col-sm-5 form-group">
		                <input class="simple-field" type="text" name="remainAddr"
		                  id="receiverAddress2" required value=""
		                  placeholder="상세주소" readonly />
		              </div>
		            </div>
		            <div class="row">
		              <div class="col-sm-10 form-group">
		                <label>배송 메세지 </label>
		                <textarea class="simple-field" readonly required name="content"></textarea>
		              </div>
		            </div>
		          </div>
		        </div>
		
		        <div class="clear"></div>
		
		        <div class="enterContent-1"></div>
		    
		
		        <input type="hidden" id="orderlist" value="${orderList}">
		
		      </div>
			  
		    </div> 
			        
	        
	        
	      </div>
	      <div class="modal-footer">
	        <a class="button style-10" data-dismiss="modal">Close</a>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

    <div id="content-block">
            <div class="content-push">

                <div class="breadcrumb-box">
                    <a href="#">Home</a>
                    <a href="#">Shop</a>
                    <a href="#">Shopping Cart Traditional</a>
                </div>

                <div class="information-blocks">
                    <div class="table-responsive">
                        <table class="cart-table" id="cart">
                            <tr>
                            	<th class="column-0"> </th>
                                <th class="column-1">상품 명</th>
                                <th class="column-2">주문 가격</th>
                                <th class="column-3">주문 일자</th>
                                <th class="column-4">주문 상태</th>
                                <th class="column-4"></th>
                            </tr>
                            
                        </table>
                    </div>
                   <!--  <div class="cart-submit-buttons-box">
                        <a class="button style-15">Continue Shopping</a>
                        <a class="button style-15">Update Bag</a>
                    </div> -->
<!--                     <div class="row">
                        <div class="col-md-4 information-entry">
                            <h3 class="cart-column-title">Get shipping Estimates</h3>
                            <form>
                                <label>Country</label>
                                <div class="simple-drop-down simple-field size-1">
                                    <select>
                                        <option>United States</option>
                                        <option>Great Britain</option>
                                        <option>Canada</option>
                                    </select>
                                </div>
                                <label>State</label>
                                <div class="simple-drop-down simple-field size-1">
                                    <select>
                                        <option>Alabama</option>
                                        <option>Alaska</option>
                                        <option>Idaho</option>
                                    </select>
                                </div>
                                <label>Zip Code</label>
                                <input type="text" value="" placeholder="Zip Code" class="simple-field size-1">
                                <div class="button style-16" style="margin-top: 10px;">calculate shipping<input type="submit"/></div>
                            </form>
                        </div>
                        <div class="col-md-4 information-entry">
                            <h3 class="cart-column-title">Discount Codes <span class="inline-label red">Promotion</span></h3>
                            <form>
                                <label>Enter your coupon code if you have one.</label>
                                <input type="text" value="" placeholder="" class="simple-field size-1">
                                <div class="button style-16" style="margin-top: 10px;">Apply Coupon<input type="submit"/></div>
                            </form>
                        </div>
                        <div class="col-md-4 information-entry">
                            <div class="cart-summary-box">
                                <div class="sub-total">Subtotal: $990,00</div>
                                <div class="grand-total">Grand Total $1029,79</div>
                                <a class="button style-10" id="order" href="/orderForm">선택한 상품 주문하기</a>
                            </div>
                        </div>
                    </div>
 -->                </div>

            </div>

        </div>
        <div class="clear"></div>

<!--     <div class="overlay-popup" id="image-popup">
        
        <div class="overflow">
            <div class="table-view">
                <div class="cell-view">
                    <div class="close-layer"></div>
                    <div class="popup-container">
                        <img class="gallery-image" src="img/portfolio-1.jpg" alt="" />
                        <div class="close-popup"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   </div> -->
   
   
   <script>
   
   $(document).ready(function() {
	   
	   $.ajax({
		   url : "/order/member/" + ${login},
		   dataType : "json",
		   success : function(data) {
				addEntry(data);
				
		   },
	   })
	   
	   $(document).on('click', 'a[name="detail"]', function() {
		   var ordersNo = $(this).attr("value");
		   appendDetailEntry(ordersNo);
	   })
	   
   })
   
   function addEntry(data) {
	   var orders = data.orders;
	   
	   console.log(data);
	   
	   for(var i in orders) {
		   $("#cart").append(getEntryStr(orders[i], data[orders[i].ordersNo]));
	   }
   }
   
   function getEntryStr(orders, products) {
	   var returnStr = "";
	   var name = "";
	   var elseName = "";
	   var status = "";
	   
	   if(products.length > 1) {
		   name = products[0].name;
		   elseName = " 외 " + Number(products.length - 1) + " 개";
	   }
	   
	   else name = products[0].name;
	   
	   switch(orders.status){
		case 'OC':
			status = "주문완료";
			break;
		case 'PC':
			status = "결제완료";
			break;
		case 'DR':
			status = "배송준비중";
			break;
		case 'DC':
			status = "발송완료(배송중)";
			break;
		case 'RE':
			status = "반품";
			break;
		case 'ER':
			status = "취소";
			break;
		case 'NF':
			status = "오류발생";
			break;	
		}
	   
	   returnStr += "<tr>\n" + 
	   				"   <td style=\"text-align : center\"> " +
	   				"  			<a href='#' class='image'><img class='order-image'\n style=\"width : 80px; height : 80px\" src='/resources/upload/" + products[0].frontImage + "' alt=''></a>\n" + 
					" </td>" +
	   				"   <td>\n" + 
					"       <div class=\"traditional-cart-entry\">\n" + 
					"           <div class=\"content\">\n" + 
					"               <div class=\"cell-view\">\n" + 
					"                   <label class=\"title\">" + name + "</label>\n " + elseName +  
					"               </div>\n" + 
					"           </div>\n" + 
					"       </div>\n" + 
					"   </td>\n" + 
					"   <td>" + numberWithCommas(orders.price) + " 원 <input type='hidden' name='price' value='"+ orders.price +"'></td>\n" + 
					"   <td>\n" + 
					"     "+ orders.regdate + 
					"   </td>\n" + 
					"	<td>\n" + 
					"     "+ status + 
					"   </td>\n" + 
					"   <td><a class=\"button style-15\" name='detail' data-toggle=\"modal\" data-target=\"#myModal\" value='" + orders.ordersNo + "'> 자세히 보기 </a></td>\n" + 
					"</tr>\n";
		
		return returnStr;
	   
   }
   
   function appendDetailEntry(ordersNo) {
		$.ajax({
			url : "/order/" + ordersNo,
			dataType : "json",
			success : function(data) {
				$("#orderList").html("");
				
				var orders = data.orders;
				var items = data.items;
				var products = data.products;
				
				for(var i in products) {
					$("#orderList").append(getEntryDetailStr(products[i], items[i].amount));
				}
				
				$("#total").html(numberWithCommas(orders.price) + " 원");
			
				$("input[name='ordererName']").val(orders.ordererName);
				$("input[name='ordererPhone']").val(orders.ordererPhone);
				
				$("input[name='name']").val(orders.name);
				$("input[name='phone']").val(orders.phone);
				$("input[name='address']").val(orders.address);
				$("input[name='postcode']").val(orders.postcode);
				$("input[name='remainAddr']").val(orders.remainAddr);
				$("textarea[name='content']").val(orders.content);
				
			},
			error : function(data) {
				console.log(data);
			}
		})
	}

	function getEntryDetailStr(product, amount) {
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

   </script>
   
