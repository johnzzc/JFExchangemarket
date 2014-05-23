<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
</head>
<body>
<form method="post" action="/update" id="orderListForm">
	<table border=1px>
		<thead>
			<tr>
				<th>Seller</th>
				<th>Selling Item</th>
				<th>Buyer</th>
				<th>Exchange Item</th>
				<th>Status</th>
				<th>Last Edited Time</th>
			</tr>
		</thead>
		<tbody>
			<#list orderList as order>
			<tr id="order${order.orderid}">
				<td>${order.sellerid}</td>
				<td>${order.sellgoodsid}</td>
				<td>${order.buyerid}</td>
				<td>${order.exchangegoodsid}</td>
				<td id="status${order.orderid}" name="sampleName" value="${order.status}">${order.status}</td>
				<td>${order.lastactiontime}</td>
			</tr>
			</#list>
		</tbody>
		</table>
	<input id="btnSubmit" type="submit">
	<input id="btnSubmit" type="reset">
</form>
</body>
</html>

<script type="text/javascript" language="javascript">
//在页面装载时，让所有的td都拥有点击事件
$(document).ready(function(){
    //找到所有td节点
    var tds = $("td");
    //var tds = $("#sampleName");
    //var tds = document.getElementsByName('sampleName');
    //alert(tds);
    //给所有的td节点增加点击事件
    tds.click(tdclick);
});

function tdclick(){
    var clickfunction = this;
    //0,获取当前的td节点
    var td = $(this);
    //获取id
    var sampleId = $(this).val();    
    //alert(id);
    //1,取出当前td中的文本内容保存起来
    var text = $(this).text();
    //2，清空td里边内同
    td.html("");
    //3,建立一个文本框，也就是建一个input节点
    var input = $("<input>");
    //4,设置文本框中值是保存起来的文本内容
    input.attr("value",text);
    //4.5让文本框可以相应键盘按下的事件
    input.keyup(function(event){
        //记牌器当前用户按下的键值
        var myEvent = event || window.event;//获取不同浏览器中的event对象
        var kcode = myEvent.keyCode;
        //判断是否是回车键按下
        if(kcode == 13){
            var inputnode = $(this);
            //获取当前文本框的内容
            var inputext = inputnode.val();
            //清空td里边的内容,然后将内容填充到里边
            var tdNode = inputnode.parent();
            tdNode.html(inputext);
            //让td重新拥有点击事件
            tdNode.click(tdclick);
         	//只有当内容不一样时才进行保存
            if(inputext != text && inputext != ""){                    
                 //调用该方法与后台交互
                sampleNameUpdate(sampleId, inputext, '/update');
            }
        }
    });
    //5，把文本框加入到td里边去
    td.append(input);
    //5.5让文本框里边的文章被高亮选中
    //需要将jquery的对象转换成dom对象
    var inputdom = input.get(0);
    inputdom.select();
    //6,需要清楚td上的点击事件
    td.unbind("click");
}

//样卷名字的修改
function sampleNameUpdate(id, content, tagAction){
    //alert(id+content+tagAction);
    $.ajax({
        url:tagAction,
        data:{
            sendTime:(new Date()).getTime(),
            sampleName:content,
            tagId: id
        },
        type:'post',
        async:false,
        dataType:'json',
        success:function(data){
            if(data.success){
                alert("修改成功");
            }else{
                alert("修改失败！");
            }
        }
    });
}
</script>