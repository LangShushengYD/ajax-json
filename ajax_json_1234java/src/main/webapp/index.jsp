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
        function loadInfo() {
            var xmlHttp;
            if(window.XMLHttpRequest){
                xmlHttp = new XMLHttpRequest();
            }else {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlHttp.onreadystatechange=function(){
                if(xmlHttp.readyState==4 && xmlHttp.status==200){
                    var dataObject = eval("("+xmlHttp.responseText+")");
                    document.getElementById("name").value=dataObject.name;
                    document.getElementById("age").value=dataObject.age;
                }
            }
            // xmlHttp.open("get","getAjaxName?name=jack&age=11",true);
            // xmlHttp.send();
            xmlHttp.open("post","getAjaxInfo?action=jsonArray",true);
            xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            xmlHttp.send("name=jack&age=11");
        }
        function loadInfo2() {
            var xmlHttp;
            if(window.XMLHttpRequest){
                xmlHttp = new XMLHttpRequest();
            }else {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlHttp.onreadystatechange=function(){
                if(xmlHttp.readyState==4 && xmlHttp.status==200){
                    var dataObject = eval("("+xmlHttp.responseText+")");
                    alert(xmlHttp.responseText);
                    var st = document.getElementById("studentTable");
                    alert(dataObject.students.length);
                    //行
                    var newTr;
                    //第一列
                    var newTd0;
                    //第二列
                    var newTd1;
                    //第三列
                    var newTd2;
                    for (var i = 0;i<dataObject.students.length;i++){
                        var student = dataObject.students[i];
                        newTr = st.insertRow();
                        newTd0 = newTr.insertCell();
                        newTd1 = newTr.insertCell();
                        newTd2 = newTr.insertCell();
                        newTd0.innerHTML=student.name;
                        newTd1.innerHTML=student.age;
                        newTd2.innerHTML="语文:"+student.score.Chinese+"数学:"+student.score.Math+"英语:"+student.score.English;
                    }
                }
            }
            // xmlHttp.open("get","getAjaxName?name=jack&age=11",true);
            // xmlHttp.send();
            xmlHttp.open("post","getAjaxInfo?action=jsonArray",true);
            xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            xmlHttp.send("name=jack&age=11");
        }
    </script>
</head>
<body>

<div style="text-align: center;">
    <div>
        <input type="button" value="ajax获取信息" onclick="loadInfo()"/>&nbsp;&nbsp;&nbsp;姓名:<input type="text" id="name" name="name">
        <br/>
        年龄:<input type="text" id="age" name="age">
        <br/>
        <div style="margin-top: 20px">
            <input type="button" value="ajax获取信息2" onclick="loadInfo2()"></div>
        <table id="studentTable" align="center" border="1px" cellpadding="0px">
            <tr>
                <th>姓名</th><th>年龄</th><th>成绩:</th>
            </tr>

        </table>
    </div>
</div>
</body>
</html>
