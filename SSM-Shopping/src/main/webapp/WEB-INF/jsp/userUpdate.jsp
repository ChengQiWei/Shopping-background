<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
 <title>User Update Page</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
     <div class="modal fade user-update-modal" tabindex="-1" role="dialog" aria-labelledby="user-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户更改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_user_form"><!-- 更新表单 -->
                    <div class="form-group">
                        <label  for="update_static_userName" class="col-sm-2 control-label">昵称</label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="update_static_userName"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_userPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="userPassword" class="form-control" id="update_userPassword" >
                            <span id="helpBlock_update_inputPassword" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" checked="checked" name="gender" id="add_inputGender1" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="add_inputGender2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_userPhone" class="col-sm-2 control-label">电话号码</label>
                        <div class="col-sm-8">
                            <input type="text" name="userPhone" class="form-control" id="update_userPhone" >
                            <span id="helpBlock_update_inputPhone" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_userAddress" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="userAddress" class="form-control" id="update_userAddress" placeholder="xx省xx市xx区xx街道xx号">
                            <span id="helpBlock_add_inputAddress" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_userCity" class="col-sm-2 control-label">城市</label>
                        <div class="col-sm-8">
                            <input type="text" name="city" class="form-control" id="update_userCity" >
                            <span id="helpBlock_update_inputCity" class="help-block"></span>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="update_userEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8"><!-- 使用email类型，html自动对输入邮箱格式进行验证 -->
                            <input type="email" name="email" class="form-control" id="update_userEmail" >
                            <span id="helpBlock_update_inputEmail" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_userPostcode" class="col-sm-2 control-label">邮编</label>
                        <div class="col-sm-8">
                            <input type="text" name="userPostcode" class="form-control" id="update_userPostcode" >
                            <span id="helpBlock_update_inputPostcode" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_userPayment" class="col-sm-2 control-label">账户余额</label>
                        <div class="col-sm-8">
                            <input type="number" step="0.01" name="payment" class="form-control" id="update_userPayment" >
                            <span id="helpBlock_update_inputPayment" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary user_update_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script type="text/javascript">
    <!-- ==========================用户修改操作=================================== -->
    $(".user_edit_btn").click(function () {
        //1 获取点击修改用户的id与name;
        var updateUserId = $(this).parent().parent().find("td:eq(0)").text();

        //2 根据id或name查询出对应用户信息进行回显；
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/user/getUserById/"+updateUserId,
            type:"GET",
            success:function (result) {
                if (result.code == 100){
                    var use = result.extendInfo.user;
                    $("#update_static_userName").text(use.userName);
                    $("#update_userPassword").val(use.userPassword);
                    $(".user-update-modal input[name=gender]").val([use.gender]);
                    $("#update_userPhone").val(use.userPhone);
                    $("#update_userAddress").val(use.userAddress);
                    $("#update_userCity").val(use.city);
                    $("#update_userEmail").val(use.email);
                    $("#update_userPostcode").val(use.userPostcode);
                    $("#update_userPayment").val(use.payment);
                }
            }

        });

        //$(selector).attr(attribute,value) attr() 方法设置或返回被选元素的属性值。
        $(".user_update_btn").attr("updateUserId", updateUserId);
    });


    $(".user_update_btn").click(function () {
        var updateUserId = $(this).attr("updateUserId");
        //4 进行修改，对修改的邮箱格式进行判断；
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        var regPhone=  /^(13[0-9]{9}|15[0-9]{9}|[0-9]{7,8}|0[0-9]{2,3}\-[0-9]{7,8}(\-[0-9]{0-4})?)$/;
        var updateUserEamil = $("#update_userEmail").val();
        var updateUserPhone = $("#update_userPhone").val();
        if (!regEmail.test(updateUserEamil)){
            $("#update_userEmail").parent().parent().removeClass("has-sucess");
            $("#update_userEmail").parent().parent().addClass("has-error");
            $("#helpBlock_update_inputEmail").text("邮箱格式不正确！");
            return false;
        }else {
            $("#update_userEmail").parent().parent().removeClass("has-error");
            $("#update_userEmail").parent().parent().addClass("has-success");
            $("#helpBlock_update_inputEmail").text("");
        }
        //检查电话号码格式
        if (!regPhone.test(updateUserPhone)){
            $("#update_userPhone").parent().parent().removeClass("has-sucess");
            $("#update_userPhone").parent().parent().addClass("has-error");
            $("#helpBlock_update_inputPhone").text("电话号码格式不正确！");
            return false;
        }else {
            $("#update_userPhone").parent().parent().removeClass("has-error");
            $("#update_userPhone").parent().parent().addClass("has-success");
            $("#helpBlock_update_inputPhone").text("");
        }

        //5 点击更新按钮，发送AJAX请求到后台进行保存。
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/user/updateUser/"+updateUserId,
            type:"PUT",
            data:$(".update_user_form").serialize(),
            success:function (result) {
                if (result.code==100){
                    alert("用户更改成功！");
                    $(".user-update-modal").modal("hide");
                    //跳转到当前页
                    var curPage = ${curPage};
                    window.location.href="hrms/user/getUserList?pageNo="+curPage;
                }else {
                    alert(result.extendInfo.user_update_error);
                }
            }
        });

    });
</script>

</body>
</html>