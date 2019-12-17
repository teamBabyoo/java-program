<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/font-awesome.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/style.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/admin_style.css" />">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--     <script src="js/jquery-3.3.1.min.js"></script> -->
</head>
<body>
    <header role="banner">
        <h1>Admin Panel</h1>
        <ul class="utilities">
          <li class="users"><a href="#">My Account</a></li>
          <li class="logout warn"><a href="">Log Out</a></li>
        </ul>
      </header>
      
      <nav role="navigation">
        <ul class="main">
          <li class="member"><a href="#">회원관리</a></li>
          <li class="store"><a href="#">가게관리</a></li>
          <li class="review"><a href="#">리뷰관리</a>
            <ul>
                <li><a class="review_all" href="#">전체리뷰</a></li>
                <li><a class="review_report" href="#">신고리뷰</a></li>
            </ul>
        </li>
          <!-- <li class="comments"><a href="#">Comments</a></li>
          <li class="users"><a href="#">Manage Users</a></li> -->
        </ul>
      </nav>
      
      <main role="main">
       
      
        <section class="panel ">
          <h2>Table</h2>
          <table>
            <tr>
              <th>Username</th>
              <th>Posts</th>
              <th>comments</th>
              <th>date</th>
            </tr>
            <tr>
              <td>Pete</td>
              <td>4</td>
              <td>7</td>
              <td>Oct 10, 2015</td>
      
            </tr>
            <tr>
              <td>Mary</td>
              <td>5769</td>
              <td>2517</td>
              <td>Jan 1, 2014</td>
            </tr>
          </table>
        </section>
      
      </main>
      <footer role="contentinfo">Easy Admin Style by Melissa Cabral</footer>
</body>
</html>