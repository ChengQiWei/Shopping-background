<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分类更改页面</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
<div class="modal fade kind-update-modal" tabindex="-1" role="dialog" aria-labelledby="kind-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">分类更改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_kind_form">
                    <div class="form-group">
                        <label for="update_kindName" class="col-sm-2 control-label">一级分类名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="kindName" class="form-control" id="update_kindName">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary kind_update_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">
    <!-- ==========================分类新增操作=================================== -->
    //1 点击编辑按钮，发送AJAX请求查询对应id的分类信息，进行回显；
    //2 进行修改，点击更新按钮发送AJAX请求，将更改后的信息保存到数据库中；
    //3 跳转到当前更改页；
    
    var curPageNo = ${curPageNo};

    $(".kind_edit_btn").click(function () {
       var  updateKindId = $(this).parent().parent().find("td:eq(0)").text();
        alert("id"+updateKindId);
        //查询对应deptId的部门信息
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/kind/getKindById/"+updateKindId,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    var kindData = result.extendInfo.kind;
                    //回显
                    $("#update_kindName").val(kindData.kindName);
                }else {
                    alert(result.extendInfo.get_kind_error);
                }
            }
        });
        $(".kind_update_btn").attr("updateKindId", updateKindId);
    });

    $(".kind_update_btn").click(function () {
    	 var updateKindId = $(this).attr("updateKindId");
    	 alert("id"+updateKindId);
    	 
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/kind/updateKind/"+updateKindId,
            type:"PUT",
            data:$(".update_kind_form").serialize(),
            success:function (result) {
                if(result.code == 100){
                    alert("更新成功！");
                    window.location.href = "hrms/kind/getKindList?pageNo="+curPageNo;
                } else {
                    alert(result.extendInfo.update_kind_error);
                }
            }

        });
    });


</script>
</body>
</html>