<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/textForm.jsp" %>

<%
	//QnABoard qnaBoard = (QnABoard)request.getSession().getAttribute("qnaBoard");
	String qnaBoard_id = request.getParameter("qnaBoard_id");
	String qnaBoard_privacy_id = request.getParameter("qnaBoard_privacy_id");
	String qnaBoard_title = request.getParameter("qnaBoard_title");
	String qnaBoard_writer = request.getParameter("qnaBoard_writer");
	String qnaBoard_regdate = request.getParameter("qnaBoard_regdate");
	String qnaBoard_hit = request.getParameter("qnaBoard_hit");
	String qnaBoard_content = request.getParameter("qnaBoard_content");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Chimper &mdash; Colorlib Website Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="/chimper/chimper/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/chimper/chimper/css/bootstrap.min.css">
    <link rel="stylesheet" href="/chimper/chimper/css/magnific-popup.css">
    <link rel="stylesheet" href="/chimper/chimper/css/jquery-ui.css">
    <link rel="stylesheet" href="/chimper/chimper/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/chimper/chimper/css/owl.theme.default.min.css">

    <link rel="stylesheet" href="/chimper/chimper/css/bootstrap-datepicker.css">

    <link rel="stylesheet" href="/chimper/chimper/fonts/flaticon/font/flaticon.css">

    <link rel="stylesheet" href="/chimper/chimper/css/aos.css">

    <link rel="stylesheet" href="/chimper/chimper/css/style.css">

  </head>
  <style>
		input[type=text], select, textarea {
		  width: 100%;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  box-sizing: border-box;
		  margin-top: 6px;
		  margin-bottom: 16px;
		  resize: vertical;
		}
		
		input[type="button"] {
		  background-color: dodgerblue;
		  color: white;
		  padding: 14px 20px;
		  margin: 10px 0px;
		  border: none;
		  cursor: pointer;
		  width: 10%;
		}
		
		input[type="checkbox"]{
			width:20px;
			height:20px;
		}
  </style>
  <body>
  <div class="site-wrap">
    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>

<%@ include file="/chimper/chimper/commons/menuBar.jsp" %>

    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(/chimper/chimper/images/contact.png);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center text-center">

          <div class="col-md-12" data-aos="fade-up" data-aos-delay="400">
                        
            <div class="row justify-content-center mb-4">
              <div class="col-md-8 text-center">
                <h1>고객 센터</h1>
                <p class="lead mb-5">관리자에게 질문을 남기세요</p>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>  


    
     <div class="site-section bg-light">
      <div class="container">
        <div class="row">
			<h2>글 수정</h2>

			<div class="container">
			  <form>
			  <%if(member.getMemberLevel().getMember_level_id()==0){ %>
			  		<input type="checkbox" name="chb_privacy" onClick="privacy_check()" <%if(qnaBoard_privacy_id.equals("1")){ %>checked<%} %>> 비밀글
			  	<%} %>
			  	<input type="hidden" name="qnaBoard_privacy_id" value="<%=qnaBoard_privacy_id%>"/>
			  	<input type="hidden" name="qnaBoard_id" value="<%=qnaBoard_id %>"/>
			    <input type="text" name="qnaBoard_title" placeholder="Insert Title.." value="<%=qnaBoard_title%>" >
			    <input type="text" name="qnaBoard_writer" placeholder="Writer..." value="<%=qnaBoard_writer%>" readonly/>
			    <input type="text" name="qnaBoard_regdate" value="<%=qnaBoard_regdate%>" readonly/>
			    <input type="text" name="qnaBoard_hit" value="<%=qnaBoard_hit%>" readonly/>
			    <textarea id="content" name="qnaBoard_content" placeholder="Write something.." style="height:200px" ><%=qnaBoard_content %></textarea>
			
			    <input type="button" value="글 수정">
			    <input type="button" value="취소">
			
			  </form>
			  </div> 
        </div>
      </div>
    </div>

   <%@ include file="/chimper/chimper/commons/footer.jsp" %>
  </div>

  <script src="/chimper/chimper/js/jquery-3.3.1.min.js"></script>
  <script src="/chimper/chimper/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/chimper/chimper/js/jquery-ui.js"></script>
  <script src="/chimper/chimper/js/popper.min.js"></script>
  <script src="/chimper/chimper/js/bootstrap.min.js"></script>
  <script src="/chimper/chimper/js/owl.carousel.min.js"></script>
  <script src="/chimper/chimper/js/jquery.stellar.min.js"></script>
  <script src="/chimper/chimper/js/jquery.countdown.min.js"></script>
  <script src="/chimper/chimper/js/jquery.magnific-popup.min.js"></script>
  <script src="/chimper/chimper/js/bootstrap-datepicker.min.js"></script>
  <script src="/chimper/chimper/js/aos.js"></script>
  <script src="/chimper/chimper/js/main.js"></script>
<script>
	$(function(){
		$($("input[type='button']")[0]).click(function(){
			edit();
		});
		$($("input[type='button']")[1]).click(function(){
			cancelEdit();
		});
	});

	function edit(){
		//alert("글 수정 진행!!");
		$("form").attr({
			"method":"post",
			"action":"/qnaBoard/doUpdate"
		});
		$("form").submit();
	}

	function cancelEdit(){
		history.back();
	}

	// 체크박스 클릭시 값을 설정하는 함수
	function privacy_check(){
		var checkbox = $("input[type='checkbox']");
		if(checkbox.is(":checked")){
			$("input[name='qnaBoard_privacy_id']").val("1");
		}else{
			$("input[name='qnaBoard_privacy_id']").val("2");
		} 
	}
</script>

    
  </body>
</html>