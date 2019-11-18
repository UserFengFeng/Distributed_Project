<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>品牌管理_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="brand" content="brandName"/>
<script type="text/javascript">
	var flag=null;
    function singleDel(brandId){
    	//tipShow('#confirmDiv');
    	if(confirm("你确认要删除该品牌吗?")){
    		window.location.href = "${path}/brand/deleteBrand.do?brandId="+brandId;
    	}
    }
    function batchDel(){
        if(!isChecked()){
            alert("请选择记录");
            return;
        }
        tipShow('#confirmDiv');
        flag="batchDel";
/*         if(confirm("确定删除这些记录")){
        	$("#form1").attr("action","${base}/item/brand/batchDelBrandById.do");
	       	$("#form1").submit();
        } */

    }

    

    

    $(document).ready(function(){
		$("#all").click(function(){
	     	if($("#all").attr("checked")){
	        	$("input[name='ids']").attr("checked", true);
	        }else{
	        	$("input[name='ids']").attr("checked", false);
	        }
	    });
		$("#checkall").click(function(){
			$("input[name='ids']").attr("checked", true);
			$("#all").attr("checked",true)
		});
		$("#cancelall").click(function(value){
			$("input[name='ids']").attr("checked", false);
			$("#all").attr("checked",false)
		});
		

		<c:if test="${message!=null }">
			alert("<c:out value='${message }'/>");
		</c:if>
	});
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/studentmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<span class="gray">品牌管理</span></div>

<form id="form1" name="form1" action="${base}/item/brand/listBrand.do" method="post">
    <div class="page_c">
        
        <span class="r inb_a">
            <a href="${path }/shop/item/addbrand.jsp" title="添加" class="btn80x20">添加</a>
        </span>
    </div>

	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th>品牌编号</th>
            <th>品牌图片</th>
			<th>品牌名称</th>
			<th>品牌网址</th>
			<th>品牌描述</th>
			<th width="10%">排序</th>
			<th width="10%">操作</th>
		</thead>
		<tbody>

		<tr>
				<td>3185</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload/20131007044713569480.jpg"   height="50" width="50"/></td>
				<td>苹果</td>
				<td class="nwp">http://4444</td>
				<td class="nwp">http://apple</td>
				<td>155</td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=3185">编辑</a>
                    <a href="#" onclick="singleDel(3185)">删除</a>
				</td>
			</tr>

			<tr>
				<td>3121</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/137835306616424390359.jpg"   height="50" width="50"/></td>
				<td>meizu</td>
				<td class="nwp">http://meizu</td>
				<td class="nwp">meizu</td>
				<td>2</td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=3121">编辑</a>
                    <a href="#" onclick="singleDel(3121)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1000</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351478761609141540735.jpg"   height="50" width="50"/></td>
				<td>波导</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1000">编辑</a>
                    <a href="#" onclick="singleDel(1000)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1001</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351478918676104978608.jpg"   height="50" width="50"/></td>
				<td>华为</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1001">编辑</a>
                    <a href="#" onclick="singleDel(1001)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1002</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351479001579109452339.jpg"   height="50" width="50"/></td>
				<td>联想</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1002">编辑</a>
                    <a href="#" onclick="singleDel(1002)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1003</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351479108778166100728.jpg"   height="50" width="50"/></td>
				<td>三星</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1003">编辑</a>
                    <a href="#" onclick="singleDel(1003)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1004</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351479208124190223249.jpg"   height="50" width="50"/></td>
				<td>中兴</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1004">编辑</a>
                    <a href="#" onclick="singleDel(1004)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1005</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351479330326136850862.jpg"   height="50" width="50"/></td>
				<td>天语</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1005">编辑</a>
                    <a href="#" onclick="singleDel(1005)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1006</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351479515808106398938.JPG"   height="50" width="50"/></td>
				<td>天迈</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1006">编辑</a>
                    <a href="#" onclick="singleDel(1006)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1007</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351479601015179106601.jpg"   height="50" width="50"/></td>
				<td>酷派</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1007">编辑</a>
                    <a href="#" onclick="singleDel(1007)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1008</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351479849306158394130.JPG"   height="50" width="50"/></td>
				<td>海信</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1008">编辑</a>
                    <a href="#" onclick="singleDel(1008)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1009</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351479925467102309116.jpg"   height="50" width="50"/></td>
				<td>金立</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1009">编辑</a>
                    <a href="#" onclick="singleDel(1009)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1010</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1351480012446191380436.jpg"   height="50" width="50"/></td>
				<td>摩托罗拉</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1010">编辑</a>
                    <a href="#" onclick="singleDel(1010)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1041</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1365321997034103071485.jpg"   height="50" width="50"/></td>
				<td>步步高</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td>1</td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1041">编辑</a>
                    <a href="#" onclick="singleDel(1041)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1042</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload///upload//ecps//resource//1377185395324185945698.jpg"   height="50" width="50"/></td>
				<td>诺基亚</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td>1</td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1042">编辑</a>
                    <a href="#" onclick="singleDel(1042)">删除</a>
				</td>
			</tr>

			<tr>
				<td>1043</td>
                <td>
				<img id='imgsImgSrc' src="http://localhost:8081/pic/upload//upload/ecps/resource/1369885015046118179024.jpg"   height="50" width="50"/></td>
				<td>HTC</td>
				<td class="nwp"></td>
				<td class="nwp"></td>
				<td></td>
				<td>
					<a href="${path }/shop/item/editbrand.jsp?brandId=1043">编辑</a>
                    <a href="#" onclick="singleDel(1043)">删除</a>
				</td>
			</tr>






		</tbody>
	</table>

</form>
</div></div>
</body>


