<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>分类新增页面</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
<div class="modal fade kind-add-modal" tabindex="-1" role="dialog" aria-labelledby="kind-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">一级分类新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_kind_form">
                    <div class="form-group">
                        <label for="add_kindName" class="col-sm-2 control-label">一级分类名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="kindName" class="form-control" id="add_kindName" placeholder="食品">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary kind_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    <!-- ==========================部门新增操作=================================== -->
    // 为简单操作，省去了输入名称的验证、错误信息提示等操作
    //1 点击部门新增按钮，弹出模态框
    //2 输入新增部门信息，点击保存按钮，发送AJAX请求到后台进行保存；
    //3 保存成功跳转最后一页
    $(".kind_add_btn").click(function () {
        $('.kind-add-modal').modal({
        	 backdrop:static,
            keyboard:true
        });

    });

    $(".kind_save_btn").click(function () {
        var kindName = $("#add_kindName").val();
        //验证省略...
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/kind/addKind",
            type:"PUT",
            data:$(".add_kind_form").serialize(),
            success:function (result) {
                if(result.code == 100){
                    alert("新增成功");
                    $('.kind-add-modal').modal("hide");
                    $.ajax({
                        url:"<%=request.getContextPath()%>/hrms/kind/getTotalPages",
                        type:"GET",
                        success:function (result) {
                            if (result.code == 100){
                                var totalPage = result.extendInfo.totalPages;
                                window.location.href="hrms/kind/getKindList?pageNo="+totalPage;
                            }
                        }
                    });
                }else {
                    alert(result.extendInfo.add_kind_error);
                }
            }
        });



    });



</script>
</body>
</html>