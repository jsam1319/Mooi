<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


</style>
</head>
<body class="style-10">

                <div class="breadcrumb-box" id="bread">
                    <a href="#">Home</a>
                    <a href="#">Shop</a>
                    <a href="#">Shopping Cart Traditional</a>
                    <a class="button style-15" id="goRegister" href="/product/insertForm">상품 등록</a>
                </div>
                
                

                <div class="information-blocks">
               		<div id="loading"><img id="loading-image" src="/resources/img/loading/5.gif" alt="Loading..." /></div>
					<div class="tabs-container">
						<div class="swiper-tabs tabs-switch">
							<div class="title">Products</div>
							<div class="list">
								<a class="block-title tab-switcher active">추천 상품</a> 
								<div class="clear"></div>
							</div>
						</div>
					<div>
						<div class="tabs-entry">
						<div class="products-swiper">
							<div class="swiper-container" data-autoplay="0" data-loop="0"
								data-speed="500" data-center="0"
								data-slides-per-view="responsive" data-xs-slides="2"
								data-int-slides="2" data-sm-slides="3" data-md-slides="5"
								data-lg-slides="6" data-add-slides="6">
								<div class="swiper-wrapper" id="wrapper">
									<c:forEach var="item" items="${feature}" begin="0">
									<div class="swiper-slide" id="${item.productNo}">
										<div class="paddings-container">
											<div class="product-slide-entry">
												<div class="product-image">
													<img src="/resources/upload/${item.frontImage}" alt="" /> 
													<div class="bottom-line">
														<a class="bottom-line-a">
															<i class="fa fa-shopping-cart"></i> 장바구니에 담기 
														</a>
													</div>
												</div>
												<a class="tag" href="">Men clothing</a> <a class="title"
 													href="/product/detailForm/${item.productNo}">${item.name}</a>
												<div class="price">
													<div class="current"><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="￦"/></div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								<div class="pagination"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

                <div class="information-blocks">
                    <div class="table-responsive">
                        <table id="productTable">
                        <thead>
                            <tr>
                            	<th id="th">상품번호</th>
                                <th id="th">상품명</th>
                                <th id="th">카테고리</th>
                                <th id="th">등록일자</th>
                                <th id="th">가격</th>
								<th id="th">추천상품여부</th>
                                <th id="th">추가/삭제</th>
                            </tr>
                        </thead>
                        </table>
                    </div>
                 </div>
<script>

$(document).ready(function(){
	var size = ${feature.size()};
	var json;
	var table;
	
	$('#loading').hide();  
	
	$(document).on('click', 'a[name="add"]', function() {
		var tds = $(this).parent().parent().find("td");
		var productNo = tds[0].innerHTML;
		
		if(size >= 6) {
			alert("추천상품은 최대 6개까지 가능합니다.");
			return false;
		}
		
		$.ajax({
			url : "/product/feature/" + productNo,
			type : "PUT",
			async : false,
			success : function(data) {
				$('#loading').show(); 
				
				tds[5].innerHTML = "<label>등록됨</label>";
				tds[6].innerHTML = '<a class="button style-17" name="remove">삭제</a>';
				
				$.ajax({
					url : "/product/" + productNo,
					async : false,
					success : function(data) {
						/* $("#wrapper").append(addFeature(data)); */
						
						location.reload();
					}
				})
				
				$('#loading').hide(); 
			},
			error : function(a, b, c) {
				console.log(a, b, c);/* $("#wrapper").append(addFeature(data)); */
			}
			
		})
	})
	
	$(document).on('click', 'a[name="remove"]', function() {
		var tds = $(this).parent().parent().find("td");
		var productNo = tds[0].innerHTML;
		
		$.ajax({
			url : "/product/feature/" + productNo,
			type : "PATCH",
			async : false,
			success : function(data) {
				$('#loading').show(); 
				
				tds[5].innerHTML = "등록되지 않음";
				tds[6].innerHTML = '<a class="button style-15" name="add">추가</a>';
				
				$("#" + productNo).remove();
				
				$('#loading').hide(); 
			},
			error : function(a, b, c) {
				console.log(a, b, c);
			}
			
		})
	})
	
	$.ajax({
		url:"/product/list",
		dataType:"json",
		success:function(data){
			json = JSON.stringify(data.list);
			
 			var dataSet = jsonToDataSet(json);
 			
 			table = $('#productTable').DataTable({
 				
 				autoWidth : true,
 				data : dataSet,
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
 		       $(this).attr("href","/product/insert/"+data[4])
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
    		
    		data.push(obj[i].productNo);
    		data.push("<a href='/product/detailForm/" + obj[i].productNo + "'> " + obj[i].name + " </a>");
    		
    		category = obj[i].categoryNo;
    		switch(category){
    			case 0:
    				data.push("카테고리 미분류");
    				break;
    			case 110:
    				data.push("EARRING");
    				break;
    			case 120:
    				data.push("Jacket");
    				break;
    			case 130:
    				data.push("Dress");
    				break;
    			case 140:
    				data.push("Knit");
    				break;
    			case 150:
    				data.push("SweatShirt");
    				break;
    			case 210:
    				data.push("Skirt");
    				break;
    			case 220:
    				data.push("Short Pants");
    				break;
    			case 230:
    				data.push("Pants");
    				break;
    		}
    		
    		data.push(obj[i].regdate);
    		data.push(obj[i].price);
    		
    		if(obj[i].feature == 'T') {
    			data.push('<label>등록됨</label>')
    			data.push('<a class="button style-17" name="remove">삭제</a>');
    		}
    		
    		else {
    			data.push('등록되지 않음')
    			data.push('<a class="button style-15" name="add">추가</a>');
    		}
    		
    		dataSet.push(data);
		}
    	
    	return dataSet;
	}
    	
	function addFeature(product) {
		var returnString = "";
		
		returnString += "<div class=\"swiper-slide\" id='"+ product.productNo +"'>\n" + 
						"	<div class=\"paddings-container\">\n" + 
						"		<div class=\"product-slide-entry\">\n" + 
						"			<div class=\"product-image\">\n" + 
						"				<img src=\"/resources/upload/" + product.frontImage + "\" alt=\"\" />"  + 
						"				<div class=\"bottom-line\">\n" + 
						"					<a class=\"bottom-line-a\"><i\n" + 
						"						class=\"fa fa-shopping-cart\"></i> 장바구니에 담기 </a>\n" + 
						"				</div>\n" + 
						"			</div>\n" + 
						"			<a class=\"tag\" href=\"#\">Men clothing</a> <a class=\"title\"\n" + 
						"				href=\"#\">" + product.name + "</a>\n" + 
						"			<div class=\"price\">\n" + 
						"				<div class=\"current\">" + product.price + "</div>\n" + 
						"			</div>\n" + 
						"		</div>\n" + 
						"	</div>\n" + 
						"</div></div></div>";
		
		return returnString;
						
	}

	
	
	
})
</script>    

</body>