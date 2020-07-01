<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart Update Page</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
<div class="modal fade cart-update-modal" tabindex="-1" role="dialog" aria-labelledby="cart-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">购物车信息更改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_cart_form">
                    <div class="form-group">
                        <label  for="update_static_cartName" class="col-sm-2 control-label">用户</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="update_static_cartName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_cartPrice" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-8">
                            <input type="number" step="0.01" name="cartPrice" class="form-control" id="update_cartPrice">
                            <span id="helpBlock_update_cartPrice" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_cartNum" class="col-sm-2 control-label">个数</label>
                        <div class="col-sm-8">
                            <input type="number"  name="cartNum" class="form-control" id="update_cartNum">
                            <span id="helpBlock_update_cartNum" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_cartAbstract" class="col-sm-2 control-label">详细</label>
                        <div class="col-sm-8">
                            <input type="text" name="cartAbstract" class="form-control" id="update_cartAbstract">
                            <span id="helpBlock_update_cartAbstract" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary cart_update_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">
    <!-- ==========================购物车修改操作=================================== -->
    $(".cart_edit_btn").click(function () {
        //1 获取点击修改购物车的id与name;
        var updateCartId = $(this).parent().parent().find("td:eq(0)").text();

        //2 根据id或name查询出对应购物车信息进行回显；
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/cart/getCartById/"+updateCartId,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    var cart = result.extendInfo.cart;
                    $("#update_static_cartName").text(cart.user.userName);
                    $("#update_cartPrice").val(cart.cartPrice);
                    $("#update_cartNum").val(cart.cartNum);
                    $("#update_cartAbstract").val(cart.cartAbstract);
                }
            }

        });


        $(".cart_update_btn").attr("updateCartId", updateCartId);
    });


    $(".cart_update_btn").click(function () {
        var updateCartId = $(this).attr("updateCartId");
    
        //5 点击更新按钮，发送AJAX请求到后台进行保存。
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/cart/updateCart/"+updateCartId,
            type:"PUT",
            data:$(".update_cart_form").serialize(),
            success:function (result) {
                if (result.code==100){
                    alert("购物车更改成功！");
                    $(".cart-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="hrms/cart/getCartList?pageNo="+curPage;
                }else {
                    alert(result.extendInfo.cart_update_error);
                }
            }
        });

    });
</script>
</body>
</html>
