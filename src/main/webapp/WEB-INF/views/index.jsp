<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<style type="text/css">
#imageSizing {
	width: 195px;
	height: 269px;
}
</style>
</head>

<body class="style-10">

	<div class="content-push">
		<div class="information-blocks">
			<div class="row">
				<!-- <div class="col-md-3">
					<div class="sidebar-navigation">
						<div class="title">
							Product Categories<i class="fa fa-angle-down"></i>
						</div>
						<div class="list">
							<a class="entry" href="#"><span><i
									class="fa fa-angle-right"></i>Evening dresses</span></a> <a class="entry"
								href="#"><span><i class="fa fa-angle-right"></i>Jackets
									and coats</span></a> <a class="entry" href="#"><span><i
									class="fa fa-angle-right"></i>Tops and Sweatshirts</span></a> <a
								class="entry" href="#"><span><i
									class="fa fa-angle-right"></i>Blouses and shirts</span></a> <a
								class="entry" href="#"><span><i
									class="fa fa-angle-right"></i>Trousers and Shorts</span></a> <a
								class="entry" href="#"><span><i
									class="fa fa-angle-right"></i>Evening dresses</span></a> <a class="entry"
								href="#"><span><i class="fa fa-angle-right"></i>Jackets
									and coats</span></a> <a class="entry" href="#"><span><i
									class="fa fa-angle-right"></i>Tops and Sweatshirts</span></a> <a
								class="entry" href="#"><span><i
									class="fa fa-angle-right"></i>Blouses and shirts</span></a>
						</div>
					</div>
					<div class="clear"></div>
				</div> -->
				<div class="col-md-12">

					<div class="navigation-banner-swiper">
						<div class="swiper-container" data-autoplay="5000" data-loop="1"
							data-speed="500" data-center="0" data-slides-per-view="1">
							<div class="swiper-wrapper">
								<div class="swiper-slide active" data-val="0">
									<div class="navigation-banner-wrapper light-text align-1"
										style="background-image: url(/resources/img/earring.jpg);">
										<div class="navigation-banner-content">
											<div class="cell-view">
												<h2 class="subtitle">New special collection</h2>
												<h1 class="title">Earrings</h1>
												<div class="description">Lorem ipsum dolor sit amet,
													consectetur adipiscing elit, sed do eiusmod tempor
													incididunt.</div>
												<div class="info">
													<a class="button style-1" href="#">Shop Now</a> <a
														class="button style-1" href="#">Features</a>
												</div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
								</div>
								<div class="swiper-slide" data-val="1">
									<div class="navigation-banner-wrapper light-text align-1"
										style="background-image: url(/resources/img/earring2.jpg);">
										<div class="navigation-banner-content">
											<div class="cell-view">
												<h2 class="subtitle">New special collection</h2>
												<h1 class="title">Wedding</h1>
												<div class="description">Lorem ipsum dolor sit amet,
													consectetur adipiscing elit, sed do eiusmod tempor
													incididunt.</div>
												<div class="info">
													<a class="button style-1" href="#">Shop Now</a> <a
														class="button style-1" href="#">Features</a>
												</div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
								</div>
								<div class="swiper-slide" data-val="2">
									<div class="navigation-banner-wrapper light-text align-1"
										style="background-image: url(/resources/img/earring3.jpg);">
										<div class="navigation-banner-content">
											<div class="cell-view">
												<h2 class="subtitle">New special collection</h2>
												<h1 class="title">Earrings</h1>
												<div class="description">Lorem ipsum dolor sit amet,
													consectetur adipiscing elit, sed do eiusmod tempor
													incididunt.</div>
												<div class="info">
													<a class="button style-1" href="#">Shop Now</a> <a
														class="button style-1" href="#">Features</a>
												</div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<div class="clear"></div>
							<div class="pagination"></div>
						</div>
					</div>

				</div>
			</div>
		</div>


		<div class="information-blocks">
			<div class="tabs-container">
				<div class="swiper-tabs tabs-switch">
					<div class="title">Products</div>
					<div class="list">
						<a class="block-title tab-switcher active">최신 상품</a> <a
							class="block-title tab-switcher">인기 상품</a> <a
							class="block-title tab-switcher">추천 상품</a>
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
								<div class="swiper-wrapper">
								<c:forEach var="item" items="${newArrive}" begin="0">
									<div class="swiper-slide">
										<div class="paddings-container">
											<div class="product-slide-entry">
												<div class="product-image">
													<img src="/resources/upload/${item.frontImage}" alt="" /> 
													<div class="bottom-line">
														<a class="bottom-line-a" id="${item.productNo}">
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
					<div class="tabs-entry">
						<div class="products-swiper">
							<div class="swiper-container" data-autoplay="0" data-loop="0"
								data-speed="500" data-center="0"
								data-slides-per-view="responsive" data-xs-slides="2"
								data-int-slides="2" data-sm-slides="3" data-md-slides="5"
								data-lg-slides="6" data-add-slides="6">
								<div class="swiper-wrapper">
									<c:forEach var="item" items="${popular}" begin="0">
									<div class="swiper-slide">
										<div class="paddings-container">
											<div class="product-slide-entry">
												<div class="product-image">
													<img src="/resources/upload/${item.frontImage}" alt="" /> 
													<div class="bottom-line">
														<a class="bottom-line-a" id="${item.productNo}">
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
					<div class="tabs-entry">
						<div class="products-swiper">
							<div class="swiper-container" data-autoplay="0" data-loop="0"
								data-speed="500" data-center="0"
								data-slides-per-view="responsive" data-xs-slides="2"
								data-int-slides="2" data-sm-slides="3" data-md-slides="5"
								data-lg-slides="6" data-add-slides="6">
								<div class="swiper-wrapper">
									<c:forEach var="item" items="${feature}" begin="0">
									<div class="swiper-slide">
										<div class="paddings-container">
											<div class="product-slide-entry">
												<div class="product-image">
													<img src="/resources/upload/${item.frontImage}" alt="" /> 
													<div class="bottom-line">
														<a class="bottom-line-a" id="${item.productNo}">
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
			<div class="row">
				<div class="information-entry col-md-6">
					<div class="sale-entry sale-entry-border" style="background: #333;">
						<div class="sale-price">
							<img src="img/shipping-icon.png" alt="" />
						</div>
						<div class="sale-title">Free UK shipping</div>
						<div class="sale-description">Lorem ipsum dolor sit amet,
							consectetur adipisc eiusmod. Lorem ipsum dolor sit amet.</div>
					</div>
				</div>
				<div class="information-entry col-md-6">
					<div class="sale-entry sale-entry-border"
						style="background: #901794;">
						<div class="sale-price">
							<img src="img/shipping-icon.png" alt="" />
						</div>
						<div class="sale-title">Free UK shipping</div>
						<div class="sale-description">Lorem ipsum dolor sit amet,
							consectetur adipisc eiusmod. Lorem ipsum dolor sit amet.</div>
					</div>
				</div>
			</div>
		</div>

		<div class="information-blocks">
			<div class="row">
				<div class="col-md-4 information-entry">
					<h3 class="block-title">From The Blog</h3>
					<div class="from-the-blog-entry">
						<a href="#" class="image hover-class-1"><img
							src="img/from-the-blog-thumbnail.jpg" alt=""><span
							class="hover-label">Read More</span></a>
						<div class="description">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit, eiusmod tempor incididunt ut labore
							et dolore magna aliqua. Ut enim ad minim veniam, nostrud
							exercitation ullamco laboris nisi ut aliquip ex ea commodo
							consequat. Duis aute irure dolor in reprehenderit.</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="col-md-4 information-entry">
					<h3 class="block-title">Company Services</h3>
					<ol class="list-type-2">
						<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							eiusmod tempor incididunt ut labore et dolore.</li>
						<li>Ut enim ad minim veniam, nostrud exercitation ullamco
							laboris nisi ut aliquip ex ea commodo consequat.</li>
						<li>Duis aute irure dolor in reprehenderit in voluptate velit
							esse cillum dolore eu fugiat nulla pariatur.</li>
					</ol>
				</div>
				<div class="col-md-4 information-entry">
					<h3 class="block-title">Latest Reviews</h3>
					<div class="swiper-container blockquote-slider" data-autoplay="0"
						data-loop="0" data-speed="500" data-center="0"
						data-slides-per-view="1">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<blockquote class="latest-review">
									<div class="text">"Lorem ipsum dolor sit amet,
										consectetur adipiscing elit, sed do eiusmod tempor incididunt
										ut labore et dolore magna aliqua. Ut enim ad minim veniam,
										quis nostrud exercitation"</div>
									<footer>
										<cite>Helen Smith</cite>, 25 minutes ago
									</footer>
								</blockquote>
							</div>
							<div class="swiper-slide">
								<blockquote class="latest-review">
									<div class="text">"Lorem ipsum dolor sit amet,
										consectetur adipiscing elit, sed do eiusmod tempor incididunt
										ut labore et dolore magna aliqua. Ut enim ad minim veniam,
										quis nostrud exercitation"</div>
									<footer>
										<cite>Helen Smith</cite>, 25 minutes ago
									</footer>
								</blockquote>
							</div>
							<div class="swiper-slide">
								<blockquote class="latest-review">
									<div class="text">"Lorem ipsum dolor sit amet,
										consectetur adipiscing elit, sed do eiusmod tempor incididunt
										ut labore et dolore magna aliqua. Ut enim ad minim veniam,
										quis nostrud exercitation"</div>
									<footer>
										<cite>Helen Smith</cite>, 25 minutes ago
									</footer>
								</blockquote>
							</div>
						</div>
						<div class="pagination"></div>
					</div>
				</div>
			</div>
		</div>

</body>


