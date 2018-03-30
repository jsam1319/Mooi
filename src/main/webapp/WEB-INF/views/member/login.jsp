<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="/resources/js/rsa.js"></script>
<script src="/resources/js/jsbn.js"></script>
<script src="/resources/js/prng4.js"></script>
<script src="/resources/js/rng.js"></script>

</head>

<body class="style-10">
        <div class="information-blocks">
            <div class="row">
                <div class="col-sm-6 information-entry" >
                    <div class="login-box">
                        <div class="article-container style-1">
                            <h3>로그인</h3>
                        </div>
                         <form action="/member/login" method="post" class="form">
                            <input type="hidden" name="modulus" id="modulus">
                           	<input type="hidden" name="exponent" id="exponent">
                            
                            <label>ID</label> <input class="simple-field" type="text" name="id" placeholder="Enter Email Address" value="" /> <label>Password</label>
                            <input class="simple-field" type="password" id="password" name="password" placeholder="Enter Password" value="" />
                            <div class="row">
	                            <label class="col-sm-6 checkbox-entry">
                                      <input type="checkbox" value="true" name="isAutoLogin"/> <span class="check"></span> 자동로그인
                                 </label>
	                            <div class="col-sm-6">
	                            <p class="text-right"><button type="submit" class="button style-10" style=""> LOGIN </button></p>
	                          	</div>
                          	</div><%--./row--%>
                        </form> 
                    </div>
                </div>	
                <div class="col-sm-6 information-entry">
                    <div class="login-box">
                        <div class="article-container style-1">
                            <h3>회원가입</h3>
                            <p>아직 회원이 아니세요?</p>
                            <p>회원님들을 위한 다양하고 특별한 혜택이 준비되어 있습니다.</p>
                        </div>
                        <a class="button style-12" href="/member/privacy">REGIST</a>
                    </div>
                </div>
            </div><%-- ./row --%>
            <br>
            
           </div><%-- ./information-blocks --%>
           
          <div></div>
<script>
$(document).ready(function() {
	$("#modulus").val("${Modulus}");
	$("#exponent").val("${Exponent}");
	
	$("button[type='submit']").click(function(event) {
		var rsa = new RSAKey();
	    rsa.setPublic($('#modulus').val(),$('#exponent').val());
	    
	    $("#password").val(rsa.encrypt($("#password").val()));
	    
	    return true;
	})
});


</script>        
</body>
