<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/17
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function checkUserName() {
            var userName = document.getElementById("userName").value;
            var xmlHttp;
            if(window.XMLHttpRequest){
                xmlHttp = new XMLHttpRequest();
            }else {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlHttp.onreadystatechange=function(){
                if(xmlHttp.readyState==4 && xmlHttp.status==200){
                    var dataObject = eval("("+xmlHttp.responseText+")");
                    // document.getElementById("name").value=dataObject.name;
                    // document.getElementById("age").value=dataObject.age;
                    // alert(xmlHttp.responseText);
                    if(dataObject.exist){
                        document.getElementById("tip").innerHTML="<img src='QQ图片20190818170312.jpg' sizes='(max-width: 32px) 28px,\n" +
                            "            (max-width: 48px) 44px,\n" +
                            "            80px'/>&nbsp;&nbsp;该用户已注册！";
                    }else {
                        document.getElementById("tip").innerHTML="<img src='QQ图片20190818170227.jpg' sizes='(max-width: 32px) 28px,\n" +
                            "            (max-width: 48px) 44px,\n" +
                            "            80px'/>&nbsp;&nbsp;该用户名可以使用！";
                    }
                }
            }
            xmlHttp.open("get","getAjaxInfo?action=checkUserName&userName="+userName,true);
            xmlHttp.send();
            // xmlHttp.open("post","getAjaxInfo?action=jsonArray",true);
            // xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            // xmlHttp.send("name=jack&age=11");
        }
    </script>
</head>
<body>
<table>
    <tr>
        <th>用户注册：</th>
    </tr>
    <tr>
        <td>用户名：</td>
        <td><input type="text" id="userName" name="userName" onblur="checkUserName()"/>&nbsp;&nbsp;&nbsp;<font id="tip" size="2"></font></td>
    </tr>
    <tr>
        <td>密码：</td>
        <td><input type="password" id="password" name="password"/></td>
    </tr>
    <tr>
        <td>确认密码：</td>
        <td><input type="password" id="password2" name="password2"/></td>
    </tr>
    <tr>
        <td><input type="submit" value="注册"/></td>
        <td><input type="button" value="重置"></td>
    </tr>
</table>
</body>
</html>
