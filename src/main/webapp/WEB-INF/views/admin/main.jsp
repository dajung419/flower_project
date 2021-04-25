<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fl#our 관리자페이지</title>
<link rel="stylesheet" href="admin/css/admin.css" >
<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script type="text/javascript">
function worker_check()
{
  if(document.frm.workId.value==""){
      alert("아이디를 입력하세요.");
      return false;
  }else if(document.frm.workPw.value==""){
     alert("비밀번호를 입력하세요.");
      return false;
    }
    return true;  
}
</script>

<style type="text/css">
.admin_login .loginform table tr td{
border:none;

font-family:Bahnschrift Light;
font-size:18px;
}
</style>
</head>


<body>
   <header class="navi">
        <div class = "title">
            <a href="index"><img class="title-img" src="admin/images/LOGONEW.png"></a>
        </div>
        <div id="topM">
	          <ul><li><a href="#">로그아웃</a></li></ul>
	    </div>
   </header>
    

    <article class="admin_login">
        <div class="admin_loginform">
            <div class="loginform">
                <form name="frm" method="post" action="admin_login">
                            <h2><u>admin login</u></h2>
                            <table>
                                <tr>
                                <td> ADMIN'S ID </td>
                                <td> <input type="text" name="workerId" size="10" value="admin"></td>
                                </tr>
                                <tr>
                                <td> PASSWORD </td>
                                <td> 
                                    <input type="password" name="workerPwd" size="10" value="1234">
                                </td>
                                </tr>
                                <tr>
                                <td  colspan="2">          
                                    <input class="btn" type="submit" value="업무 로그인" onclick="return worker_check()"><br><br>
                                    <h4 style="color:red">${message}</h4>
                                </td>
                                </tr>
                            </table>
                </form>
            </div>
        </div>
</article>
</body>
</html>