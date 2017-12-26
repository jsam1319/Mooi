<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
</style>
  <!-- LOADER -->
  <div id="loader-wrapper">
    <div class="bubbles">
      <div class="title">loading</div>
      <span></span> <span id="bubble2"></span> <span id="bubble3"></span>
    </div>
  </div>
 
  <div class="content-push">

    <div class="breadcrumb-box">
      <a href="/">Home</a> <a href="/product/research/110">공구 조사</a>
    </div>

    <div class="information-blocks">
      <div class="row">
        <div class="col-md-9 col-md-push-3 col-sm-8 col-sm-push-4">

          <input type="hidden" id="loginMemberNo" value="${no}">
          <input type="hidden" id="category" value="${category}">
          
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

          <!-- Product List -->
          <div class="row shop-grid grid-view researchView"></div>

          <div class="page-selector">
              <a class="moreView"><i class="fa fa-angle-down"></i></a>
            <div class="pages-box">
              <a href="#" class="square-button"><i
                class="fa fa-angle-up"></i></a>
            </div>
            <div class="clear"></div>
          </div>
          <!-- /.Product List -->
          
        </div>
        


        <!-- modal -->
        <div class="modal" id="gpurchaseInfo">
          <div class="modal-dialog modal-sm">
            <div class="modal-content"></div>
          </div>
        </div>
        <!-- /.modal -->



        <!-- Left Side Menu -->
        <div class="col-md-3 col-md-pull-9 col-sm-4 col-sm-pull-8 blog-sidebar">
          <div class="information-blocks categories-border-wrapper">
            <div class="block-title size-3">Categories</div>
            <div class="enterContent-2"></div>
                <div class="article-container style-1">
                <ul>
                    <li><a href="/product/research/110"> COAT</a></li>
                    <li><a href="/product/research/120"> JACKET</a></li>
                    <li><a href="/product/research/130"> DRESS</a></li>
                    <li><a href="/product/research/140"> KNIT</a></li>
                    <li><a href="/product/research/150"> SWEATSHIRT</a></li>
                    <li><a href="/product/research/210"> SKIRT</a></li>
                    <li><a href="/product/research/220"> SHORT PANTS</a></li>
                    <li><a href="/product/research/230"> PANTS</a></li>
                    </ul>
                </div>
          </div>
        </div>
        <!-- /.Left Side Menu -->
      </div>
    </div>
  </div>

  <div class="clear"></div>


  <script src="/resources/js/gpurchase/research.js"></script>
  <link href="/resources/css/gpurchase.css" rel="stylesheet" type="text/css"></link>
</body>
