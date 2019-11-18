<%@ include file="/ecps/console/common/taglibs.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <title>品牌管理_商品管理</title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="brand" content="brandName"/>
    <script type="text/javascript">

    </script>
</head>
<body id="main">
<div class="frameL">
    <div class="menu icon">
        <jsp:include page="/${system}/common/itemmenu.jsp"/>
    </div>
</div>

<div class="frameR">
    <div class="content">

        <div class="loc icon"><samp class="t12"></samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<span class="gray">品牌管理</span></div>

        <form id="form1" name="form1" action="${base}/item/brand/listBrand.do" method="post">
            <div class="page_c">
        
        <span class="r inb_a">
            <a href="${path }/item/toAddBrand.do" title="添加" class="btn80x20">添加</a>
        </span>
            </div>

            <table cellspacing="0" summary="" class="tab">
                <thead>
                <tr>
                    <th>品牌编号</th>
                    <th>品牌图片</th>
                    <th>品牌名称</th>
                    <th>品牌网址</th>
                    <th>品牌描述</th>
                    <th width="10%">排序</th>
                    <th width="10%">操作</th>
                </tr>

                </thead>
                <tbody>
                <c:forEach items="${bList}" var="brand">
                    <tr>
                        <td>${brand.brandId}</td>
                        <td>
                            <img id='imgsImgSrc' src="http://b.hiphotos.baidu.com/image/pic/item/32fa828ba61ea8d3fcd2e9ce9e0a304e241f5803.jpg"
                                 height="50"
                                 width="50"/></td>
                        <td>${brand.brandName}</td>
                        <td class="nwp">${brand.website}</td>
                        <td class="nwp">${brand.brandDesc}</td>
                        <td>${brand.brandSort}</td>
                        <td>
                            <a href="${path }/WEB-INF/shop/item/editbrand.jsp?brandId=3185">编辑</a>
                            <a href="#" onclick="singleDel(3185)">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </form>
    </div>
</div>
</body>


