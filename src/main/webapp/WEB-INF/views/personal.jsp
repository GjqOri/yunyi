<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%--    <meta charset="UTF-8">--%>
    <title>个人主页</title>
    <link rel="stylesheet" href="${hello}css/personalPage.css">
    <link rel="stylesheet" href="${hello}iconfont/iconfont.css">
    <script src="${hello}js/jquery-3.3.1.min.js"></script>
<style> 
.divcss5{ border:0px solid #000; width:300px; height:300px;overflow:hidden} 
.divcss5 img{max-width:300px;_width:expression(this.width > 300 ? "300px" : this.width);} 
</style> 
<style>
	.file {
    position: relative;
    display: inline-block;
    background: #606060;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #ffffff;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}

</style>
</head>

<body style="background-color:#444">
<div class="nav">
	<h3 style="color:#ffffff;cursor:pointer;margin-left:50px" onclick="window.location = '${hello}column'" >返回</h3>
</div>
<div class="container">
    <div class="personInfo">
        <div class="top"></div>
        <img id="touxiang" style="cursor:pointer" src="${hello}user/avatar/${user.id}">
        <div  class="usrname">用户名:${user.userName}
        
<!-- 详情页 -->
        </div>
        <div class="textinfo">
            <span>积分：${user.integral}</span>
            <span>发布数：${user.askingNumber}</span>
            <span>回答数：${user.answerNumber}</span>
        </div>

        <button id="modify" style="">修改个人信息</button>
        <div class="bot"></div>
        <div class="detailbtn"><i class="iconfont icon-unfold"></i> <span >详细资料</span></div>
        <div class="detail">
            <p>班&emsp;&emsp;级：${user.userClass}</p>
            <p>学&emsp;&emsp;号：${user.studentNo}</p>
            <p>邮&emsp;&emsp;箱：${user.email}</p>
        </div>
    </div>
    
 <!--  历史提问   -->
<div id="myquestion">
    <ul class="menu">
        <li><strong>我的提问</strong></li>
        <li><a id="answer">我的回答</a></li>
        <li>我的资料</li>
        <li><a id="tiwen">提问</a></li>
        <li><a id="ziliao">上传资料</a></li>
    </ul>
    <div style="width:60%;height:100px;margin-left:50px;">
    <table>
        <c:forEach var="i" items="${questions}">

            <tr>
                <div style="margin-top:20px">
                    <font style="size:20px;color:#989898;">创建时间${i.creationTime }</font>
                    <a href="/question/detail/${i.id}"><h3>${i.questionName }</h3></a>
                    <h3>${i.questionContent }</h3>
<%--                    <p>赞同数 &emsp;评论数</p>--%>
                    <hr>
                    <br>
                </div>
            </tr>
        </c:forEach>
    </table>
	</div>
</div>

<!-- 历史问答 -->

<div id="myanswer" style="display:none">
    <ul class="menu">
         <li><a id="question">我的问题</a></li>
        <li><strong>我的回答</strong></li>
        <li>我的资料</li>
        <li><a id="tiwen">提问</a></li>
        <li><a id="ziliao">上传资料</a></li>
    </ul>
    <div  style="width:60%;height:100px;margin-left:50px">
    <table>
        <c:forEach var="i" items="${answers}">
            <tr>
                <div style="margin-top:20px">
                    <font style="size:20px;color:#989898;">创建时间${i.answerTime}</font>
                    <a href="/question/detail/${i.question.id}"><h3>${i.answerContent}</h3></a>
<%--                    <h4>我的回答</h4>--%>
                    <hr>
                    <br>
                </div>
            </tr>
        </c:forEach>
    </table>
</div>
</div>

</div>
<div class="shadow"></div>
<div class="hidebox2">
    <label for="choosefile">选择文件</label>
    <input type="file" id="choosefile" style="display: none;">
    <input type="submit" class="submit">
</div>

<!--  ------------------------------------------------------------------------------------------------------------------- -->

<!-- 更换头像 -->

<div style="display: none" id="update">
 <div class="divcss5"> 

  <img id="img" style='height:300px;width:300px' src='${hello}user/avatar/${user.id}'>
 </div>
  <br>
 <button class='file' style='cursor:pointer;text-align:center;margin-left:110px;height:30px;width:100px' id='add'>选择图片</button>
 <br>
 <br>
 <!--form enctype="multipart/form-data" id="uploadForm"-->
 <input type="file" id="xuanze" style="display:none" onchange="fileReader(this)" />
 
 <input type="submit" class='file' style='cursor:pointer;text-align:center;margin-left:110px;height:30px;width:100px'  id='picinput'value="确认修改"/>

</div>

<!--  ------------------------------------------------------------------------------------------------------------------- -->



<script src="${hello}layer-v3.1.1/layer/layer.js"></script>
<script>
    var bot=$('.personInfo .bot');
    var detail=$('.personInfo .detail');
    var cnt=0;
    $('.personInfo .detailbtn').click(function () {
        if(cnt===0){
            bot.animate({height:'200px'},showDetail);
            function showDetail(){
                detail.show();
            }
            change('icon-fold','收起');
            cnt=1;
        }
        else{
            bot.animate({height:'100px'});
            change('icon-unfold','详细资料');
            detail.hide();
            cnt=0;
        }
        function change(cls,txt) {
            $('.detailbtn i').attr('class','iconfont '+cls);
            $('.detailbtn span').html(txt);
        }
    });
    $('#tiwen').on('click',function(){
        layer.open({
            type:2,
            title:'提交问题',
            maxmin:true,
            shadeClose:true,
            area:['1000px','700px'],
            content:'${hello}input.jsp'
        });
    });
    $('#ziliao').on('click',function(){
        layer.open({
            type:2,
            title:'上传资料',
            maxmin:true,
            shadeClose:true,
            area:['1000px','700px'],
            content:'${hello}answer.jsp'
        });
    });

    $('#modify').on('click',function(){
        layer.open({
            type:2,
            title:'修改信息',
            maxmin:true,
            shadeClose:true,
            area:['400px','533px'],
            content:'${hello}update.jsp'
        });
    });
	$('#touxiang').on('click',function(){
		 //var content = "";
		layer.open({
  			type:1,
  			title:'更换头像',
  			maxmin:true,
  			shadeClose:true,
  			area:['300px','500px'],
  			content:$('#update')
  		});
	});
	$('#add').on('click',function(){
			$('#xuanze').trigger('click');
			
		});
	
    $('.hidebox .submit').click(function () {
        $('.shadow').hide();
        $('.hidebox').hide();
    });
    $('.hidebox2 .submit').click(function () {
        $('.shadow').hide();
        $('.hidebox2').hide();
    });
    $('.modifyinfo .submit').click(function () {
        $('.shadow').hide();
        $('.modifyinfo').hide();
    });
    $('#headimg').change(function () {
        var reads=new FileReader();
        f=this.files[0];
        reads.readAsDataURL(f);
        reads.onload=function (e) {
            var img = new Image;
            img.src = this.result;
            img.style.height='140px';
            img.style.width='140px';
            $('.modifyinfo label').html('').append(img);
        };
    });
	$(document).ready(function() {

		$("#answer").on('click',function(){
			$("#myquestion").hide(500);
			$("#myanswer").show(500);
		});
	
		$("#question").on('click',function(){
			$("#myanswer").hide(500);
			$("#myquestion").show(500);
		});
	
	
	});
	
	
	//头像预览实现
	
    function fileReader(obj){
    	var file = obj.files;
    	var img = document.getElementById("img");
    	var reader = new FileReader();// 操作图片
    	if(/image/.test(file[0].type)){
    	reader.readAsDataURL(file[0]);
    	}else {
    	alert('请选择图片!');
    	obj.value = "";
    	return;
    	}
    	// 图片加载错误
    	reader.onerror = function(){
    	document.write("图片加载错误");
    	}
    	// 图片加载完成
    	reader.onload = function(){
    	img.src = reader.result;
    	}
    	}
	//图片上传
    	$('#picinput').on('click',function(){
          var l = layer.load();
        var formData = new FormData();  //创建一个forData 

        formData.append('img', $('#xuanze')[0].files[0]) //把file添加进去  name命名为img
        $.ajax({
            url: "${hello}user/update/avatar",
            data: formData,
            type: "POST",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {
                layer.msg(data.msg);
                if(data.code === 0)
                {

                    window.location.href=window.location.href;
                    window.location.reload();
                }
            },
            complete: function () {
              layer.close(l);
            }
          });
    });
</script>
</body>
</html>