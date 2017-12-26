<%@ page language="java" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<head>

<style>
	.information-blocks {
    margin-left:15%;
    margin-right:15%;
	}
	
	.red-span{
		color: #FF0000;
	}
</style>

 <%-- 주소 API --%>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
      function daumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                  var extraRoadAddr = ''; // 도로명 조합형 주소 변수
  
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraRoadAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraRoadAddr !== ''){
                      extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }
                  // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                  if(fullRoadAddr !== ''){
                      fullRoadAddr += extraRoadAddr;
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('address').value = fullRoadAddr;
                   document.getElementById('address').removeAttribute('disabled');
                   document.getElementById('postcode').removeAttribute('disabled');
                  document.getElementById('guide').innerHTML = '(상세주소를 추가 입력해주세요. 예 : 101동 101호)'; 
                  
              }
          }).open();
      }
	</script>
	
	<script>
	$(document).ready(function(){
	   $("#password2").keyup(function(){
	   		check($("#password2").val());
	   }) ;
	   
	   
	   $("#ckId").click(function(){
	      var id = $(".id").val();
	      $.ajax({
	          url : "/member/regist/"+id,
	          type : "get",
	          success : function(data){
	              if(data == 'possible'){ 
	                  $("#id-span").html("사용가능한 아이디 입니다.");
	              }
	              else{
	                  $("#id-span").html("불가능한 아이디 입니다.");
	              }
	          },
	          error : function(xhr, statusText){
	              console.log("("+xhr.status+", "+statusText+")");
	              alert("사용불가능한 아이디 입니다.");
	          }
	      }); 
	   });
	});
	
	var check = function(data){
	   if(data != $("#password1").val()){
	       $(".pw-span").html("비밀번호가 일치하지 않습니다.");
	   } 
	   else{
	       $(".pw-span").html("");
	   }
	}
	</script>
</head>

<body class="style-10">
        <div class="information-blocks">
            <div class="row">
                <div class="col-sm-10 information-entry">
                    <div class="regist-box">
                        <div class="article-container style-1">
                            <h3>New Customers</h3>
                            
                            <form action="/member/regist" method="POST" class="form">
                            		<label>ID</label>
                            		<div class="row">
	                            		<div class="col-sm-8 form-group">
	                            			<input class="simple-field id" type="text" name="id" placeholder="ID" required/>
	                            		</div>
	                            		<div class="col-sm-2 form-group">
		                            			<input class="button style-10" type="button" id="ckId" value="중복체크"/>
		                            	</div>
	                            	</div>
	                            	<span id="id-span" class="red-span"></span>
                            	
                            		<br>
                            		<div class="row" >
                            			<div class="col-sm-6">
                            				<label>PASSWORD</label>
	                            			<input class="simple-field" type="password" name="password1" id="password1" placeholder="PASSWORD" required/>
	                            		</div>
	                            			
	                            		<div class="col-sm-6">
	                            			<label>CONFIRM PASSWORD</label>
	                            			<input class="simple-field" type="password" name="password" id="password2" placeholder="PASSWORD" required/>
	                            		</div>
                            		</div>
                            		<span class="pw-span red-span"></span>
                            		<br>
                            		
                            		<label>NAME</label>
                            		<input class="simple-field" type="text" name="name" placeholder="NAME" required/>
                            		
                            		<label>EMAIL</label>
	                            	<input class="simple-field" type="email" name="email" placeholder="EMAIL" required/>
	                            	
                            		<label>ADDTRESS</label>
									<div class="row">
										<div class="col-sm-4 form-group">
											<input type="text" class="simple-field" id="postcode" name="postcode" required disabled>
										</div>
										<div class="col-sm-2 form-group">
											<input type="button" onclick="daumPostcode()" value="우편번호 찾기" class="button style-10"><br>
										</div>
		
									</div>
									<%-- /.row --%>
									<div class="row">
										<div class="col-sm-12 form-group">
											<input type="text" class="simple-field" id="address" name="address" disabled required>
											<span id="guide" style="color: #999" class="red-span"></span>
										</div>
									<%-- /.row --%>
                            		
                            		
                            		<div class="row">
	                            		<div class="col-sm-6 form-group">
		                            		<label>AGE</label>
		                            		<input class="simple-field" type="text" name="age" placeholder="AGE" required/>
		                            	</div> 
		                            	<div class="col-sm-6 form-group">
		                            		<label>PHONE</label>
		                            		<input class="simple-field" type="tel" name="phone" placeholder="PHONE" required/>
										</div>
									</div> 
									
									<br>
									<label>GENDER</label>
									<div class="row">
										<div class="col-sm-6 form-group">
											<label class="checkbox-entry radio">
		                                         <input type="radio" name="gender" value="female"> <span class="check"></span> 여
		                                    </label>
	                                    </div>
	                                    <div class="col-sm-6 form-group">
		                                    <label class="checkbox-entry radio">
		                                         <input type="radio" name="gender" value="male"> <span class="check"></span> 남
		                                    </label>
	                                    </div>
									</div>
									
									<hr>
								<button type="submit" class="button style-12" style="text-align: center">Register Account</button>
                            	
                        	</form>
                        	
                        </div>
                    </div><!-- ./regist-box -->
                </div><!-- ./information-entry-->
            </div><!-- ./row -->
           </div><!-- ./information-blocks -->
           
          <div></div>
        
</body>
</html>
