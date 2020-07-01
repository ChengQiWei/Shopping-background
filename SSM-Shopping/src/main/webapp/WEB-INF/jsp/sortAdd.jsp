<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sort Add Page</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
<div class="modal fade sort-add-modal" tabindex="-1" role="dialog" aria-labelledby="sort-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">二级分类新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_sort_form">
                    <div class="form-group">
                        <label for="add_sortName" class="col-sm-2 control-label">二级分类名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="sortName" class="form-control" id="add_sortName" placeholder="如：零食">
                            <span id="helpBlock_add_sortName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_sortKind" class="col-sm-2 control-label">一级分类名称</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="kindId" id="add_sortKind">
                                   <%-- <option value="1">食物</option>--%>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary sort_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    <!-------------------------------------二级分类新增操作-------------------------------------->
    //=======0 点击 员工新增按钮，发送AJAX请求查询部门列表信息，弹出模态框，
    // 将查询得到的部门列表信息显示在对应模态框中部门信息处。=============================
    $(".sort_add_btn").click(function () {

    	 $.ajax({
             url:"<%=request.getContextPath()%>/hrms/kind/getKindName",
             type:"GET",
             success:function (result) {
                 if (result.code == 100){
                     $.each(result.extendInfo.kindList, function () {
                         var optionEle = $("<option></option>").append(this.kindName).attr("value", this.kindId);
                         optionEle.appendTo("#add_sortKind");
                     });
                 }
             }
         });

        $('.sort-add-modal').modal({
            backdrop:static,
            keyboard:true
        });
    });

    //3 保存

    $(".sort_save_btn").click(function () {
    	
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/sort/addSort",
            type:"POST",
            data:$(".add_sort_form").serialize(),
            success:function (result) {
                if (result.code == 100){
                    alert("二级分类新增成功");
                    $('#sort-add-modal').modal("hide");
                    //跳往最后一页，由于新增记录，所以要重新查询总页数
                    $.ajax({
                        url:"<%=request.getContextPath()%>/hrms/sort/getTotalPages",
                        type:"GET",
                        success:function (result) {
                            var totalPage = result.extendInfo.totalPages;
                            window.location.href="hrms/sort/getSortList?pageNo="+totalPage;
                        }
                    })
                } else {
                    alert("二级种类新增失败！");
                }
            }

        });





    });



</script>
</body>
</html>