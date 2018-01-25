<%@ page contentType="text/html; charset=utf-8"%>
<body class="style-10">

<style>
.goods-regdate{
  font-size: 13px; 
  line-height: 14px; 
  color: #8b8b8b; 
  text-transform: uppercase; 
  display: block; 
  font-weight: 500; 
  margin-bottom: 7px;
}

.product-slide-entry img {
	width : 100%;
	height : 100%

} 


</style>

  <!-- LOADER -->
  <div class="content-push">

    <div class="breadcrumb-box">
      <a href="/">Home</a> <i class="fas fa-caret-right"></i> <a href="/product/list/110">상품 목록</a>
    </div>

    <div class="information-blocks">
      <div class="row">
        <div class="col-md-9 col-md-push-3 col-sm-8 col-sm-push-4">

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
                            <option value='newProduct' selected>등록순</option>
                            <option value='endDate'>마감날짜순</option>
                            <option value='deadline'>참여많은순</option>
                            <option value='lowPrice'>낮은가격순</option>
                            <option value='highPrice'>높은가격순</option>
                          </select>
                        </div>
                      </div>
                      <div class="entry">
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

        <!-- Left Side Menu -->
        <div class="col-md-3 col-md-pull-9 col-sm-4 col-sm-pull-8 blog-sidebar">
          <div class="information-blocks categories-border-wrapper">
            <div class="block-title size-3">Categories</div>
            <div class="enterContent-2"></div>
                <div class="article-container style-1">
                <ul>
                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/110"> EARRING</a></li>
                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/120"> PIERCING</a></li>
                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/130"> NECKLACE</a></li>
                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/140"> BRACELET</a></li>
                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/150"> RING</a></li>
                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/210"> HAIR ITEM</a></li>
                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/220"> ETC</a></li>
                    <li><i class="fas fa-caret-right"></i><a href="/product/listForm/230"> ON SALE</a></li>
                    </ul>
                </div>
          	</div>
        </div>
        <!-- /.Left Side Menu -->
      </div>
    </div>
  </div>

  <div class="clear"></div>
  
<script>
var page = 0;

$(document).ready(function() {
	getList(0);
})

$("#more").click(function() {
	page = page + 1;
	getList(page);
})


function getList(page) {
	var categoryNo = $("#category").val();
	
	$.ajax({
		url : "/product/list/" + categoryNo,
		dataType : "json",
		data : {
			"page" : page
		},
		success : function(data) {
			if(data.result == "FAIL") {
				alert("마지막 페이지 입니다.");
				window.page = window.page - 1;
				console.log(window.page);
				return;
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
      	str += "        	<div class='current gpurchasePrice'>￦"+list.price+"</div>"
      	str += "		</div>"
      	str += "		<div class='list-buttons'>"
      	str += "		</div>"
      	str += "	</div>"
      	str += "	<div class='clear'></div>"
      	str += "</div>"
	})
	
	return str;
	
}	  

</script>  
</body>
</html>
