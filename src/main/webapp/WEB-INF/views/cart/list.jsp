<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<head>
</head>


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
                            	<th class="column-0"></th>
                                <th class="column-1">상품 명</th>
                                <th class="column-2">상품 가격</th>
                                <th class="column-3">주문 수량</th>
                                <th class="column-4">주문 가격</th>
                                <th class="column-5"></th>
                            </tr>
                            
                        </table>
                    </div>
                    <div class="cart-submit-buttons-box">
                        <a class="button style-15">Continue Shopping</a>
                        <a class="button style-15">Update Bag</a>
                    </div>
                    <div class="row">
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
                                <a class="button style-10" id="order" href="#">Proceed To Checkout</a>
                                <a class="simple-link" href="#">Checkout with Multiple Addresses</a>
                            </div>
                        </div>
                    </div>
                </div>

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
		   url : "/cart",
		   dataType : "json",
		   success : function(data) {
				var cart = $("#cart");
				var list = data.list;
				
				for(var i in list) {
					addEntry(list[i]);
				}
		   },
	   })
	   
	   $("#order").click(function() {
		   addOrderCookie();
	   })
   })
   
   function addEntry(cart) {
	   var returnStr = "";
	   var product = "1234";
	   
	   $.ajax({
		   url : "/product/" + cart.productNo,
		   dataType : "json",
		   success : function(data) {
				$("#cart").append(getEntryStr(data, cart));
		   },
		   error : function(data) {
			   console.log(data);
		   }
			   
	   })
	   
   }
   
   function getEntryStr(product, cart) {
	   var returnStr = "";
	   
	   returnStr += "<tr>\n" + 
	   				" 	<td>  <label class='checkbox-entry' style='text-align: center;'> <input type='checkbox' checked/> <span class='check'></span>" +
                    " </label> </td>"+ 
					"   <td>\n" + 
					"       <div class=\"traditional-cart-entry\">\n" + 
					"           <a href=\"#\" class=\"image\"><img src=\"/resources/upload/" + product.frontImage + "\" alt=\"\"></a>\n" + 
					"           <div class=\"content\">\n" + 
					"               <div class=\"cell-view\">\n" + 
					"                   <a href=\"#\" class=\"tag\">"+ product.categoryNo +"</a>\n" + 
					"                   <a href=\"#\" class=\"title\">" + product.name + "</a>\n" + 
					"					<input type='hidden' value=" + product.productNo + ">" +					
					"                   <div class=\"inline-description\">"+ product.subName +"</div>\n" + 
					"               </div>\n" + 
					"           </div>\n" + 
					"       </div>\n" + 
					"   </td>\n" + 
					"   <td>" + product.price + "</td>\n" + 
					"   <td>\n" + 
					"       <div class=\"quantity-selector detail-info-entry\">\n" + 
					"           <div class=\"entry number-minus\">&nbsp;</div>\n" + 
					"           <div class=\"entry number\">"+ cart.amount +"</div>\n" + 
					"           <div class=\"entry number-plus\">&nbsp;</div>\n" + 
					"       </div>\n" + 
					"   </td>\n" + 
					"   <td><div class=\"subtotal\">"+ product.price * cart.amount +"</div></td>\n" + 
					"   <td><a class=\"remove-button\"><i class=\"fa fa-times\"></i></a></td>\n" + 
					"</tr>\n";
		
		return returnStr;
	   
   }
   
   function addOrderCookie() {
	   var orders = [];
	   
	   var checkboxs = $(".checkbox-entry input");
	   
	   for(var i=0; i<checkboxs.length; i++) {
			if(checkboxs[i].checked == true) {
				var tr = $(checkboxs[i]).parent().parent().parent();
				
				var productNo = tr.find("input[type='hidden']").val();
				var amount = tr.find(".number").html();
				
				orders.push({
					"productNo" : productNo,
					"amount" : amount
				})
			}
	   }
	   
	   $.ajax({
		   url : "/order/ordersCookie",
		   dataType : "json",
		   type : "POST",
		   data : {
			   ordersData : JSON.stringify(orders)
		   },
		   success : function(data) {
			   
		   }
	   })
	   
	   
   }
   
   
   </script>
   
