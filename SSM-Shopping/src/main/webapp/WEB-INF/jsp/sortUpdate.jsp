<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sort Update Page</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
<div class="modal fade sort-update-modal" tabindex="-1" role="dialog" aria-labelledby="sort-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">二级种类更改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_sort_form">
                    <div class="form-group">
                        <label for="update_sortName" class="col-sm-2 control-label">二级分类名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="sortName" class="form-control" id="update_sortName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_sortKind" class="col-sm-2 control-label">一级分类名称</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="kindId" id="update_sortKind">
                                    <%-- <option value="1">食物</option>--%>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary sort_update_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">
    <!-- ==========================员工修改操作=================================== -->
    $(".sort_edit_btn").click(function () {
        //1 获取点击修改员工的id与name;
        var updateSortId = $(this).parent().parent().find("td:eq(0)").text();

        //2 根据id或name查询出对应员工信息进行回显；
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/sort/getSortById/"+updateSortId,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    var sort = result.extendInfo.sort;
                    $("#update_sortName").val(sort.sortName);
                    $("#update_sortKind").val(sort.sortKind);
                }
            }

        });

        //2 种类回显列表；
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/kind/getKindName",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extendInfo.kindList, function () {
                        var optEle = $("<option></option>").append(this.kindName).attr("value", this.kindId);
                        optEle.appendTo("#update_sortKind");
                    });
                }
            }

        });

        $(".sort_update_btn").attr("updateSortId", updateSortId);
    });


    $(".sort_update_btn").click(function () {
        var updateSortId = $(this).attr("updateSortId");

        //5 点击更新按钮，发送AJAX请求到后台进行保存。
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/sort/updateSort/"+updateSortId,
            type:"PUT",
            data:$(".update_sort_form").serialize(),
            success:function (result) {
                if (result.code==100){
                    alert("二级分类更改成功！");
                    $(".sort-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="hrms/sort/getSortList?pageNo="+curPage;
                }else {
                    alert(result.extendInfo.sort_update_error);
                }
            }
        });

    });
</script>
</body>
</html>