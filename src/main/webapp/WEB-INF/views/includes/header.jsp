<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Hahmlet&family=Hi+Melody&family=Orbit&display=swap" rel="stylesheet">
<style>
  @font-face{
  	font-family:'kbo';
  	src: url("<%=request.getContextPath()%>/resources/font/KBO Dia Gothic_medium.ttf") format('truetype');
  }
  @import url('https://fonts.googleapis.com/css2?family=Dongle&family=Hahmlet&family=Hi+Melody&family=Orbit&display=swap');
</style>
<head>
	<meta charset="UTF-8">
		 <style>


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'kbo', sans-serif;
            font-weight : 400;
            max-width: 1280px;
       
        }

         .btn1,.login span{
         	color : rgb(255, 181, 52);
         } 
         .btn1:hover{
         	color : rgb(255, 181, 52,0.5);
         } 

        a {
            text-decoration: none;
        }

        header {
            display: flex;
            max-width: 1280px;
        }

        .logo {
       
            border: none;
            margin-left: 5px;
            margin-top: 5px;
        }

        .logo img {

           width: 70px;
            height: 70px;
            margin-left: 45px;
        }

        .logo span {
        font-size: 1.5em;
        	font-weight:400;
            color: black;
        }
        
        #cat{
        	color : gray;
        }
        
        #dog{
        	color : brown;
        }

        .header-menu {
            margin-left: 30px;
            margin-top: auto;
            margin-bottom: auto;
        }

        .header-menu a {
            margin-right: 30px;
        }

        .menu1,
        .menu2,.menu3 {
            border: none;
            border-radius: 5px;
            background-color: white;
            font-size: 1.5em;
            font-weight: 400;
        }

        
        .login {
        border: none;
            text-align: right;
            font-size: 1.1em;
            margin-left:auto;
            margin-top:auto;
            margin-bottom:auto;
            margin-right:15px; 
            
       
        }

        .login span {
            font-weight: 400;
        }
         .btn1,.login span{
         	color : rgb(255, 181, 52);
         } 
         .btn1:hover{
         	color : rgb(255, 181, 52,0.5);
         }         

        .member-btn {
            margin-left: 10px;
            border-radius: 5px;
            background-color: white;
            border: none;
        }
        .member-logoutbtn{
            margin-left: 10px;
            border-radius: 5px;
            background-color: white;
            border: none;       
        }

    </style>

</head>

	<header>
        
             <div class="logo">
                 <a href="<%=request.getContextPath()%>/">
                     <img src="<%=request.getContextPath()%>/resources/img/logo.png"><br>
                     <span id="cat">야옹</span><span>아 </span><span id="dog">멍멍</span><span>해봐</span>
                 </a>
             </div>
         
         <div class="header-menu">
             <button class="menu1">
                 <a href="<%=request.getContextPath() %>/">보호소게시판</a>
             </button>
             <button class="menu2">
                 <a href="board?page=1&show=전체보기">자유게시판</a>
             </button>
             <button class="menu3">
                 <a href="map">보호소 지도</a>
             </button>
         </div>

         <div class="login">
         <c:if test="${login == null }">
             <button class="member-btn">
                 <a href="memberlogin">
                     <span class="btn1">로그인</span></a>
             </button>
             <button class="member-btn">
                 <a href="memberjoin"><span class="btn1">회원가입</span></a>
             </button>
             </c:if>
             <c:if test="${login != null }">
                  <a href="mypage"> <span class="nickname">${login.member_nickname }님 어서오세요.</span></a>
                    <button class="member-logoutbtn"><a href="logout">
                    <span class="btn1">로그아웃</span><br>
                    
                    
                    </a></button>
             </c:if>
         </div>
     </header>

