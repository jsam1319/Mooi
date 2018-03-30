<%@ page contentType="text/html; charset=utf-8"%>
<body class="style-10">

<style>

.product-slide-entry img {
	width : 250px;
	height : 250px;

}

.product-slide-entry .tag {
	font-size: 13px

}  

.product-slide-entry .title {
	font-size: 20px

}  


</style>

  <!-- LOADER -->
  <div class="content-push">
	<div id="loading"><img id="loading-image" src="/resources/img/loading/5.gif" alt="Loading..." /></div>

    <div class="information-blocks">
      <div class="row">
        <div class="col-md-12 col-sm-8">

          <input type="hidden" id="loginMemberNo" value="${no}">
          <input type="hidden" id="category" value="${categoryNo}">

          <div class="information-blocks">
              <div>
                <!-- /.ongoing Gpurchase -->
                <div class="tabs-entry ongoinGpurchase">
                  <!-- Top Menu -->
                  <div class="page-selector">
                    <div class="shop-grid-controls">
                      <div class="entry">
                        <div class="inline-text">Sort by</div>
                        <div class="simple-drop-down">
                          <select id="productOrder">
                          	<option> 공사중입니다. </option>
                           <!--  <option value='newProduct' selected>등록순</option>
                            <option value='endDate'>마감날짜순</option>
                            <option value='deadline'>참여많은순</option>
                            <option value='lowPrice'>낮은가격순</option>
                            <option value='highPrice'>높은가격순</option> -->
                          </select>
                        </div>
                      </div>
                      <div class="entry" id="view">
                        <div class="view-button active grid">
                          <i class="fa fa-th"></i>
                        </div>
                        <div class="view-button list">
                          <i class="fa fa-list"></i>
                        </div>
                      </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                  <!-- /.Top Menu -->
                  
                  <!-- Gpurchase List -->
                  <div class="row shop-grid grid-view listView">
                  
                  
                  </div>
                  
                  <div class="page-selector" style="text-align: center;">
                    <a class="button style-10" id="more" style="font-size: 15px">더 보기(MORE)</a>
                    <div class="pages-box">
                      <a href="#" class="square-button"><i class="fa fa-angle-up"></i></a>
                    </div>
                    <div class="clear"></div>
                  </div>
                  <!-- /.Gpurchase List -->
                </div>
                <!-- /.ongoing Gpurchase -->

                <!-- End Gpurchase -->
              </div>
            </div>
          </div>
          <!-- /.End Gpurchase -->

        
      </div>
    </div>
  </div>

  <div class="clear"></div>
  
<script>
var page = 0;

$(document).ready(function() {
	var _ismobile = navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i);
	
	$('#loading').show();
	
	if(_ismobile != null) {
		$('.shop-grid').removeClass('grid-view').addClass('list-view');
		$("#view").hide();
	}
	
	getList(0);

	$('#loading').hide();  
})

$("#more").click(function() {
	$('#loading').show();
	
	page = page + 1;
	getList(page);
	
	$('#loading').hide();  
})


function getList(page) {
	var categoryNo = $("#category").val();
	
	$.ajax({
		url : "/product/list/" + categoryNo,
		dataType : "json",
		async : false,
		data : {
			"page" : page
		},
		success : function(data) {
			if(data.result == "FAIL") {
				if(page != 0) {
					alert("마지막 페이지 입니다.");
					window.page = window.page - 1;
					console.log(window.page);
				}
				
				return false;
			}
			
			$(".listView").append(returnStr(data.list));
			console.log(data);
		},
		error : function(data) {
			console.log(data);
		}
	})
} 


/** 붙이는 html String */
function returnStr(data) {
	var str = "";
	
	$(data).each(function(){
		var list = this;
		
		str += "<div class='col-md-3 col-sm-4 shop-grid-item'>"
      	str += "	<div class='product-slide-entry'>"
      	str += "		<div class='product-image'>"
      	str += "			<a href='/product/detailForm/"+list.productNo+"'><img src='/resources/upload/"+list.frontImage+"' alt='image' /></a>"
      	str += "		</div>"
      	str += "		<a class='tag'>"+list.subName+"</a>"
      	str += "		<a href='/product/detailForm/"+list.productNo+"' class='title loginTitle' title='"+list.productNo+"'>"+list.name+"</a>"
		str += "		<div class='price gpurchasePrice'>"
      	str += "        	<div class='current gpurchasePrice'>￦"+ numberWithCommas(list.price)+"</div>"
      	str += "		</div>"
      	str += "		<div class='list-buttons'>"
      	str += "		</div>"
      	str += "	</div>"
      	str += "	<div class='clear'></div>"
      	str += "</div>"
	})
	
	return str;
	
}	



function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>  
</body>
</html>
