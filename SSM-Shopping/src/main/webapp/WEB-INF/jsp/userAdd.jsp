<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><!-- 引入标签库的定义 -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!--定义网页依赖的属性 -->

<html>
<head>
<title>User Add Page</title>
    <!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>
</head>
<body>
<div class="modal fade user-add-modal" tabindex="-1" role="dialog" aria-labelledby="user-add-modal" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_user_form">
                    <div class="form-group">
                        <label for="add_userName" class="col-sm-2 control-label">昵称</label>
                        <div class="col-sm-8">
                            <input type="text" name="userName" class="form-control" id="add_userName" placeholder="如：张三">
                            <span id="helpBlock_add_userName" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_userPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-8">
                            <input type="password" name="userPassword" class="form-control" id="add_userPassword" placeholder="1234cqwer">
                            <span id="helpBlock_add_userPassword" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" checked="checked" name="gender" id="add_userGender1" value="M"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="add_userGender2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_userPhone" class="col-sm-2 control-label">电话号码</label>
                        <div class="col-sm-8">
                            <input type="text" name="userPhone" class="form-control" id="add_userPhone" placeholder="13145655832">
                            <span id="helpBlock_add_userPhone" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_userAddress" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-8">
                            <input type="text" name="userAddress" class="form-control" id="add_userAddress" placeholder="xx省xx市xx区xx街道xx号">
                            <span id="helpBlock_add_userAddress" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_userCity" class="col-sm-2 control-label">城市</label>
                        <div class="col-sm-8">
                            <input type="text" name="city" class="form-control" id="add_userCity" placeholder="北京市">
                            <span id="helpBlock_add_userCity" class="help-block"></span>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="add_userEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-8"><!-- 使用email类型，html自动对输入邮箱格式进行验证 -->
                            <input type="email" name="email" class="form-control" id="add_userEmail" placeholder="zs@qq.com">
                            <span id="helpBlock_add_userEmail" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_userPostcode" class="col-sm-2 control-label">邮编</label>
                        <div class="col-sm-8">
                            <input type="text" name="userPostcode" class="form-control" id="add_userPostcode" placeholder="100224">
                            <span id="helpBlock_add_userPostcode" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_userPayment" class="col-sm-2 control-label">账户余额</label>
                        <div class="col-sm-8">
                            <input type="number" step="0.01" name="payment" class="form-control" id="add_userPayment" placeholder="3.55">
                            <span id="helpBlock_add_userPayment" class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary user_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">

    <!-------------------------------------用户新增操作-------------------------------------->
    //=======0 点击 用户新增按钮，弹出模态框，
    // 将查询得到的部门列表信息显示在对应模态框中部门信息处。=============================
    
  
    	$(".user_add_btn").click(function () {
    	
        $('.user-add-modal').modal({
        	backdrop:static,  //或许版本不同，不管用？？？？
            keyboard:true
        });
        
    });



    //=========1 当鼠标从昵称输入框移开的时候，判断姓名输入框内的姓名是否重复 ============
    $("#add_userName").change(function () {
        var userName = $("#add_userName").val();
        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/user/checkUserExists",
            type:"GET",
            data:"userName="+userName,
            success:function (result) {
                if (result.code == 100){
                    $("#add_userName").parent().parent().removeClass("has-error");
                    $("#add_userName").parent().parent().addClass("has-success");
                    $("#helpBlock_add_userName").text("用户名可用！");
                    $(".user_save_btn").attr("btn_name_exists", "success");
                }else {
                    $("#add_userName").parent().parent().removeClass("has-success");
                    $("#add_userName").parent().parent().addClass("has-error");
                    $("#helpBlock_add_userName").text(result.extendInfo.name_reg_error);
                    $(".user_save_btn").attr("btn_name_exists", "error");
                }
            }
        });
    });

    //3 保存

    $(".user_save_btn").click(function () {

        //1 获取到第3步：$(".user_save_btn").attr("btn_name_exists", "success");中btn_name_exists的值
        // btn_name_exists = error，就是姓名重复
        if($(".user_save_btn").attr("btn_name_exists") == "error"){
            return false;
        }

        //================2 对输入的姓名和邮箱格式进行验证===============
        var inpuName = $("#add_userName").val();
        var inpuEmail = $("#add_userEmail").val();
        var inpuPhone =$("#add_userPhone").val();
        //验证格式。姓名：2-5位中文或6-16位英文和数字组合；
        var reName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        var reEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        var rePhone=  /^(13[0-9]{9}|15[0-9]{9}|[0-9]{7,8}|0[0-9]{2,3}\-[0-9]{7,8}(\-[0-9]{0-4})?)$/;
        if (!reName.test(inpuName)){
            alert("测试：输入姓名格式不正确！");
            //输入框变红
            $("#add_userName").parent().parent().addClass("has-error");
            //输入框下面显示红色提示信息
            $("#helpBlock_add_userName").text("输入姓名为2-5位中文或6-16位英文和数字组合");
            return false;
        }else {
            //移除格式
            $("#add_userName").parent().parent().removeClass("has-error");
            $("#add_userName").parent().parent().addClass("has-success");
            $("#helpBlock_add_userName").hide();
        }
        if (!reEmail.test(inpuEmail)){
            //输入框变红
            $("#add_userEmail").parent().parent().addClass("has-error");
            //输入框下面显示红色提示信息
            $("#helpBlock_add_userEmail").text("输入邮箱格式不正确！");
            return false;
        }else {
            //移除格式
            $("#add_userEmail").parent().parent().removeClass("has-error");
            $("#add_userEmail").parent().parent().addClass("has-success");
            $("#helpBlock_add_userEmail").hide();
        }
        if (!rePhone.test(inpuPhone)){
            //输入框变红
            $("#add_userPhone").parent().parent().addClass("has-error");
            //输入框下面显示红色提示信息
            $("#helpBlock_add_userPhone").text("输入电话号码格式不正确！");
            return false;
        }else {
            //移除格式
            $("#add_userPhone").parent().parent().removeClass("has-error");
            $("#add_userPhone").parent().parent().addClass("has-success");
            $("#helpBlock_add_userPhone").hide();
        }



        $.ajax({
            url:"<%=request.getContextPath()%>/hrms/user/addUser",
            type:"POST",
            data:$(".add_user_form").serialize(),
            success:function (result) {
                if (result.code == 100){
                    alert("用户新增成功");
                    $('#user-add-modal').modal("hide");
                    //跳往最后一页，由于新增记录，所以要重新查询总页数
                    $.ajax({
                        url:"<%=request.getContextPath()%>/hrms/user/getTotalPages",
                        type:"GET",
                        success:function (result) {
                            var totalPage = result.extendInfo.totalPages;
                            window.location.href="hrms/user/getUserList?pageNo="+totalPage;
                        }
                    })
                } else {
                    alert("用户新增失败！");
                }
            }

        });
    });



</script>
</body>
</html>