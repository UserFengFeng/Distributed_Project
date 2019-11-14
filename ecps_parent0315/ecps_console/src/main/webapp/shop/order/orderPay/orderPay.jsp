<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/ecps/console/common/taglibs.jsp"%>

<head>
<title>待付款单_订单管理</title>
<meta name="heading" content="待付款单_订单管理"/>
<meta name="menu" content="OrderMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>

<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script language="javascript" type="text/javascript">
$(function(){	
	var orderState=$("#orderState").val();
	switch(orderState){
	 case "1,0":$("#label1").attr("class","here");break;
	 case "1":$("#label2").attr("class","here");break;
	 case "0":$("#label3").attr("class","here");break;
// 	 case "17":$("#label4").attr("class","here");break;
	

	}

});

</script>

</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/ordermenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
    <div class="loc icon"><samp class="t12"></samp>当前位置：订单管理&nbsp;&raquo;&nbsp;<span class="gray" title="待付款单">待付款单</span></div>
    
    <h2 class="h2_ch">
      <span id="tabs" class="l">
        <a id="label1" href="${path}/order/getOrdersByOrderState.do?orderState=1,0"   title="全部" class="nor">全部</a>
        <a id="label2" href="${path}/order/getOrdersByOrderState.do?orderState=1"   title="未付款待外呼" class="nor">未付款待外呼</a>  
        <a id="label3" href="${path}/order/getOrdersByOrderState.do?orderState=0"   title="已外呼" class="nor">已外呼</a>
<%--         <a id="label4" href="${path}/order/orderPay.do?orderState=17"  title="超时作废" class="nor">超时作废</a> --%>
      </span>
     
    </h2>
    <form action="${path}/order/orderPay.do" id="form1" name="form1" method="post">
     

   <table cellspacing="0" summary="" class="tab" id="myTable">
    <tr>
    <th>订单号</th>
    <th>收货人</th>
    <th>联系电话</th>
    <th>支付金额</th>
    <th>支付方式</th>
    <th>支付状态</th>
    <th>下单时间</th>
    <th>操作时间</th>
    <th>订单状态</th>
    <th>操作</th>
    </tr>
    <tr>
    <td><a href="${path }/shop/order/orderPay/detail.jsp?orderId=3123"></a></td>
    <td></td>
    <td>
    	
			
			
				请输入手机号码或者固定电话
			
			
		
	</td>
    <td>1000</td>
    <td>
    	
    		
    			在线支付
    		
    		
    	
    	
    </td>
    <td>
    	
    		
    		
    	
    </td>
    <td class="nwp">  <var class="red">
    <br/>
    </var>
   
   </td>
    <td class="nwp"><br /></td>
    <td class="nwp">
    	未付款单
    </td>
    <td><a href="${path }/shop/order/orderPay/detail.jsp?orderId=3123">查看</a></td>
    </tr>
    
    
    <tr>
    <td><a href="/ecps-console/order/orderPay/detail.do?orderId=3106"></a></td>
    <td>renliang</td>
    <td>
    	
			
			
				18612110485
			
			
		
	</td>
    <td>8000</td>
    <td>
    	
    		
    			在线支付
    		
    		
    	
    	
    </td>
    <td>
    	
    		
    		
    	
    </td>
    <td class="nwp">  <var class="red">
    <br/>
    </var>
   
   </td>
    <td class="nwp"><br /></td>
    <td class="nwp">
    	未付款单
    </td>
    <td><a href="${path }/shop/order/orderPay/detail.jsp?orderId=3106">查看</a></td>
    </tr>
    
    
    <tr>
    <td><a href="/ecps-console/order/orderPay/detail.do?orderId=3105"></a></td>
    <td>renliang</td>
    <td>
    	
			
			
				18612110485
			
			
		
	</td>
    <td>8000</td>
    <td>
    	
    		
    			在线支付
    		
    		
    	
    	
    </td>
    <td>
    	
    		
    		
    	
    </td>
    <td class="nwp">  <var class="red">
    <br/>
    </var>
   
   </td>
    <td class="nwp"><br /></td>
    <td class="nwp">
    	未付款单
    </td>
    <td><a href="${path }/shop/order/orderPay/detail.jsp?orderId=3105">查看</a></td>
    </tr>
    
    
    <tr>
    <td><a href="/ecps-console/order/orderPay/detail.do?orderId=3104"></a></td>
    <td>renliang</td>
    <td>
    	
			
			
				18612110485
			
			
		
	</td>
    <td>8000</td>
    <td>
    	
    		
    			在线支付
    		
    		
    	
    	
    </td>
    <td>
    	
    		
    		
    	
    </td>
    <td class="nwp">  <var class="red">
    <br/>
    </var>
   
   </td>
    <td class="nwp"><br /></td>
    <td class="nwp">
    	未付款单
    </td>
    <td><a href="${path }/shop/order/orderPay/detail.jsp?orderId=3104">查看</a></td>
    </tr>
    
    
    <tr>
    <td><a href="/ecps-console/order/orderPay/detail.do?orderId=3101"></a></td>
    <td></td>
    <td>
    	
			
			
				18612110485
			
			
		
	</td>
    <td>14400</td>
    <td>
    	
    		
    			在线支付
    		
    		
    	
    	
    </td>
    <td>
    	
    		
    		
    	
    </td>
    <td class="nwp">  <var class="red">
    <br/>
    </var>
   
   </td>
    <td class="nwp"><br /></td>
    <td class="nwp">
    	未付款单
    </td>
    <td><a href="${path }/shop/order/orderPay/detail.jsp?orderId=3101">查看</a></td>
    </tr>

    </table>
  	<input type="hidden"  id="orderState" value="${orderState }">
    </form>

</div></div>
</body>

