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

</style>
</head>
<body class="style-10">
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
                                <th id="th">원가</th>
                                <th id="th">재고</th>
                                <th id="th">상품수정</th>
                                <th id="th">상품삭제</th>
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
		url:"/product/list",
		dataType:"json",
		success:function(data){
			json = JSON.stringify(data.list);
			
 			var dataSet = jsonToDataSet(json);
 			
 			table = $('#productTable').DataTable({
 				
 				autoWidth : true,
 				data : dataSet,
 				columnDefs: [
 					{
			    	   	targets:-1,
			    	   	data:null,
			            defaultContent: "<div id='hiddenDiv'></div><a class='button style-15' name='remove'>삭제</a>"
				    },
				    {
			    	   	targets:-2,
			    	   	data:null,
			            defaultContent: "<div id='hiddenDiv'></div><a class='button style-15' name='modify'>수정</a>"
			    	}
			    ],
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
 			
 			$('#productTable tbody').on( 'click', "a[name='remove']", function () {
 				var ok = confirm("상품을 삭제하시겠습니까?");
 				
 				if(ok == true) {
 					var tr = $(this).parents('tr');
 	 		       	var productNo = table.row( $(this).parents('tr') ).data()[0];
 	 		       
 	 		      	$.ajax({
 	 		    	   url : "/product/" + productNo,
 	 		    	   type : "delete",
 	 		    	   success : function(data) {
 	 		    		   if(data.result == "SUCCESS") {	
 	 		    			   alert("상품 삭제가 성공적으로 되었습니다.");
 	 		    			   $(tr).remove();
 	 		    		   }
 	 		    	   }
 	 		       	});
 				}
 		    });
 				
 			$('#productTable tbody').on( 'click', "a[name='modify']", function () {
 			   	var tr = $(this).parents('tr');
 		       	var productNo = table.row( $(this).parents('tr') ).data()[0];
 		       
 		      	location.href = "/product/modifyForm/" + productNo;
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
    		
    		data.push(obj[i].category);
    		data.push(obj[i].regdate);
    		data.push(obj[i].price);
    		data.push(obj[i].cost);
    		data.push(obj[i].stock);
    		
    		dataSet.push(data);
		}
    	
    	return dataSet;
	}
    	


	
})

</script>    

</body>