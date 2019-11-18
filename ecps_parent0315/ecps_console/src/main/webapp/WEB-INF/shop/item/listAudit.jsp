<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>实体商品管理_商品审核</title>
<meta name="heading" content="商品审核"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">



	$(function(){
		//获得总记录数
    	var totalCount = parseInt($("#totalCount").val());
    	//获得当前页
    	var currentPageNo = parseInt($("#currentPageNo").val());
    	//总页数
    	var totalPage = parseInt($("#totalPage").val());
    	
    	/* <span class="r page">
        <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
        <input type="hidden" value="${page.totalCount}" id="totalCount" name="totalCount" />
        <input type="hidden" value="${page.pageNo}" id="currentPageNo" name="currentPageNo" />
        <input type="hidden" value="${page.pageNum}" id="totalPage" name="totalPage" />
                共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var>
        <a href="javascript:void(0);" id="previous"  title="上一页">上一页</a>
        <a href="javascript:void(0);" id="next"  title="下一页">下一页</a>
    </span> */
    	
    	//设置总记录数
    	$("#pagePiece").html(totalCount);
    	//设置当前页和总页数
    	
    	$("#pageTotal").html(currentPageNo+"/"+totalPage);
    	//如果当前页是第一页并且总记录数小于每页的记录数
    	if(currentPageNo <= 1 && totalCount < 5){
    		$("#previous").hide();
    		$("#next").hide();
    		//如果当前页是第一页并且总记录数大于每页的记录数
    	}else if(currentPageNo <= 1 && totalCount >= 5){
    		$("#next").show();	
    		$("#previous").hide();
    		//如果当前页是最后一页并且总页数是只有一页
    	}else if(currentPageNo >= totalPage && totalPage == 1){
    		$("#next").hide();
    		$("#previous").hide();
    		//如果当前页是最后一页并且总页数是不只一页
    	}else if(currentPageNo >= totalPage && totalPage != 1){
    		$("#next").hide();
    		$("#previous").show();
    	}
    	//点击下一页对表单的提交
    	$("#next").click(function(){
    		if(currentPageNo < totalPage){
    			$("#pageNo").val(currentPageNo+1);
    		}else{
    			$("#pageNo").val(currentPageNo);
    		}
    		$("#form1").submit();
    	});
    	//点击上一页对表单的提交
    	$("#previous").click(function(){
    		if(currentPageNo > 1){
    			$("#pageNo").val(currentPageNo-1);
    		}else{
    			$("#pageNo").val(currentPageNo);
    		}
    		$("#form1").submit();
    	});
    	
    	$("a[pass]").click(function(){
    		var itemId = $(this).attr("itemId");
    		if(confirm("确认要通过吗？")){
    			window.location.href = "${path}/item/updateStatus.do?itemId="+itemId+"&auditStatus=1"
    		}
    	});
    	$("a[nopass]").click(function(){
    		var itemId = $(this).attr("itemId");
    		if(confirm("确认要不通过吗？")){
    			window.location.href = "${path}/item/updateStatus.do?itemId="+itemId+"&auditStatus=2"
    		}
    	});
    	
    	
    	
	});

    $(document).ready(function(){
    	var obj=null;
    	$("a[group]").click(function(){
    		$("#errorInfoAdd").html("<label>&nbsp;</label>");
		    $("#itemNote").val("");
		    tipHide("#errorInfoAdd");
			tipShow('#addItemNote');
			var d=$("#addItemNote h2").attr("title","商品审核").html("商品审核");
    		obj=$(this);
		});
    	$("input[id='confirmDivOk']").click(function(){
            var form = document.getElementById("form1");
            form.action = objDelUrl + "?itemId=" + objItemId;
            form.submit();
        })
    	$("input[id='addItemNoteConfirm']").click(function(){
    		if(obj==null){
    			return;
    		}
    		var value=obj.attr("group");
			var itemId=value.split(",")[0];
			var auditStatus=value.split(",")[1];
			var itemNote=$("#itemNote").val();
			if(itemNote.length>90){
				tipShow("#errorInfoAdd");
				$("#errorInfoAdd").html("<label>&nbsp;</label>操作备注不能大于90个字符");
				return;
			}
			var ajaxData="itemId="+itemId+"&auditStatus="+auditStatus+"&itemNote="+itemNote;
	        $.ajax({
	        	type:"post",
	         	url:"${base}/item/updateItem.do",
	         	data:(ajaxData),
	         	success:function(responseText){
	            	var result=eval("("+responseText+")");
	             	if(result._status=="true"){
	             		alert("操作成功");
	             		window.location.href=window.location.href;
	             	}else{
	             		alert(result._mes);
	             	}
	             	tipHide('#addItemNote');
	        	}
	        });
    	});
    	
    	
    });
    
    function orderBy(orderBy,orderByStatus){
        $("#orderBy").val(orderBy);//代表按那个字段排序
        $("#orderByStatus").val(orderByStatus);//代表排序方式，即升序还是降序
        goSearch('#form1','#userSearch');
    }

    $(document).ready(function(){
        searchText('#searchText','#userSearch',40);
        pageInitialize('#form1','#userSearch');
        $('#goSearch').click(function(){        	
            $("#pageNo").val(1);
            goSearch('#form1','#userSearch');
        });
    });

    function singleDel(itemId) {
        var delChkUrl = $("#deleteCheckAction").val();
        
        var options = {
                beforeSubmit: showDeleteCheckRequest,
                success:      showDeleteCheckResponse,
                type:         'post',
                dataType:     "script",
                data:{
                    'itemId':itemId
                },
                url:          delChkUrl
        };
        $('#form1').ajaxSubmit(options);
    }

    function showDeleteCheckRequest(formData, jqForm, options) {
        return true;
    }

    function showDeleteCheckResponse(responseText, statusText, xhr, $form) {
        responseText = $.parseJSON(responseText);
        var status = responseText[0].deleteAble;
        if (status == "true") {
            var itemId = responseText[0].itemId;
            var delUrl = $("#deleteAction").val();
            tipShow('#confirmDiv');
            objItemId = itemId;
            objDelUrl = delUrl;
        } else if (status == "false") {
            alert(responseText[0]._mes);
        } else {
            alert("删除失败！");
        }

    }
    $(document).ready(function(){
        if($("#auditStatus").val()=='0'){
            $("#label1") .attr("class","here");
        }
        else if($("#auditStatus").val()==2){
            $("#label2") .attr("class","here");
        }
       else  if($("#auditStatus").val()==1){
            $("#label3") .attr("class","here");
        }
        else $("#label4") .attr("class","here");
    })

</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"><</samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<span class="gray" title="商品审核">商品审核</span></div>

    <h2 class="h2_ch"><span id="tabs" class="l">
        <a id="label4" href="${base}/item/listAudit.do"   title="全部实体商品" class="nor">全部</a>
        <a id="label1" href="${path}/item/queryItemByConditionForAudit.do?auditStatus=0&showStatus=1" title="待审核实体商品" class="nor">待审核</a>
        <a id="label2" href="${path}/item/queryItemByConditionForAudit.do?auditStatus=2&showStatus=1"  title="审核不通过实体商品" class="nor">审核不通过</a>
        <a id="label3" href="${path}/item/queryItemByConditionForAudit.do?auditStatus=1&showStatus=1"   title="已审核实体商品" class="nor">已审核</a>
    </span></h2>

<form id="form1" name="form1" action="${base}/item/listAudit.do" method="post">
    <input type="hidden" id="deleteAction" name="deleteAction" value="${base}/item/deleteItem.do" />
    <input type="hidden" id="deleteCheckAction" name="deleteCheckAction" value="${base}/item/deleteCheck.do" />
    <input type="hidden" id="auditStatus" name="auditStatus" value="${auditStatus}" />
    <input type="hidden" id="showStatus" name="showStatus" value="${showStatus}" />
    <div class="sch">
        <input type="hidden" id="userSearch" name="userSearch" />
        <p>查询：
        <ui:select name="catID" list="catList" rootId="0" defaulttext="所有分类" defaultvalue="" currentValue="${catID}"/>
        <select id="brandId" name="brandId" value="${brandId}">
            <option value="">全部品牌</option>
            <c:forEach items='${brandList}' var="brand">
                <option value="${brand.brandId}"<c:if test='${brandId==brand.brandId}'> selected </c:if>>${brand.brandName}</option>
            </c:forEach>
        </select><select  id="stock" name="stock" style="display:none;">
            <option value="-1" selected="">全部库存</option>
            <option value="0"<c:if test='${stock==0}'> selected</c:if>>已缺货</option>
            <option value="1"<c:if test='${stock==1}'> selected</c:if>>即将缺货</option>
        </select><input type="text" id="searchText" name="searchText" value="${userSearch}" title="请输入商品编号或商品名称" class="text20 medium gray" /><input type="submit" id="goSearch" class="hand btn60x20" value="查询" />
    </p></div>


	<table cellspacing="0" summary="" class="tab" id="myTable">
		<thead>
			<th>商品编号</th>
            <th class="wp">商品名称</th>
            <th>图片</th>
			<th>新品</th>
			<th>推荐</th>
			<th>特价</th>
            <th>上下架</th>
            <th>审核状态</th>
			<th>操作</th>
		</thead>
		<tbody>
			<tr>
				<td>00000</td>
                <td >诺基亚</td>
                <td><img alt="" src="http://localhost:8081/pic/upload//upload/ecps/resource/137845734695207145028.jpg" width="50" height="50"></td>
				
				<td>
					
					
				</td>
				<td>
					
					
					
				</td>
				<td>
					
					
					
				</td>
                <td>
                	<span class="not" ></span>
					
					
                </td>
                <td>
                	
					
					
					待审核
					
                </td>
               
				<td>
					
					
					
						<a href="#"title="查看">查看</a>
				  			<a href="#" pass="yes" itemId="3166">通过</a>
				  			<a href="#" nopass="no" itemId="3166">不通过</a>
					
							
					  		
					  		
					  			
					  			
				</td>
			</tr>
			
			
			<tr>
				<td>00000</td>
                <td >gggg</td>
                <td><img alt="" src="http://localhost:8081/pic/upload//upload/ecps/resource/137845627095775028160.jpg" width="50" height="50"></td>
				
				<td>
					<span class="is" ></span>
					
				</td>
				<td>
					
					
					
				</td>
				<td>
					
					
					
				</td>
                <td>
                	<span class="not" ></span>
					
					
                </td>
                <td>
                	
					
					
					待审核
					
                </td>
               
				<td>
					
					
					
						<a href="#"title="查看">查看</a>
				  			<a href="#" pass="yes" itemId="3165">通过</a>
				  			<a href="#" nopass="no" itemId="3165">不通过</a>
					
							
					  		
					  		
					  			
					  			
				</td>
			</tr>
			
			
			<tr>
				<td>00000</td>
                <td >fff</td>
                <td><img alt="" src="http://localhost:8081/pic/upload//upload/ecps/resource/137845607980976917261.jpg" width="50" height="50"></td>
				
				<td>
					<span class="is" ></span>
					
				</td>
				<td>
					
					
					
				</td>
				<td>
					
					
					
				</td>
                <td>
                	<span class="not" ></span>
					
					
                </td>
                <td>
                	
					
					
					待审核
					
                </td>
               
				<td>
					
					
					
						<a href="#"title="查看">查看</a>
				  			<a href="#" pass="yes" itemId="3164">通过</a>
				  			<a href="#" nopass="no" itemId="3164">不通过</a>
					
							
					  		
					  		
					  			
					  			
				</td>
			</tr>
			
			
			<tr>
				<td>00000</td>
                <td >iphone</td>
                <td><img alt="" src="http://localhost:8081/pic/upload//upload/ecps/resource/137845597721969962721.jpg" width="50" height="50"></td>
				
				<td>
					<span class="is" ></span>
					
				</td>
				<td>
					
					
					
				</td>
				<td>
					
					
					
				</td>
                <td>
                	<span class="not" ></span>
					
					
                </td>
                <td>
                	
					
					
					待审核
					
                </td>
               
				<td>
					
					
					
						<a href="#"title="查看">查看</a>
				  			<a href="#" pass="yes" itemId="3163">通过</a>
				  			<a href="#" nopass="no" itemId="3163">不通过</a>
					
							
					  		
					  		
					  			
					  			
				</td>
			</tr>
			
			
			<tr>
				<td>1 0003101</td>
                <td >galax S3</td>
                <td><img alt="" src="http://localhost:8081/pic/upload//upload/ecps/resource/137809208432022454146.jpg" width="50" height="50"></td>
				
				<td>
					<span class="is" ></span>
					
				</td>
				<td>
					
					
					
				</td>
				<td>
					
					
					
				</td>
                <td>
                	<span class="not" ></span>
					
					
                </td>
                <td>
                	
					
					
					待审核
					
                </td>
               
				<td>
					
					
					
						<a href="#"title="查看">查看</a>
				  			<a href="#" pass="yes" itemId="3121">通过</a>
				  			<a href="#" nopass="no" itemId="3121">不通过</a>
					
							
					  		
					  		
					  			
					  			
				</td>
			</tr>

		
		
			

		
			
			

		
			
			</tbody>
			<tr>
				<td colspan="13" align="right">
                选择：<a href="javascript:void(0);" title="全选" onclick="checkAllIds();">全选</a>
                <samp>-</samp> <a href="javascript:void(0);" title="取消" onclick="uncheckAllIds();">取消</a>
				</td>
			</tr>
	</table>
    
	<div class="page_c">
        <span class="l inb_a">
        </span>
        <span class="r page">
            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
            <input type="hidden" value="${page.totalCount}" id="totalCount" name="totalCount" />
            <input type="hidden" value="${page.pageNo}" id="currentPageNo" name="currentPageNo" />
            <input type="hidden" value="${page.pageNum}" id="totalPage" name="totalPage" />
                    共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var>
            <a href="javascript:void(0);" id="previous"  title="上一页">上一页</a>
            <a href="javascript:void(0);" id="next"  title="下一页">下一页</a>
        </span>
    </div>
</form>
</div></div>
 </body>