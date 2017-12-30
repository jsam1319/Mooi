<%@ page language="java" pageEncoding="UTF-8"%>
 
<head>

<link href="/resources/summernote/summernote.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="/resources/summernote/summernote.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>


</head>

<body class="style-10">
            <div class="content-push">
                <div class="contact-spacer"></div>
                <div class="information-blocks">
                    <div class="row">
                    <form id="registerForm" role="form" method="post" action="/product/insert">
                        <div class="col-md-12 information-entry">
                            <h3 class="block-title main-heading">상품 등록</h3>
                                <div class="row">
                                	<div class="col-sm-6">
                                          <label>상품 이름 <span>*</span></label>
                                          <input class="simple-field" type="text" name="name"/>
                                          <div class="clear"></div>
                                 	</div>
                                     <div class="col-sm-6">
	                             			<label>상품 카테고리<span>*</span></label>
	                             			<select class="simple-field">
	                             				<option>option 1</option>
	                             				<option>option 2</option>
	                             				<option>option 3</option>
	                             			</select>
	                             			<div class="clear"></div>
	                             	</div>
                             	</div>
                             	<div class="row">
                             		<div class="col-sm-6">
                                      	<label>가격(￦) <span>*</span></label>
                                        <input class="simple-field" type="number" name="price" required />
                                      	<div class="clear"></div>
                             		</div>
                             		
                             		<div class="col-sm-6">
                                       	<label>원가(￦) <span>*</span></label>
                                        <input class="simple-field" type="number" name="price" required />
                                      	<div class="clear"></div>
                             		</div>
                             	</div>
                             	
                             	<div id="summernote"></div>
                              							
                              
                              
                              <div id="imageButtonDiv">
			                           <a class="button style-10">등록<input type="submit" id="" value="" /></a>
			                        </div>
			                        						
                        </div>
                        
                       </form>
                    </div>
                </div>
                <br><br>
            </div>
        <div class="clear"></div>  
<script>
$(document).ready(function() {
	$('#summernote').summernote({
		lang : 'ko-KR',
		height: 500,
		fontNames: ['D2Coding Regular',  'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
		fontNamesIgnoreCheck: ['D2Coding Regular']
	});
});
</script>


</body>





