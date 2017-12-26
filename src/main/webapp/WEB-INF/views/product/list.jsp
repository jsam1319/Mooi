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
      <a href="/">Home</a> <a href="/product/list/110">상품 목록</a>
    </div>

    <div class="information-blocks">
      <div class="row">
        <div class="col-md-9 col-md-push-3 col-sm-8 col-sm-push-4">

          <input type="hidden" id="loginMemberNo" value="${no}">
          <input type="hidden" id="category" value="${category}">

          <div class="information-blocks">
            <div class="tabs-container style-1">
              <div class="swiper-tabs tabs-switch">
                <div class="title">Gpurchase info</div>
                <div class="list">
                  <a class="tab-switcher active">진행중인 공구</a>
                   <a class="tab-switcher endTab">마감된 공구</a>
                  <div class="clear"></div>
                </div>
              </div>
              <div>


                <!-- /.ongoing Gpurchase -->
                <div class="tabs-entry ongoinGpurchase">
                  <!-- Top Menu -->
                  <div class="page-selector">
                    <div class="shop-grid-controls">
                      <div class="entry">
                        <div class="inline-text">Sorty by</div>
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
                  <div class="row shop-grid grid-view listView"></div>
                  <div class="page-selector">
                      <a class="moreView"><i
                        class="fa fa-angle-down"></i></a>
                    <div class="pages-box">
                      <a href="#" class="square-button"><i
                        class="fa fa-angle-up"></i></a>
                    </div>
                    <div class="clear"></div>
                  </div>
                  <!-- /.Gpurchase List -->
                </div>
                <!-- /.ongoing Gpurchase -->


                <!-- End Gpurchase -->
                <div class="tabs-entry">
                  <!-- Top Menu -->
                  <div class="page-selector">
                    <div class="shop-grid-controls">
                      <div class="entry">
                        <div class="inline-text">Sorty by</div>
                        <div class="simple-drop-down">
                          <select id="endproductOrder">
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
                  <div class="row shop-grid grid-view endlistView"></div>

                  <div class="page-selector">
                      <a class="endMoreView"><i
                        class="fa fa-angle-down"></i></a>
                    <div class="pages-box">
                      <a href="#" class="square-button"><i
                        class="fa fa-angle-up"></i></a>
                    </div>
                    <div class="clear"></div>
                  </div>
                  <!-- /.Gpurchase List -->
                </div>
              </div>
            </div>
          </div>
          <!-- /.End Gpurchase -->





        </div>



        <!-- Left Side Menu -->
        <div class="col-md-3 col-md-pull-9 col-sm-4 col-sm-pull-8 blog-sidebar">
          <div class="information-blocks categories-border-wrapper">
            <div class="block-title size-3">Categories</div>
            <div class="enterContent-2"></div>
                <div class="article-container style-1">
                <ul>
                    <li><a href="/product/list/110"> EARRING</a></li>
                    <li><a href="/product/list/120"> PIERCING</a></li>
                    <li><a href="/product/list/130"> NECKLACE</a></li>
                    <li><a href="/product/list/140"> BRACELET</a></li>
                    <li><a href="/product/list/150"> RING</a></li>
                    <li><a href="/product/list/210"> HAIR ITEM</a></li>
                    <li><a href="/product/list/220"> ETC</a></li>
                    <li><a href="/product/list/230"> ON SALE</a></li>
                    </ul>
                </div>
          </div>
        </div>
        <!-- /.Left Side Menu -->
      </div>
    </div>
  </div>

  <div class="clear"></div>


  <script src="/resources/js/gpurchase/list.js"></script>
  <link href="/resources/css/gpurchase.css" rel="stylesheet"
    type="text/css"></link>
</body>
</html>
