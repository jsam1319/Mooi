<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<head>
<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>

<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<style>
td, th{
text-align: center;
}

input[type="search"]{
border: 1px solid;
}

#productTable_filter{
margin-bottom:1%;
}

#bread{
margin:0%;
margin-bottom:2%;
}

#goRegister{
float:right;
}

.modal-backdrop {
z-index : 0;
}
</style>
</head>
<body class="style-10">


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
		        <div class="accordeon-title active">
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

	<div class="breadcrumb-box" id="bread">
		<a href="#">Home</a>
		<a href="#">Shop</a>
		<a href="#">Shopping Cart Traditional</a>
	</div>
	
	<div class="information-blocks">
		<div class="table-responsive">
			<table id="productTable">
				<thead>
					<tr>
						<th id="th">주문번호</th>
						<th id="th">주문자명</th>
						<th id="th">주문일자</th>
						<th id="th">주문가격</th>
						<th id="th">주문상태</th>
						<th id="th">자세히보기</th>
						<th id="th">주문상태변경</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	
	
<script>

$(document).ready(function(){
	var json;
	var table;
	
	$.ajax({
		url:"/order",
		dataType:"json",
		success:function(data){
			json = JSON.stringify(data.list);
			console.log(data.list)
 			var dataSet = jsonToDataSet(json);
 			
 			table = $('#productTable').DataTable({
 				
 				autoWidth : true,
 				data : dataSet,
 				columnDefs: [{
			    	   	targets:-1,
			    	   	data:null,
			            defaultContent: "<div id='hiddenDiv'></div><a class='button style-15' name='regist'>변경</a>"
			    }],
 				language: {
 			        processing:     "데이터 검색 중",
 			        search:         "검색",
 			        lengthMenu:    "한 페이지 당 _MENU_ 개의 데이터",
 			        info:           " _START_ 번째 부터 _END_ (총 상품 _TOTAL_개)",
 			        infoEmpty:      "데이터가 없습니다.",
 			        infoFiltered:   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
 			        infoPostFix:    "",
 			        loadingRecords: "Chargement en cours...",
 			        zeroRecords:    "열이 존재하지 않습니다.",
 			        emptyTable:     "데이터가 없습니다.",
 			        paginate: {
 			            first:      "처음",
 			            previous:   "이전",
 			            next:       "다음",
 			            last:       "마지막"
 			        },
 			        aria: {
 			            sortAscending:  ": 오름 차순 정렬",
 			            sortDescending: ": 내림 차순 정렬"
 			        }
 				}
 				
 			});
 			
 				/* $("a[name='regist']").click(function(){
 	 				var tableNo = table.row($(this).parents('tr')).data()[4];
 	 				//$(this).attr("href","/product/insert/"+tableNo);
 			}) */
 			
 			$('#productTable tbody').on( 'click', "a[name='regist']", function () {
 		        var data = table.row( $(this).parents('tr') ).data();
 		     	
 		    } );
 			
 			
		}
	})
	
	jsonToDataSet = function(json) {
		
		var obj = JSON.parse(json)
		var category;
		var str;
    	var dataSet = [];
    	
    	for(var i in obj) {
    		var data = [];
    		
    		data.push(obj[i].ordersNo);
    		data.push(obj[i].ordererName);
    		data.push(obj[i].regdate);
    		data.push(numberWithCommas(obj[i].price) + " 원");
    		
    		/* data.push("<a href='/product/detailForm/" + obj[i].productNo + "'> " + obj[i].name + " </a>"); */
    		
    		switch(obj[i].status){
    			case 'OC':
    				data.push("주문완료");
    				break;
    			case 'PC':
    				data.push("결제완료");
    				break;
    			case 'DR':
    				data.push("배송준비중");
    				break;
    			case 'DC':
    				data.push("발송완료(배송중)");
    				break;
    			case 'RE':
    				data.push("반품");
    				break;
    			case 'ER':
    				data.push("취소");
    				break;
    			case 'NF':
    				data.push("오류발생");
    				break;	
    		}
    		
    		data.push('<a class="button style-15" name="orderDetail"  data-toggle="modal" data-target="#myModal" value="'+ obj[i].ordersNo +'">자세히 보기</a>');
    		
    		dataSet.push(data); 
		}
    	
    	return dataSet;
	}
     
	$('#myModal').on('shown.bs.modal', function () {
		$('#myInput').focus()
	})
	
	$(document).on('click', 'a[name="orderDetail"]', function() {
		appendEntry($(this).attr("value"));
	})
})


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function appendEntry(ordersNo) {
	$.ajax({
		url : "/order/" + ordersNo,
		dataType : "json",
		success : function(data) {
			$("#orderList").html("");
			
			var orders = data.orders;
			var items = data.items;
			var products = data.products;
			
			for(var i in products) {
				
				$("#orderList").append(getEntryStr(products[i], items[i].amount));
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

</script>    

</body>