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
            var shengId = document.getElementById("sheng").value;
            shi.options.length=0;
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
                    for(var i=0;i<dataObject.rows.length;i++){
                        var o = dataObject.rows[i];
                        shi.options.add(new Option(o.text,o.id));
                    }
                }
            }
            xmlHttp.open("get","getAjaxInfo?action=ejld&shengId="+shengId,true);
            xmlHttp.send();
            // xmlHttp.open("post","getAjaxInfo?action=jsonArray",true);
            // xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
            // xmlHttp.send("name=jack&age=11");
        }
    </script>
</head>
<body>
省:
<select id="sheng" onchange="loadInfo()">
    <option value="1">江苏省</option>
    <option value="2">山东省</option>
    <option value="3">浙江省</option>
</select>
&nbsp;&nbsp;&nbsp;
市:
<select id="shi">

</select>
</body>
</html>
