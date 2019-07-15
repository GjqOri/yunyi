<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<html>
<head>
<title>问题详情页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link rel="stylesheet" href="${hello}css/bootstrap.css">
   <script src="${hello}js/jquery-3.3.1.min.js"></script>
   <script src="${hello}js/bootstrap.js"></script>
   <script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<style>
body{
color:white;
}
a{ 
text-decoration:none; 
color:white; 
} 
    a:link {color: #FFFFFF;} /* 未访问的链接 */

    a:hover{color: #CCFFFF;} /*鼠标在链接上 */ 

</style>
</head>

<body style="background-color:#303030">
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" style="font-size:20px" href="#">云易</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">

                <li class="active"><a class="scroll" href="${hello}column" id="test">专栏</a></li>
                <li class="active"><a class="scroll" href="#" id = "yuan">发现</a></li>
                <li class="active"><a class="scroll" href="#lianxi">联系我们</a></li>
                <li class="active"><a class="scroll" href="personal.jsp">我的主页</a></li>
            </ul>
            <ul class="nav navbar-nav pull-right">

            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div style="margin-top:30px" class="row-md-12">
        
        <div class="col-md-12" >
					<br>
					 <p ><strong><h3>${Question.questionName}</h3></strong></p>
					 <p ><strong><h4>${Question.questionContent}</h4></strong></p>
					
			 <div class="row">
					<div class="col-md-2" >
					<p><br>
					<button id="huida" type="submit" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span>&nbsp;我来回答</button>
					</div>
					<div class="col-md-10 col-md-pull-1">
					<p align=right><br><br><br><br>
					<span class="glyphicon glyphicon-user"></span> <a href="#">${Question.questioner.userName}</a>
					&nbsp;
					<text>创建时间: ${Question.creationTime}</text>
					</p>
					</div>
			 </div>


			<br>
            <div class="col-md-12" style=" box-shadow: inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
                    <h5><b><p>评论列表</p></b></h5>
            </div>

            <table>
            <c:forEach var="i" items="${comment}">
      		<tr>
            <div class="row">
                    <br>
                    <div style="width:100px;height:100px;float:left;margin-top:20px;margin-left:30px">
						<p><img src="${hello}user/avatar/${i.answerUser.id}" width=45px height=45px></p>
						<p><a  href="#">  ${i.answerUser.userName}</a></p>
					</div>
               
				<div style="width:400px;height:100px;float:left;margin-top:20px;margin-left:30px;">
					<h3>${i.answerContent}</h3>
				</div>
				<div style="width:100px;height:100px;float:left;margin-top:20px;margin-left:30px;">	
					<h4 style="line-height:80px">第${i.id}楼</h4>
				</div>
				<div style="width:300px;height:100px;float:left;margin-top:20px;margin-left:20px;">
					
				<font style="line-height:100px"> ${i.answerTime}</font>
					&emsp;&emsp;&emsp;
					<a id="doubleclick"><span class="glyphicon glyphicon-thumbs-up"></span></a><text></text>
					&emsp;&emsp;&emsp;
					<a id="huifu" href="#"><span class="glyphicon glyphicon-comment"></span></a>
				</div>
            </div>
            <hr>
            </tr>

          </c:forEach>
          
          </table>
        </div>
    </div>
</div>
<div id="huifa" style="display: none">
    <textarea id='huidaneirong' value='' style='background:transparent;
          margin-top:20px;margin-left:20px;
          color:#000000;height: 100px;width:460px'></textarea><br><br><br><strong>
    <h3 id='huidafabiao' style='cursor:pointer;color: #000000;margin-top:20px;margin-left: 230px'>提交</h3></strong>
</div>

<script>
	$('#huida').on('click',function(){
      //var content = "";
      layer.open({
          type:1,
          title:'回答界面',
          maxmin:true,
          shadeClose:true,
          area:['500px','300px'],
          content:$('#huifa')
      });

  });
	</script>
	<script>
	$('#huifu').on('click',function(){
	    var content = "<textarea id='neirong' value='' style='background:transparent;" +
          "margin-top:20px;margin-left:20px;" +
          "color:#000000;height: 100px;width:460px'></textarea><br><br><br>" +
          "<strong><h3 id='fabiao' style='cursor:pointer;color: #000000;margin-top:20px;margin-left: 230px'>发表</h3></strong>";
		layer.open({
   			type:1,
   			title:'回复界面',
   			maxmin:true,
   			shadeClose:true,
   			area:['500px','300px'],
   			content:content
   		});

});
</script>
<script>
var index = parent.layer.getFrameIndex(window.name);
$('#fabiao').on('click',function(){
	  var f1 = document.getElementById("neirong").value;
	 
      $.ajax({
    //      url:  'answer/save',
                  type: 'post',
                  data: {'answerContent':f1, 'questionId': ${Question.id}},
              success:function(data) {
                  layer.msg(data.msg);
                  if(data.code === 0)
                  {
                      parent.layer.close(index);
                  }
          }
      })
});


</script>
<script>
    var index = parent.layer.getFrameIndex(window.name);
    $('#huidafabiao').on('click',function(){
        var f1 = document.getElementById("huidaneirong").value;
        $.ajax({
            url:  '${hello}answer/save',
            type: 'post',
            data: {'answerContent':f1, 'questionId': ${Question.id}},
            success:function(data) {
                layer.msg(data.msg);
                if(data.code === 0)
                {
                    window.location.reload();
                    parent.layer.close(index);
                }
            }
        })
    });


</script>
</body>
</html>