<%--  <%@page import="kr.or.kosta.semicolon.member.domain.Member"%> --%>
<%@ page language="java" contentType="charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
  uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
  content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no, minimal-ui" />
<meta name="description" content="쥬얼리 쇼핑몰 Mooi 입니다!">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="shortcut icon" href="/resources/img/logo/favicon.ico" type="image/x-icon"> 
<link rel="icon" href="/resources/img/logo/favicon.ico" type="image/x-icon">
  
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/idangerous.swiper.css" rel="stylesheet" type="text/css" />

<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700%7CDancing+Script%7CMontserrat:400,700%7CMerriweather:400,300italic%7CLato:400,700,900' rel='stylesheet' type='text/css' />
<link href="/resources/css/style.css" rel="stylesheet" type="text/css" />


<script src="/resources/js/jquery-2.1.3.min.js"></script>
<script src="/resources/js/bootstrap.js"></script> 
<script src="/resources/js/idangerous.swiper.min.js"></script>
<script src="/resources/js/global.js"></script>

<!-- custom scrollbar -->
<script src="/resources/js/jquery.mousewheel.js"></script>
<script src="/resources/js/jquery.jscrollpane.min.js"></script>


<title><decorator:title default="Mooi (무이)" /></title>
<decorator:head />

<style>
.submenu_img {
	width : 100%;
	height : 100%;
}

.fa-align-justify {
	margin-top: 15px;
	margin-bottom: 15px;
}

footer.type-2 {
	padding : 35px 0 70px 0;
}

.copyright {
	margin-bottom : 0px
}

</style>

</head>
<body>
    <div id="content-block">
        <div class="content-center fixed-header-margin">
            <!-- HEADER -->
            <div class="header-wrapper style-17">
                <header class="type-1">
                    <div class="header-top">
                        
                        <div class="header-top-entry hidden-xs">
                            <div class="title"><i class="fa fa-phone"></i>Call Service Center <a href="tel:+821098072280"><b>010. 9807. 2280</b></a></div>
                        </div>
                        <div class="socials-box">
                            <a href="https://www.facebook.com/mooikr/"><i class="fa fa-facebook"></i></a>
                            <a href="https://www.instagram.com/mooi.kr/"><i class="fa fa-instagram"></i></a>
                        </div>
                        <div class="menu-button responsive-menu-toggle-class"><i class="fa fa-align-justify"></i></div>
                        <div class="clear"></div>
                    </div>

                    <div class="header-middle">
                        <div class="logo-wrapper">
                            <a id="logo" href="/"><img src="/resources/img/logo/Logo.png" alt="" /></a>
                        </div>

                        <div class="middle-entry">
                           <!--  <div class="search-box">
                                <form>
                                    <div class="search-button">
                                        <i class="fa fa-search" style="color : white"></i>
                                        <input type="submit" />
                                    </div>
                                    <div class="search-drop-down">
                                        <div class="title"><span>All categories</span><i class="fa fa-angle-down"></i></div>
                                        <div class="list">
                                            <div class="overflow">
                                                <div class="category-entry">Category 1</div>
                                                <div class="category-entry">Category 2</div>
                                                <div class="category-entry">Category 2</div>
                                                <div class="category-entry">Category 4</div>
                                                <div class="category-entry">Category 5</div>
                                                <div class="category-entry">Lorem</div>
                                                <div class="category-entry">Ipsum</div>
                                                <div class="category-entry">Dollor</div>
                                                <div class="category-entry">Sit Amet</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="search-field">
                                        <input type="text" value="" placeholder="Search for product" />
                                    </div>
                                </form>
                            </div> -->
                        </div>

                        <div class="right-entries">
                            <!-- <a class="header-functionality-entry open-search-popup" href="#"><i class="fa fa-search"></i><span>Search</span></a> -->
							<c:choose>
								<c:when test="${login != null}">
									<a class="header-functionality-entry" href="/member/logout"><i class="fa fa-sign-out""></i><span>Logout</span></a>
								</c:when>
								<c:otherwise>
									<a class="header-functionality-entry" href="/order/nonMemberForm"><i class="fa fa-eye"></i><span>비회원 주문 조회</span></a>
									<a class="header-functionality-entry" href="/member/loginForm"><i class="fa fa-sign-in"></i><span>Login</span></a>
								</c:otherwise>
							</c:choose>                            
                            
                            <c:choose>
								<c:when test="${login == -1}">
									<a class="header-functionality-entry" href="/admin/"><i class="fa fa-unlock"></i><span>Admin</span></a>
								</c:when>
								<c:when test="${login >= 1}">
									<a class="header-functionality-entry" href="/member/mypage"><i class="fa fa-user" aria-hidden="true"></i><span>My Page</span></a>
								</c:when>
								<c:otherwise>
									<a class="header-functionality-entry" href="/member/privacy"><i class="fa fa-user-plus"></i><span>Regist</span></a>
								</c:otherwise>
							</c:choose> 
                            	<a class="header-functionality-entry" href="/cart/listForm"><i class="fa fa-shopping-cart"></i><span>My Cart</span></a>
                           <!--  <a class="header-functionality-entry open-cart-popup" href="/cart"><i class="fa fa-shopping-cart"></i><span>My Cart</span> <b>$255,99</b></a> -->
                        </div>

                    </div>

                    <div class="close-header-layer"></div>
                    <div class="navigation">
                        <div class="navigation-header responsive-menu-toggle-class">
                            <div class="title">Navigation</div>
                            <div class="close-menu"></div>
                        </div>
                        <div class="nav-overflow">
                            <nav>
                                <ul>
                                 <li class="full-width">
                                 	<a href="/product/listForm/110" class="">EARRING</a><!-- <i class="fa fa-chevron-down"></i> -->
                                 </li>
                                 <li class="full-width">
                                 	<a href="/product/listForm/120" class="">PIERCING</a><!-- <i class="fa fa-chevron-down"></i> -->
                                 </li>
                                 <li class="full-width">
                                 	<a href="/product/listForm/210" class="">NECKLACE</a><!-- <i class="fa fa-chevron-down"></i> -->
                                 </li>
                                 <li class="full-width">
                                 	<a href="/product/listForm/220" class="">BRACELET</a><!-- <i class="fa fa-chevron-down"></i> -->
                                 </li>
                                 <li class="full-width">
                                 	<a href="/product/listForm/310" class="">RING</a><!-- <i class="fa fa-chevron-down"></i> -->
                                 </li>
                                 <li class="full-width">
                                 	<a href="/product/listForm/410" class="">HAIR ITEM</a><!-- <i class="fa fa-chevron-down"></i> -->
                                 </li>
                                 <li class="full-width">
                                 	<a href="/product/listForm/0" class="">ETC</a><!-- <i class="fa fa-chevron-down"></i> -->
                                 </li>
                                   
                                    <li class="simple-list">
                                        <a>More</a><i class="fa fa-chevron-down"></i>
                                        <div class="submenu">
                                            <ul class="simple-menu-list-column">
                                                <li><a ><i class="fa fa-angle-right"></i>작업중입니다.</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>

                               <!--  <ul>
                                    <li><a href="#">Buy this theme</a></li>
                                    <li class="fixed-header-visible">
                                        <a class="fixed-header-square-button" href="/cart/listForm"><i class="fa fa-shopping-cart"></i></a>
                                        <a class="fixed-header-square-button open-search-popup"><i class="fa fa-search"></i></a>
                                    </li>
                                </ul> -->
                                <div class="clear"></div>

                                <a class="fixed-header-visible additional-header-logo" href="/"><img src="/resources/img/logo/Logo.png" alt=""/></a>
                            </nav>
                            <div class="navigation-footer responsive-menu-toggle-class">
                                <!-- <div class="socials-box">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a>
                                    <a href="#"><i class="fa fa-youtube"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-pinterest-p"></i></a>
                                    <div class="clear"></div>
                                </div> -->
                                <div class="navigation-copyright">Created by <a href="#">8theme</a>. All rights reserved</div>
                            </div>
                        </div>
                    </div>
                </header>
                <div class="clear"></div>
            </div>




      <!-- content -->
      <decorator:body></decorator:body>
    
    
    
    	</div>
    </div>
        <!-- FOOTER -->
        <div class="footer-wrapper style-5 style-7" style="margin-top : 50px">
            <footer class="type-2">
                <div class="position-center">
                    <img id="footerLogo" class="footer-logo" src="/resources/img/logo/FooterLogo.png" style="width : 30%; height : 30%; margin-top: 0px"alt="" />
                    <div class="copyright">소재지 : 충북 청주시 상당구 탑동로32번길 23, 삼원빌라 203호 / 회사명 : 무이 / 대표 : 김지선 / 사업자 번호 : 402-28-05336</div>
                    <div class="copyright">통신판매신고번호 : 제 2017-충북청주-1122호 / 개인정보보호책임자 : 김지선 / 고객지원센터 : 010-9807-2280 </div>
                    <div class="copyright">E-mail : <a href="mailto:lnh02262003@naver.com">lnh02262003@naver.com</a> </div>
                </div>
            </footer>
        </div>
                <!-- <div class="footer-wrapper style-17">
                    <footer class="type-1">
                        <div class="footer-columns-entry">
                            <div class="row">
                                <div class="col-md-3">
                                    <img class="footer-logo" style="width : 270px; height:140px;" src="/resources/img/logo/Logo.png" alt="" />
                                    <div class="footer-address">충북 청주시 상당구 탑동로32번길 23,<br> 삼원빌라 302호<br/>
                                        연락처 : 010. 9807. 2280<br/>
                                        이메일 : <a href="mailto:lnh02262003@naver.com">lnh02262003@naver.com</a><br/>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="col-md-2 col-sm-4">
                                    <h3 class="column-title">Our Services</h3>
                                    <ul class="column">
                                        <li><a href="#">About us</a></li>
                                        <li><a href="#">Order History</a></li>
                                        <li><a href="#">Returns</a></li>
                                        <li><a href="#">Custom Service</a></li>
                                        <li><a href="#">Terms &amp; Condition</a></li>
                                        <li><a href="#">Order History</a></li>
                                        <li><a href="#">Returns</a></li>
                                    </ul>
                                    <div class="clear"></div>
                                </div>
                                <div class="col-md-2 col-sm-4">
                                    <h3 class="column-title">Our Services</h3>
                                    <ul class="column">
                                        <li><a href="#">About us</a></li>
                                        <li><a href="#">Order History</a></li>
                                        <li><a href="#">Returns</a></li>
                                        <li><a href="#">Custom Service</a></li>
                                        <li><a href="#">Terms &amp; Condition</a></li>
                                        <li><a href="#">Order History</a></li>
                                        <li><a href="#">Returns</a></li>
                                    </ul>
                                    <div class="clear"></div>
                                </div>
                                <div class="col-md-2 col-sm-4">
                                    <h3 class="column-title">Our Services</h3>
                                    <ul class="column">
                                        <li><a href="#">About us</a></li>
                                        <li><a href="#">Order History</a></li>
                                        <li><a href="#">Returns</a></li>
                                        <li><a href="#">Custom Service</a></li>
                                        <li><a href="#">Terms &amp; Condition</a></li>
                                        <li><a href="#">Order History</a></li>
                                        <li><a href="#">Returns</a></li>
                                    </ul>
                                    <div class="clear"></div>
                                </div>
                                <div class="clearfix visible-sm-block"></div>
                                <div class="col-md-3">
                                    <h3 class="column-title">Company working hours</h3>
                                    <div class="footer-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.</div>
                                    <div class="footer-description">
                                        <b>Monday-Friday:</b> 8.30 a.m. - 5.30 p.m.<br/>
                                        <b>Saturday:</b> 9.00 a.m. - 2.00 p.m.<br/>
                                        <b>Sunday:</b> Closed
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </div>
                        <div class="footer-bottom-navigation">
                            <div class="cell-view">
                                <div class="footer-links">
                                    <a href="#">Site Map</a>
                                    <a href="#">Search</a>
                                    <a href="#">Terms</a>
                                    <a href="#">Advanced Search</a>
                                    <a href="#">Orders and Returns</a>
                                    <a href="#">Contact Us</a>
                                </div>
                                <div class="copyright">Created with by <a href="#">8theme</a>. All right reserved</div>
                            </div>
                            <div class="cell-view">
                                <div class="payment-methods">
                                    <a href="#"><img src="/resources/img/payment-method-1.png" alt="" /></a>
                                    <a href="#"><img src="/resources/img/payment-method-2.png" alt="" /></a>
                                    <a href="#"><img src="/resources/img/payment-method-3.png" alt="" /></a>
                                    <a href="#"><img src="/resources/img/payment-method-4.png" alt="" /></a>
                                    <a href="#"><img src="/resources/img/payment-method-5.png" alt="" /></a>
                                    <a href="#"><img src="/resources/img/payment-method-6.png" alt="" /></a>
                                </div>
                            </div>
                        </div>
                    </footer>
                </div> -->
            </div>
        <div class="clear"></div>
	</div>

    <div class="search-box popup">
        <form>
            <div class="search-button">
                <i class="fa fa-search"></i>
                <input type="submit" />
            </div>
            <div class="search-drop-down">
                <div class="title"><span>All categories</span><i class="fa fa-angle-down"></i></div>
                <div class="list">
                    <div class="overflow">
                        <div class="category-entry">Category 1</div>
                        <div class="category-entry">Category 2</div>
                        <div class="category-entry">Category 2</div>
                        <div class="category-entry">Category 4</div>
                        <div class="category-entry">Category 5</div>
                        <div class="category-entry">Lorem</div>
                        <div class="category-entry">Ipsum</div>
                        <div class="category-entry">Dollor</div>
                        <div class="category-entry">Sit Amet</div>
                    </div>
                </div>
            </div>
            <div class="search-field">
                <input type="text" value="" placeholder="Search for product" />
            </div>
        </form>
    </div>

    <div class="cart-box popup">
        <div class="popup-container">
            <div class="cart-entry">
                <a class="image"><img src="/resources/img/product-menu-1.jpg" alt="" /></a>
                <div class="content">
                    <a class="title" href="#">Pullover Batwing Sleeve Zigzag</a>
                    <div class="quantity">Quantity: 4</div>
                    <div class="price">$990,00</div>
                </div>
                <div class="button-x"><i class="fa fa-close"></i></div>
            </div>
            <div class="cart-entry">
                <a class="image"><img src="/resources/img/product-menu-1_.jpg" alt="" /></a>
                <div class="content">
                    <a class="title" href="#">Pullover Batwing Sleeve Zigzag</a>
                    <div class="quantity">Quantity: 4</div>
                    <div class="price">$990,00</div>
                </div>
                <div class="button-x"><i class="fa fa-close"></i></div>
            </div>
            <div class="summary">
                <div class="subtotal">Subtotal: $990,00</div>
                <div class="grandtotal">Grand Total <span>$1029,79</span></div>
            </div>
            <div class="cart-buttons">
                <div class="column">
                    <a class="button style-3">view cart</a>
                    <div class="clear"></div>
                </div>
                <div class="column">
                    <a class="button style-4">checkout</a>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
   <div id="product-popup" class="overlay-popup">
        <div class="overflow">
            <div class="table-view">
                <div class="cell-view">
                    <div class="close-layer"></div>
                    <div class="popup-container">

                        <div class="row">
                            <div class="col-sm-6 information-entry">
                                <div class="product-preview-box">
                                    <div class="swiper-container product-preview-swiper" data-autoplay="0" data-loop="1" data-speed="500" data-center="0" data-slides-per-view="1">
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide">
                                                <div class="product-zoom-image">
                                                    <img src="/resources/img/product-main-1.jpg" alt="" data-zoom="/resources/img/product-main-1-zoom.jpg" />
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product-zoom-image">
                                                    <img src="/resources/img/product-main-2.jpg" alt="" data-zoom="/resources/img/product-main-2-zoom.jpg" />
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product-zoom-image">
                                                    <img src="/resources/img/product-main-3.jpg" alt="" data-zoom="/resources/img/product-main-3-zoom.jpg" />
                                                </div>
                                            </div>
                                            <div class="swiper-slide">
                                                <div class="product-zoom-image">
                                                    <img src="/resources/img/product-main-4.jpg" alt="" data-zoom="/resources/img/product-main-4-zoom.jpg" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="pagination"></div>
                                        <div class="product-zoom-container">
                                            <div class="move-box">
                                                <img class="default-image" src="/resources/img/product-main-1.jpg" alt="" />
                                                <img class="zoomed-image" src="/resources/img/product-main-1-zoom.jpg" alt="" />
                                            </div>
                                            <div class="zoom-area"></div>
                                        </div>
                                    </div>
                                    <div class="swiper-hidden-edges">
                                        <div class="swiper-container product-thumbnails-swiper" data-autoplay="0" data-loop="0" data-speed="500" data-center="0" data-slides-per-view="responsive" data-xs-slides="3" data-int-slides="3" data-sm-slides="3" data-md-slides="4" data-lg-slides="4" data-add-slides="4">
                                            <div class="swiper-wrapper">
                                                <div class="swiper-slide selected">
                                                    <div class="paddings-container">
                                                        <img src="/resources/img/product-main-1.jpg" alt="" />
                                                    </div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div class="paddings-container">
                                                        <img src="/resources/img/product-main-2.jpg" alt="" />
                                                    </div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div class="paddings-container">
                                                        <img src="/resources/img/product-main-3.jpg" alt="" />
                                                    </div>
                                                </div>
                                                <div class="swiper-slide">
                                                    <div class="paddings-container">
                                                        <img src="/resources/img/product-main-4.jpg" alt="" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pagination"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 information-entry">
                                <div class="product-detail-box">
                                    <h1 class="product-title">T-shirt Basic Stampata</h1>
                                    <h3 class="product-subtitle">Loremous Clothing</h3>
                                    <div class="rating-box">
                                        <div class="star"><i class="fa fa-star"></i></div>
                                        <div class="star"><i class="fa fa-star"></i></div>
                                        <div class="star"><i class="fa fa-star"></i></div>
                                        <div class="star"><i class="fa fa-star-o"></i></div>
                                        <div class="star"><i class="fa fa-star-o"></i></div>
                                        <div class="rating-number">25 Reviews</div>
                                    </div>
                                    <div class="product-description detail-info-entry">Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur.</div>
                                    <div class="price detail-info-entry">
                                        <div class="prev">$90,00</div>
                                        <div class="current">$70,00</div>
                                    </div>
                                    <div class="size-selector detail-info-entry">
                                        <div class="detail-info-entry-title">Size</div>
                                        <div class="entry active">xs</div>
                                        <div class="entry">s</div>
                                        <div class="entry">m</div>
                                        <div class="entry">l</div>
                                        <div class="entry">xl</div>
                                        <div class="spacer"></div>
                                    </div>
                                    <div class="color-selector detail-info-entry">
                                        <div class="detail-info-entry-title">Color</div>
                                        <div class="entry active" style="background-color: #d23118;">&nbsp;</div>
                                        <div class="entry" style="background-color: #2a84c9;">&nbsp;</div>
                                        <div class="entry" style="background-color: #000;">&nbsp;</div>
                                        <div class="entry" style="background-color: #d1d1d1;">&nbsp;</div>
                                        <div class="spacer"></div>
                                    </div>
                                    <div class="quantity-selector detail-info-entry">
                                        <div class="detail-info-entry-title">Quantity</div>
                                        <div class="entry number-minus">&nbsp;</div>
                                        <div class="entry number">10</div>
                                        <div class="entry number-plus">&nbsp;</div>
                                    </div>
                                    <div class="detail-info-entry">
                                        <a class="button style-10">Add to cart</a>
                                        <a class="button style-11"><i class="fa fa-heart"></i> Add to Wishlist</a>
                                        <div class="clear"></div>
                                    </div>
                                    <div class="tags-selector detail-info-entry">
                                        <div class="detail-info-entry-title">Tags:</div>
                                        <a href="#">bootstrap</a>/
                                        <a href="#">collections</a>/
                                        <a href="#">color/</a>
                                        <a href="#">responsive</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="close-popup"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="fb-customerchat"
		 page_id="1907644406222485"
		 logged_in_greeting="안녕하세요 쥬얼리 쇼핑몰 Mooi 입니다!"
		 logged_out_greeting="안녕하세요 쥬얼리 쇼핑몰 Mooi 입니다!">
	</div>
    
<script>

window.fbAsyncInit = function() {
  FB.init({
    appId            : '161739444417263',
    autoLogAppEvents : true,
    xfbml            : true,
    version          : 'v2.12'
  });
};

(function(d, s, id){
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement(s); js.id = id;
   js.src = "https://connect.facebook.net/ko_KR/sdk.js";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'));


var _ismobile = navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPod/i);


$(document).ready(function() {
	if(_ismobile) {
		$("#footerLogo").css("width", "50%");
		$("#footerLogo").css("height", "50%");
	}
	
})

</script>    
       
</body>
</html>
