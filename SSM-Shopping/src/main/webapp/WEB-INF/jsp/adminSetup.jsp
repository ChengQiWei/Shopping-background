<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Setup Page</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
<div class="modal fade admin-setup-modal" tabindex="-1" role="dialog" aria-labelledby="admin-setup-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">管理员注册</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal setup_admin_form">
                    <div class="form-group">
                        <label for="add_adminName" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="adminName" class="form-control" id="add_adminName" >
                            <span id="helpBlock_add_adminName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_adminPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="adminPassword" class="form-control" id="add_adminPassword" >
                            <span id="helpBlock_add_adminPassword" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary admin_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    <!-------------------------------------管理员新增操作-------------------------------------->
    //=======0 点击 员工新增按钮，发送AJAX请求查询部门列表信息，弹出模态框，
    // 将查询得到的部门列表信息显示在对应模态框中部门信息处。=============================
    $(".admin_setup_btn").click(function () {

        $('.admin-setup-modal').modal({
            backdrop:static,
            keyboard:true
        });
    });

    //=========1 当鼠标从姓名输入框移开的时候，判断姓名输入框内的姓名是否重复 ============
    $("#add_adminName").change(function () {
        var adminName = $("#add_adminName").val();
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/admin/checkAdminExists",
            type:"GET",
            data:"adminName="+adminName,
            success:function (result) {
                if (result.code == 100){
                    $("#add_adminName").parent().parent().removeClass("has-error");
                    $("#add_adminName").parent().parent().addClass("has-success");
                    $("#helpBlock_add_adminName").text("用户名可用！");
                    $(".admin_save_btn").attr("btn_name_exists", "success");
                }else {
                    $("#add_adminName").parent().parent().removeClass("has-success");
                    $("#add_adminName").parent().parent().addClass("has-error");
                    $("#helpBlock_add_adminName").text(result.extendInfo.name_reg_error);
                    $(".admin_save_btn").attr("btn_name_exists", "error");
                }
            }
        });
    });

    //3 保存

    $(".admin_save_btn").click(function () {

        //1 获取到第3步：$(".emp_save_btn").attr("btn_name_exists", "success");中btn_name_exists的值
        // btn_name_exists = error，就是姓名重复
        if($(".admin_save_btn").attr("btn_name_exists") == "error"){
            return false;
        }


        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/admin/addAdmin",
            type:"POST",
            data:$(".setup_admin_form").serialize(),
            success:function (result) {
                if (result.code == 100){
                    alert("管理员新增成功");
                    $('#admin-setup-modal').modal("hide");
                    window.location.href = "hrms/login";
                } else {
                    alert("管理员新增失败！");
                }
            }
        });





    });



</script>
</body>
</html>