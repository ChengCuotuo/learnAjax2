<%--
  Created by IntelliJ IDEA.
  User: lei02
  Date: 2019/4/16
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>addbook</title>
    <!--
      1.获取当前的所有的 a 节点，并为每一个 a 节点添加 onclick 响应函数，同时取消其默认行为
      2.准备发送 Ajax 请求，：url (a 节点的 href 属性); args（时间戳）
      3.响应为一个 JSON 对象，包括 : bookName, totalBookNumber, totalMoney
      4.把对应的属性添加到对应的位置
    -->
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/script/jquery-3.1.0.js"></script>
    <script type="text/javascript">
      $(function(){
        var isHasCart = "${sessionScope.sc == null}";
        if (isHasCart == "true"){
          $('#cartstatus').hide();
        }

        $('a').click(function(){
          $('#cartstatus').show();
          var url = this.href;
          var args = {"time" : new Date()};
          $.getJSON(url, args, function(data){
            $('#bookName').text(data.bookName);
            $('#totalBookNumber').text(data.totalBookNumber);
            $('#totalMoney').text(data.totalMoney);
          });
          return false;
        })
      })
    </script>
  </head>
  <body>
    <div id="cartstatus">
      您已经将 &nbsp; <span id="bookName"> </span>&nbsp; 添加到购物车，
      购物车中的书有 &nbsp; <span id="totalBookNumber"> </span>&nbsp; 本，
      总价为 &nbsp; <span id="totalMoney"> </span>&nbsp; 元钱。
    </div>

    <br /><br />
    Java &nbsp;&nbsp;<a href="addToCart?id=java&price=56">添加到购物车</a>
    <br /><br />
    Oracle &nbsp;&nbsp;<a href="addToCart?id=oracle&price=88">添加到购物车</a>
    <br /><br />
    Spring &nbsp;&nbsp;<a href="addToCart?id=spring&price=98">添加到购物车</a>
  </body>
</html>
