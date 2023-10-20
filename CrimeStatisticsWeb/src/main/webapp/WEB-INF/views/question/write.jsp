<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<title>질문 작성 </title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style>

	.speech-bubble {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	border: 1px solid #ccc;
	padding: 10px;
	max-width: 300px;
	z-index: 1;
	right:300px;		
	}

	.speech-bubble:after {
	content: "";
	position: absolute;
	bottom: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #f9f9f9 transparent transparent transparent;
	}

</style>
  
</head>
<body>
<header><%@ include file="../template/header.jsp"%></header>
  
<main class="container mt-5" style="margin:0 auto 50px;  width:900px;">    
	<form method="post" action="/question/write">
			
		<caption>
          <h2 style="text-align: center; padding:20px;">질문 등록</h2>   
        </caption>
        
			<p style="color: gray;">
				※ 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.
				<button type="button" class="layer_show" layer="copyright_law">[저작권법 안내]</button>
			</p>
			<div id="copyright-law-content" class="speech-bubble">
				<h3>저작권법 안내</h3>
				<p>이용자가 불법복제물을 게재, 유통하면 이에 대한 경고 및 불법복제물의 삭제 또는 전송 중단 조치를 할 수
					있으며, 경고를 받은 이용자에게 사용 정지를 할 수 있습니다. (관련 법률: 저작권법 제133조 의 제1항 및 제2항)</p>
			</div>			    
			
      <table class="table">
        <tr>
          <th>제목</th>
          <td><input type="text" class="form-control" name="question_title" required placeholder="제목을 입력해주세요." /></td>
        </tr>
        <tr>
          <th>글쓴이</th>
          <td><input type="text" class="form-control" name="writer" value="${nickname}" readonly /></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea class="form-control" name="question_content" rows="17"  required></textarea></td>
        </tr>  
        <tr>
          <td colspan="2">
            <button type="submit" class="btn btn-danger">등록</button>
            <button type="button" class="btn btn-danger" onclick="history.back()">취소</button>
          </td>
        </tr>
      </table>
    </form> 
  </main>
	 <footer><%@ include file="../template/footer.jsp"%></footer>

</body>

	<script>
		// JavaScript를 사용하여 버튼을 클릭할 때 내용을 표시하도록 합니다.
		const copyrightLawButton = document
				.querySelector('button[layer="copyright_law"]');
		const copyrightLawContent = document
				.getElementById('copyright-law-content');

		copyrightLawButton.addEventListener('click', function() {
			if (copyrightLawContent.style.display === 'none'
					|| copyrightLawContent.style.display === '') {
				copyrightLawContent.style.display = 'block';
			} else {
				copyrightLawContent.style.display = 'none';
			}
		});
	</script>
</html>






  


