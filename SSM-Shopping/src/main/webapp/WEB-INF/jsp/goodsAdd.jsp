<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
 <title>Goods Add Page</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
     
     <div class="modal fade go-add-modal" tabindex="-1" role="dialog" aria-labelledby="go-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">商品新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_go_form">
                    <div class="form-group">
                        <label for="add_goName" class="col-sm-2 control-label">商品名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="goName" class="form-control" id="add_goName" placeholder="如：奶粉">
                            <span id="helpBlock_add_goName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_goBrand" class="col-sm-2 control-label">品牌</label>
                        <div class="col-sm-8">
                            <input type="text" name="goBrand" class="form-control" id="add_goBrand" placeholder="如：君乐宝">
                            <span id="helpBlock_add_goBrand" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_goPlace" class="col-sm-2 control-label">产地</label>
                        <div class="col-sm-8">
                            <input type="text" name="goPlace" class="form-control" id="add_goPlace" placeholder="如：内蒙古">
                            <span id="helpBlock_add_goPlace" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_goPrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-8">
                            <input type="number" step="0.01" name="goPrice" class="form-control" id="add_goPrice" placeholder="如：108.5">
                            <span id="helpBlock_add_goName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_goAbstract" class="col-sm-2 control-label">详细描述</label>
                        <div class="col-sm-8">
                            <input type="text" name="goAbstract" class="form-control" id="add_goAbstract" placeholder="如：双十一秒杀价">
                            <span id="helpBlock_add_goAbstract" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_goKind" class="col-sm-2 control-label">一级分类</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="goKind" id="add_goKind">
                                   <%-- <option value="1">食品</option>--%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_goSort" class="col-sm-2 control-label">二级分类</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <select class="form-control" name="goSort" id="add_goSort">
                                   <%-- <option value="1">零食</option>--%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!--  <div class="form-group">
                        <label for="add_goAdddate" class="col-sm-2 control-label">上架时间</label>
                        <div class="col-sm-8">
                            <input type="text"  class="form-control"   name="goAdddate" id="add_goAdddate" placeholder="如：2020-05-01">
                            <span id="helpBlock_add_goName" class="help-block"></span>
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label for="add_goImage" class="col-sm-2 control-label">图片</label>
                        <div class="col-sm-8">
                            <input type="file" name="goImage" class="form-control" id="add_goImage" >
                            <span id="helpBlock_add_goImage" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_goNum" class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-8">
                            <input type="number"  name="goNum" class="form-control" id="add_goNum" placeholder="如：10">
                            <span id="helpBlock_add_goNum" class="help-block"></span>
                        </div>
                    </div>
                    
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary go_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    <!-------------------------------------商品新增操作-------------------------------------->
    //=======0 点击 商品新增按钮，发送AJAX请求查询种类列表信息，弹出模态框，
    // 将查询得到的种类列表信息显示在对应模态框中种类信息处。=============================
    $(".go_add_btn").click(function () {

        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/kind/getKindName",
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    $.each(result.extendInfo.kindList, function () {
                        var optionEle = $("<option></option>").append(this.kindName).attr("value", this.kindId);
                        optionEle.appendTo("#add_goKind");
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
                        var optionEle = $("<option></option>").append(this.sortName).attr("value", this.sortId);
                        optionEle.appendTo("#add_goSort");
                    });
                }
            }
        });

        $('.go-add-modal').modal({
            backdrop:static,
            keyboard:true
        });
    });

 

    //3 保存

    $(".go_save_btn").click(function () {

        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/go/addGo",
            type:"POST",
            data:$(".add_go_form").serialize(),
            success:function (result) {
                if (result.code == 100){
                    alert("商品新增成功");
                    $('#go-add-modal').modal("hide");
                    //跳往最后一页，由于新增记录，所以要重新查询总页数
                    $.ajax({
                        url:"<%=request.getContextPath()%>/hrms/go/getTotalPages",
                        type:"GET",
                        success:function (result) {
                            var totalPage = result.extendInfo.totalPages;
                            window.location.href="hrms/go/getGoList?pageNo="+totalPage;
                        }
                    })
                } else {
                    alert("商品新增失败！");
                }
            }

        });

    });

</script>


</body>
</html>