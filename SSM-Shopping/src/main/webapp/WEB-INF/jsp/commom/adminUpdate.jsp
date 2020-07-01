<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Update Page</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
<div class="modal fade admin-update-modal" tabindex="-1" role="dialog" aria-labelledby="admin-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">管理员更改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_admin_form">
                   <div class="form-group">
                        <label  for="update_static_adminName" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="update_static_adminName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_adminPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="adminPassword" class="form-control" id="update_adminPassword">
                            <span id="helpBlock_update_adminPassword" class="help-block"></span>
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
    <!-- ==========================管理员修改操作=================================== -->
    $(".admin_update_btn").click(function () {
       
        //2 根据Session存储内容查询出对应管理员信息进行回显；
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/admin/getAdmin",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    var admin = result.extendInfo.admin;
                    $("#update_static_adminName").text(admin.adminName);
                    $("#update_adminPassword").val(admin.adminPassword);
                }
            }

        });
        alert($("#update_adminPassword").length);
       
      //  $(".admin_save_btn").attr("updateAdminName", updateAdminName);//看看是否能获取到ID值
    });


    $(".admin_save_btn").click(function () {
    	 var updateAdminName = $("#update_static_adminName").text();
         // var updateAdminName = $(this).attr("updateAdminName");
         
          alert("id"+updateAdminName);
        //5 点击更新按钮，发送AJAX请求到后台进行保存。
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/admin/updateAdminByName/"+updateAdminName,
            type:"PUT",
            data:$(".update_admin_form").serialize(),
            success:function (result) {
                if (result.code==100){
                    alert("管理员信息更改成功！");
                    $(".admin-update-modal").modal("hide");
                    window.location.href="hrms/main";
                }else {
                    alert(result.extendInfo.admin_update_error);
                }
            }
        });

    });
</script>
</body>
</html>