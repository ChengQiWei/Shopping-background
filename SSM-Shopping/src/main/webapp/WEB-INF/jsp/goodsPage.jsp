<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
 <title>商品管理页面</title>
    <!--用base标签方便后面编程 使用相对路径 ,后面路径前面不加/-->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
  <style type="text/css">
	#images{
		width: 100px;
		height: 100px;
	}
   </style>
</head>
<body> 
       <div class="hrms_container">
    <!-- 导航条 -->
    <%@ include file="./commom/head.jsp"%>

    <!-- 中间部分（包括左边栏和表单显示部分） -->
    <div class="hrms_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="./commom/leftsidebar.jsp"%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="go_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">商品管理</a></li>
                        <li class="active">商品信息</li>
                         <li>  <form class="navbar-form navbar-left" role="search">
                        <div class="  form-group"  >
                             <input type="text" class="form-control " id="goods_search" placeholder="商品搜索">
                         </div>
                       <button type="submit" class="btn btn-default goods_search_btn">搜索</button>
                       </form>
                          </li>
                    </ol>
                </div>
                 <!-- Table -->
                <table class="table table-bordered table-hover" id="go_table">
                    <thead>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>品牌</th>
                    <th>产地</th>
                    <th>价格</th>
                    <th>详细描述</th>
                    <th>一级分类</th>
                    <th>二级分类</th>
                    <th>上架时间</th>
                    <th>图片</th>
                    <th>数量</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${goodss}" var="goods">
                            <tr>
                                <td>${goods.goId}</td>
                                <td>${goods.goName}</td>
                                <td>${goods.goBrand}</td>
                                <td>${goods.goPlace}</td>
                                <td>${goods.goPrice}</td>
                                <td>${goods.goAbstract}</td>
                                <td>${goods.kind.kindName}</td>
                                <td>${goods.sort.sortName}</td>
                                <td>${goods.goAdddate}</td>
                                <td><c:if test="${goods.goImage != null}">
						<img alt="" src="/image/${goods.goImage}" id="images">
					</c:if></td>
					             <td>${goods.goNum}</td>
                                <td>
                                    <a href="#" role="button" class="btn btn-primary go_edit_btn" data-toggle="modal" data-target=".go-update-modal">编辑</a>
                                    <a href="#" role="button" class="btn btn-danger go_delete_btn">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- 低端翻页效果 -->
                <div class="panel-body">
                    <div class="table_items">
                        当前第<span class="badge">${curPage}</span>页，共有<span class="badge">${totalPages}</span>页，总记录数<span class="badge">${totalItems}</span>条。
                    </div>
                    <nav aria-label="Page navigation" class="pull-right" >
                        <ul class="pagination">
                            <li><a href="hrms/go/getGoList?pageNo=1&goAny=食物">首页</a></li>
                            <c:if test="${curPage==1}">
                                <li class="disabled">
                                    <a href="#" aria-label="Previous" class="prePage">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${curPage!=1}">
                                <li>
                                    <a href="#" aria-label="Previous" class="prePage">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${totalPages<5?totalPages:5}" step="1" var="itemPage">
                                <c:if test="${curPage == itemPage}">
                                    <li class="active"><a href="hrms/go/getGoList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPage != itemPage}">
                                    <li><a href="hrms/go/getGoList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${curPage==totalPages}">
                                <li class="disabled" class="nextPage">
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${curPage!=totalPages}">
                                <li>
                                    <a href="#" aria-label="Next" class="nextPage">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <li><a href="hrms/go/getGoList?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.go_info -->
        
        <!-- 尾部 -->
        <%@ include file="./commom/foot.jsp"%>
    </div><!-- /.hrms_body -->
</div><!-- /.container -->

<%@ include file="goodsAdd.jsp"%> 
<%@ include file="goodsUpdate.jsp"%> 

<script>
    $(function () {
        //上一页
        var curPage = ${curPage};
        var totalPages = ${totalPages};
        $(".prePage").click(function () {
            if (curPage > 1){
                var pageNo = curPage-1;
                $(this).attr("href", "hrms/go/getGoList?pageNo="+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "hrms/go/getGoList?pageNo="+pageNo);
            }
        });
    })

    <!-- ==========================商品删除操作============================== -->
    $(".go_delete_btn").click(function () {
        var curPage = ${curPage};
        var delGoId = $(this).parent().parent().find("td:eq(0)").text();
        var delGoName = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除【" + delGoName+ "】的信息吗？")){
            $.ajax({
                url:"<%=request.getContextPath()%>/hrms/go/deleteGo/"+delGoId,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="hrms/go/getGoList?pageNo="+curPage;
                    }else {
                        alert(result.extendInfo.go_del_error);
                    }
                }
            });
        }
    });
    //商品搜索操作
    $(".goods_search_btn").click(function () {
        var goAny = $("#goods_search").val();
        alert(goAny);
        $.ajax({
        	url:"<%=request.getContextPath()%>/hrms/go/getGoList?pageNo=1&goAny=沐浴露",
            type:"DELETE",
        });
        
        
    });


</script>
      
</body>
</html>