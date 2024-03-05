# 야옹아 멍멍해봐 (유기동물 입양 서비스)
* 유기동물 입양 및 관리하는 웹 서비스
* 반려 동물에 대한 입양을 고려하는 사람들에게 유기동물 공공데이터를 이용하여 다양한 정보를 제공
* 입양 및 관심 리스트를 제공하고 사용자간의 커뮤니티가 가능한 게시판을 제공

### 시연 영상
https://github.com/0gyunkim/Animal/assets/153244950/703e41a3-82bd-4bbb-ad17-5b3c80c80f10

### 프로젝트 소개
![소개1](https://github.com/0gyunkim/Animal/assets/153244950/5c654641-ce92-426b-9259-ce39cf182a2f)
![소개2](https://github.com/0gyunkim/Animal/assets/153244950/a02a149d-51d8-4af3-94de-3da41e04f7ac)
![소개3](https://github.com/0gyunkim/Animal/assets/153244950/187673a0-644f-4c9a-a7ac-49e0188abdc7)

### 메뉴구조도
![메뉴구조도](https://github.com/0gyunkim/Animal/assets/153244950/5ac643db-92af-4f46-9617-8d04a71fc2a2)

### DB 설계 (ERD)
![ERD](https://github.com/0gyunkim/Animal/assets/153244950/0f963e12-d39e-4962-ae7a-2eae9d4aac52)

### 기능명세서
![기능명세서](https://github.com/0gyunkim/Animal/assets/153244950/0bcb12f1-330a-44ba-8e9d-49c91a32bbe3)

### 기술 스택
**▷ 공공데이터 API** <br>
 서울시에서 제공하는 API를 사용함. 두 개의 API (동물 사진, 동물 정보)를 사용하다보니 데이터를 출력 할 때 마다 불편함을 느낌
 그래서 두 개의 API를 하나로 합쳐서 출력을 함.
 ```
$(document).ready(function(){
		//이미지 API 가져오기
		$.ajax({
			async : true,
			type : 'GET',
			url : 'animalPhotoAPI',
			contentType : "application/json; charset=UTF-8",
			success : function(photoData){
				console.log("photo success");
				
				//정보API 가져오기
				$.ajax({
					async : true,
	                type : 'GET',
	                url : 'animalInfoAPI',
	                contentType : "application/json, charset=UTF-8",
	                success : function(infoData){
	                console.log("info success");
	                    
            				 var parsedPhotoData = JSON.parse(photoData); //이미지 API json parsing
	                    var parsedInfoData = JSON.parse(infoData); //정보 API json parsing
	
	                   // var htmlProcess;
	
	                    var photoRows = parsedPhotoData.TbAdpWaitAnimalPhotoView.row; //이미지 API key find
	                    var infoRows = parsedInfoData.TbAdpWaitAnimalView.row; //정보 API key find
	
	                    //이미지 API와 정보 API 동물번호를 기준으로 매칭하여 
	                    //정보 API에 이미지 정보들을 저장하는 key 생성
	                    for(var i=0; i<infoRows.length; i++){
	                        var animalInfoNo = infoRows[i].ANIMAL_NO;
	                        let imageArr = [];
	                        for(var j=0; j<photoRows.length; j++){
	                            var animalPhotoNo = photoRows[j].ANIMAL_NO;
	                            if(animalInfoNo == animalPhotoNo){
	                                imageArr.push(photoRows[j].PHOTO_URL);
	                                //break;
	                            }
	                        }
	                        infoRows[i].PHOTO_LIST = imageArr;
	                    }
	                    
	                    var jsonFile = JSON.stringify(infoRows);

	                    //브라우저 로컬스토리지 내 api 모든 정보 저장
	                    localStorage.setItem('jsonFileAll',jsonFile);
```
![api](https://github.com/0gyunkim/Animal/assets/153244950/eddd5f66-0aae-49c2-b088-e5184e786aca) <br>

**▷ 회원가입 유효성체크** <br>
 회원가입 페이지에 중복확인 버튼을 배치하는 것 보단 정보를 입력하면 바로 확인을 할 수 있도록 JQuery 문법 중 foucsout을 이용하여 구현 (이메일, 닉네임)
 ```
				<div class="join-box">
					<form action="join" method="post" onsubmit="return submi()">
						<div class="form-floating mb-3">
							<input type="email" class="form-control" id="mid" name="member_email"
								placeholder="name@example.com" required> 
								<label for="idInput">이메일</label>
							<div>
								<font id="id_font" size="2"> </font>
							</div>

						</div>
```
```
<script type="text/javascript">
						var idchk;
						var nickchk;
						$('#mid').focusout(function() {
							let mid = $('#mid').val();
							let mname = $('#nameInput').val();
							let mpass = $('#floatingPassword').val();
							$.ajax({
								url : "idchk",
								type : "post",
								data : {
									memberId : mid
								},
								dataType : "json",
								success : function(result) {
									console.log(result)
									if (result == 1 || mid == '') {
										$("#id_font").html('아이디를 확인해주세요.');
										$("#id_font").attr('color', '#dc3545');
										idchk = 0;
									} else {
										$("#id_font").html('사용 가능한 아이디입니다.');
										$("#id_font").attr('color', '#2fb380');
										idchk = 1;

									}
									/*                                 				if(mname==""||mname==null){
									                                                    joinchk=0;                                					
									                                                }
									                                                if(mnickname==""||mnickname==null){
									                                                    joinchk=0;                                					
									                                                }
									                                                if(mpass==""||mpass==null){
									                                                    joinchk=0;                                					
									                                                }        */
								},
								error : function() {
									$("#id_font").html('서버요청실패');
								}
							})
						})
```
![회원가입1](https://github.com/0gyunkim/Animal/assets/153244950/547481a4-94bd-4ee6-95ee-3ef013c27f2b) 

**▷ session 이용하기** <br>
최초 로그인 정보를 로그아웃 전까지 유지될 수 있도록 회원의 일부 정보를 session 값에 지정함.
```
		if(session.getAttribute("login")!=null) {
			session.removeAttribute("login");
		}
		
		MemberVO mvo = mservice.login(memberVo);
		
		if(mvo!=null) { // 로그인 성공
			session.setAttribute("login", mvo);
```
```
             <c:if test="${login != null }">
                  <a href="mypage"> <span class="nickname">${login.member_nickname }님 어서오세요.</span></a>
                    <button class="member-logoutbtn"><a href="logout">
                    <span class="btn1">로그아웃</span><br>
                    
                    
                    </a></button>
             </c:if>
```






	                    

 












