<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>二级分类管理页面</title>
    <!--用base标签方便后面编程 使用相对路径 ,后面路径前面不加/-->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
<div class="hrms_container">
    <!-- 导航条 -->
    <%@ include file="./commom/head.jsp"%>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="hrms_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="./commom/leftsidebar.jsp"%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="emp_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">二级分类管理</a></li>
                        <li class="active">二级分类信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="emp_table">
                    <thead>
                    <th>二级分类编号</th>
                    <th>二级分类名称</th>
                    <th>一级分类名称</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${sorts}" var="sort">
                            <tr>
                                <td>${sort.sortId}</td>
                                <td>${sort.sortName}</td>
                                <td>${sort.kind.kindName}</td>
                                <td>
                                    <a href="#" role="button" class="btn btn-primary sort_edit_btn" data-toggle="modal" data-target=".sort-update-modal">编辑</a>
                                    <a href="#" role="button" class="btn btn-danger sort_delete_btn">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="panel-body">
                    <div class="table_items">
                        当前第<span class="badge">${curPage}</span>页，共有<span class="badge">${totalPages}</span>页，总记录数<span class="badge">${totalItems}</span>条。
                    </div>
                    <nav aria-label="Page navigation" class="pull-right">
                        <ul class="pagination">
                            <li><a href="hrms/sort/getSortList?pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="hrms/sort/getSortList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPage != itemPage}">
                                    <li><a href="hrms/sort/getSortList?pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="hrms/sort/getSortList?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="./commom/foot.jsp"%>
    </div><!-- /.hrms_body -->
</div><!-- /.container -->

<%@ include file="sortAdd.jsp"%>
<%@ include file="sortUpdate.jsp"%>


<script>
    $(function () {
        //上一页
        var curPage = ${curPage};
        var totalPages = ${totalPages};
        $(".prePage").click(function () {
            if (curPage > 1){
                var pageNo = curPage-1;
                $(this).attr("href", "hrms/sort/getSortList?pageNo="+pageNo);
            }
        });
        //下一页
        $(".nextPage").click(function () {
            if (curPage < totalPages){
                var pageNo = curPage+1;
                $(this).attr("href", "hrms/sort/getSortList?pageNo="+pageNo);
            }
        });
    })

    <!-- ==========================员工删除操作=============================== -->
    $(".sort_delete_btn").click(function () {
        var curPage = ${curPage};
        var delSortId = $(this).parent().parent().find("td:eq(0)").text();
        var delSortName = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除【" + delSortName+ "】的信息吗？")){
            $.ajax({
                url:"<%=request.getContextPath()%>/hrms/sort/deleteSort/"+delSortId,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="hrms/sort/getSortList?pageNo="+curPage;
                    }else {
                        alert(result.extendInfo.emp_del_error);
                    }
                }
            });
        }
    });


</script>
</body>
</html>