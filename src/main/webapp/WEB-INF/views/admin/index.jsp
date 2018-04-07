<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<head>
<style>
#outerDiv{
margin-top:5%;
margin-bottom:10%;
}

</style>
</head>
<body>
	<div class="information-blocks" id="outerDiv">
		<div class="column-article-wrapper">
			<div class="row nopadding">
				<div class="col-sm-6 information-entry left-border nopadding">
					<div class="column-article-entry">
						<a class="title">통계</a>
						<a class="description" href="/admin/product/salesForm"> 상품 매출액 통계
							<i class="fa fa-angle-right"></i> <br>
						</a> 
						<a class="description" href="/admin/member/visitorForm"> 일일 방문자 통계
							<i class="fa fa-angle-right"></i><br>
						</a>
					</div>
				</div>
				<div class="col-sm-6 information-entry left-border nopadding">
					<div class="column-article-entry">
						<a class="title">주문</a>
						<a class="description" href="/admin/order/listForm">주문 관리<i class="fa fa-angle-right"></i><br>
                        </a>
					</div>
				</div>
				<div class="col-sm-6 information-entry left-border nopadding">
					<div class="column-article-entry">
						<a class="title" href="/admin/list">상품</a>
						<a class="description" href="/admin/product/listForm">상품 관리 <i class="fa fa-angle-right"></i></a><br>
						<a class="description" href="/admin/product/stockForm">재고 관리 <i class="fa fa-angle-right"></i></a><br>
						<a class="description" href="/admin/product/featureForm">추천 상품 관리 <i class="fa fa-angle-right"></i></a>
					</div>
				</div>
                <div class="col-sm-6 information-entry left-border nopadding">
                  <div class="column-article-entry">
                    <a class="title">디자인</a>
                    <a class="description" href="/admin/frontImageForm">대문 이미지 변경<i class="fa fa-angle-right"></i></a><br>
                  </div>
                </div>
			</div>
		</div>
	</div>
	<div></div>
</body>