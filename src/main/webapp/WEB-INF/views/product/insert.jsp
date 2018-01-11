<%@ page language="java" pageEncoding="UTF-8"%>
 
<head>

<link href="/resources/summernote/summernote.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/bootstrap-imageupload.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/jquery.tag-editor.css" rel="stylesheet" type="text/css" />

<script src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script src="/resources/summernote/summernote.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<script src="/resources/js/bootstrap-imageupload.js"></script>
<script src="/resources/js/jquery.tag-editor.js"></script>

<style type="text/css">
.modal-backdrop {
	z-index: 0;

}
	.tag-editor { background: #fafafa; font-size: 12px; }
	.tag-editor .tag-editor-tag {
	    color: #fff; background: #555;
	    border-radius: 2px;
	}
	.tag-editor .tag-editor-spacer { width: 7px; }
	.tag-editor .tag-editor-delete { display: none; }

</style>

</head>

<body class="style-10">
            <div class="content-push">
                <div class="contact-spacer"></div>
                <div class="information-blocks">
                    <div class="row">
                    <form id="registerForm" role="form" enctype="multipart/form-data" method="post" action="/product/insert">
                        <div class="col-md-12 information-entry">
                            <h3 class="block-title main-heading">상품 등록</h3>
                                <div class="row">
                                	<div class="col-sm-6">
                                          <label>상품 제목 <span>*</span></label>
                                          <input class="simple-field" type="text" name="name"/>
                                          <div class="clear"></div>
                                 	</div>
                                 	<div class="col-sm-6">
                                          <label>상품 부제목 <span>*</span></label>
                                          <input class="simple-field" type="text" name="subName"/>
                                          <div class="clear"></div>
                                 	</div>
                             	</div>
                             	 <div class="row">
                                     <div class="col-sm-6">
	                             			<label>상품 카테고리<span>*</span></label>
	                             			<select class="simple-field" name="categoryNo">
	                             				<option value="110">EARRING</option>
	                             				<option value="120">PIERCING</option>
	                             				<option value="210">NECKLACE</option>
	                             				<option value="220">BRACELET</option>
	                             				<option value="310">RING</option>
	                             				<option value="410">HAIR_ITEM</option>
	                             				<option value="0">ETC</option>
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
                                        <input class="simple-field" type="number" name="cost" required />
                                      	<div class="clear"></div>
                             		</div>
                             	</div>
                             	
                             	<div class="row">
                             		<div class="col-sm-12" style="margin-bottom: 20px">
                                      	<label>키워드</label>
                                        <input class="simple-field" type="text" id="keyword" name="keywordString"/>
                                      	<div class="clear"></div>
                             		</div>
                             	</div>
                             	
                             	<div class="imageupload panel panel-default" id="imageupload">
								    <div class="panel-heading clearfix">
								        <h3 class="panel-title pull-left">FRONT 이미지 업로드</h3>
								        <div class="btn-group pull-right">
								            <button type="button" class="btn btn-default active">File</button>
								            <button type="button" class="btn btn-default">URL</button>
								        </div>
								    </div>
								    
								    <div class="file-tab panel-body">
								        <label class="btn btn-default btn-file">
								            <span style="font-size: 14px; line-height: 14px; font-weight: 400; text-align: center; color: #313131;
								             margin-bottom: 7px; padding-top: 5px;">Browse</span>
								            <!-- The file is stored here. -->
								            <input type="file" name="image">
								        </label>
								        <button type="button" class="btn btn-default">Remove</button>
								    </div>
								    <div class="url-tab panel-body">
								        <div class="input-group">
								            <input type="text" class="form-control" placeholder="Image URL">
								            <div class="input-group-btn">
								                <button type="button" class="btn btn-default">Submit</button>
								            </div>
								        </div>
								        <button type="button" class="btn btn-default">Remove</button>
								        <!-- The URL is stored here. -->
								        <input type="hidden" name="image-url">
								    </div>
								</div>
                             	
                             	<div id="summernote"></div>
                              	<textarea id="noteArea" name="content" style="display:none;"></textarea>
                              	<div id="imageButtonDiv">
			                      	<a class="button style-10">등록<input type="submit" id="submitBtn" value="" /></a>
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
	$("#keyword").tagEditor();
	
	$('#imageupload').imageupload({
	    allowedFormats: [ 'jpg' ],
	    maxFileSizeKb: 2048
	});
	
	$('#summernote').summernote({
		lang : 'ko-KR',
		height: 500,
		fontNames: ['D2Coding Regular',  'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
		fontNamesIgnoreCheck: ['D2Coding Regular'],
		callbacks: {
      		onImageUpload: function(files, editor, welEditable) {
          		for (var i = files.length - 1; i >= 0; i--) {
            		sendFile(files[i], this);
          		}
        	}
      	}
	});
	
	$("#submitBtn").click(function() {
		copyContent();
	})
	
	function copyContent() {
		$("#noteArea").val($("#summernote").summernote('code'));
	}
	
	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		
	    $.ajax({
	    	data: form_data,
	        type: "POST",
	        url: '/image/body',
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        success: function(url) {
	         	$(el).summernote('editor.insertImage', "/resources/upload/" + url, function($image) {
	         		$image.css('width', '480px');	
	         		$image.css('height', 'auto');
	         	});
	        }
	   });
	}
});
</script>


</body>





