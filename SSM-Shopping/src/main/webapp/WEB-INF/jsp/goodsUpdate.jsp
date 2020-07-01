<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
 <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
 <title>Goods Update Page</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
    
    <div class="modal fade go-update-modal" tabindex="-1" role="dialog" aria-labelledby="go-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">商品更改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_go_form" enctype="multipart/form-data"  method="post">
                    <div class="form-group">
                        <label  for="update_static_goName" class="col-sm-2 control-label">商品名称</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="update_static_goName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_goBrand" class="col-sm-2 control-label">品牌</label>
                        <div class="col-sm-8">
                            <input type="text" name="goBrand" class="form-control" id="update_goBrand" >
                            <span id="helpBlock_update_goBrand" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_goPlace" class="col-sm-2 control-label">产地</label>
                        <div class="col-sm-8">
                            <input type="text" name="goPlace" class="form-control" id="update_goPlace" >
                            <span id="helpBlock_update_goPlace" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_goPrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-8">
                            <input type="number" step="0.01" name="goPrice" class="form-control" id="update_goPrice" >
                            <span id="helpBlock_update_goName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_goAbstract" class="col-sm-2 control-label">详细描述</label>
                        <div class="col-sm-8">
                            <input type="text" name="goAbstract" class="form-control" id="update_goAbstract" >
                            <span id="helpBlock_update_goAbstract" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_goKind" class="col-sm-2 control-label">一级分类</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="goKind" id="update_goKind">
                                   <%-- <option value="1">食品</option>--%>
                                </select>
                            </div>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="update_goSort" class="col-sm-2 control-label">二级分类</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="goSort" id="update_goSort" >
                                   <%-- <option value="1">零食</option>--%>
                                </select>
                            </div>
                        </div>
                    </div>
                  <!--   <div class="form-group">
                        <label for="update_goAdddate" class="col-sm-2 control-label">上架时间</label>
                        <div class="col-sm-8">
                            <input type="date" name="goAdddate" class="form-control" id="update_goAdddate" >
                            <span id="helpBlock_update_goName" class="help-block"></span>
                        </div>
                    </div> 
                    -->
                    <div class="form-group">
                        <label for="update_goImage" class="col-sm-2 control-label">图片</label>
                        <div class="col-sm-8">
                            <input type="file" name="goImage" class="form-control" id="update_goImage" >  
                            <span id="helpBlock_update_goImage" class="help-block"></span>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="update_goNum" class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-8">
                            <input type="number"  name="goNum" class="form-control" id="update_goNum" >
                            <span id="helpBlock_update_goNum" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
           
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary go_update_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">
    <!-- ==========================商品修改操作=================================== -->
    $(".go_edit_btn").click(function () {
        //1 获取点击修改商品的id与name;
        var updateGoId = $(this).parent().parent().find("td:eq(0)").text();
        //alert("id"+updateGoId);
        //2 根据id或name查询出对应商品信息进行回显；
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/go/getGoById/"+updateGoId,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    var go = result.extendInfo.goods;
                    $("#update_static_goName").text(go.goName);
                    $("#update_goBrand").val(go.goBrand);
                    $("#update_goPlace").val(go.goPlace);
                    $("#update_goPrice").val(go.goPrice);
                    $("#update_goAbstract").val(go.goAbstract);
                    $("#update_goKind").val(go.goKind);
                    $("#update_goSort").val(go.goSort);
                    //$("#update_goAdddate").val(go.goAdddate);
                   // $("#update_goImage").val(go.goImage);
                    $("#update_goNum").val(go.goNum);
                   
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
                        optEle.appendTo("#update_goKind");
                    });
                }
            }

        });
        
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/sort/getSortName",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extendInfo.sortList, function () {
                        var optEle = $("<option></option>").append(this.sortName).attr("value", this.sortId);
                        optEle.appendTo("#update_goSort");
                    });
                }
            }

        });

        $(".go_update_btn").attr("updateGoId", updateGoId);
    });


    $(".go_update_btn").click(function () {
    	 var updateGoId = $(this).attr("updateGoId");

        //5 点击更新按钮，发送AJAX请求到后台进行保存。
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/go/updateGo/"+updateGoId,
            data:$(".update_go_form").serialize(),
            processData: false, //因为data值是FormData对象，不需要对数据做处理。
            contentType: false,
            type:"POST",
            success:function (result) {
                if (result.code==100){
                    alert("商品更改成功！");
                    $(".go-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="hrms/go/getGoList?pageNo="+curPage;
                }else {
                    alert(result.extendInfo.go_update_error);
                }
            }
        });

    });
</script>

</body>
</html>