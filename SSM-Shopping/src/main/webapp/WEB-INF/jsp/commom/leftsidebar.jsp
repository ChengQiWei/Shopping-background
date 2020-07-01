<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--用base标签方便后面编程 使用相对路径 -->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/"/>

<div class="panel-group col-sm-2" id="hrms_sidebar_left" role="tablist" aria-multiselectable="true">
  <!--  <ul class="nav nav-pills nav-stacked emp_sidebar">-->
       <!-- <li role="presentation" class="active"> --> 
           <!-- collapse 折叠  href="#'指跳转到当前界面 也就是不可用 -->
            <!-- <a  data-toggle="collapse" href="#collapse_emp">
                <span class="glyphicon glyphicon-user" aria-hidden="true">用户管理</span>
            </a> -->
           <!-- <ul class="nav nav-pills nav-stacked panel-collapse collapse" id="collapse_emp" >
                <li role="presentation"><a href="#" class="emp_info">用户信息</a></li>
                <li role="presentation"><a href="#" role="button" class="emp_add_btn" data-toggle="modal" data-target=".emp-add-modal">用户新增</a></li>
               <!-- <li role="presentation"><a href="#" class="emp_clearall_btn">员工清零</a></li> -->
            </ul>
        </li>
    </ul>  --> 
    <!-- <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#collapse_dept"  data-toggle="collapse" >
                <span class="glyphicon glyphicon-cloud" aria-hidden="true">部门管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked panel-collapse collapse" id="collapse_dept">
                <li role="presentation"><a href="#" class="dept_info">部门信息</a></li>
                <li role="presentation"><a href="#" class="dept_add_btn" data-toggle="modal" data-target=".dept-add-modal">部门新增</a></li>
            </ul>
        </li>
    </ul> -->
      <ul class="nav nav-pills nav-stacked user_sidebar">
        <li role="presentation" class="active">
           <!-- collapse 折叠  href="#'指跳转到当前界面 也就是不可用 -->
            <a  data-toggle="collapse" href="#collapse_user">
                <span class="glyphicon glyphicon-user" aria-hidden="true">用户管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked panel-collapse collapse" id="collapse_user" >
                <li role="presentation"><a href="#" class="user_info">用户信息</a></li>
                <li role="presentation"><a href="#" role="button" class="user_add_btn" data-toggle="modal" data-target=".user-add-modal">用户新增</a></li>
               <!-- <li role="presentation"><a href="#" class="emp_clearall_btn">员工清零</a></li> -->
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked admin_sidebar">
        <li role="presentation" class="active">
           <!-- collapse 折叠  href="#'指跳转到当前界面 也就是不可用 -->
            <a href="#collapse_admin" data-toggle="collapse" >
                <span class="glyphicon glyphicon-admin" aria-hidden="true">管理员管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked panel-collapse collapse" id="collapse_admin">
                <li role="presentation"><a href="#" class="admin_info">管理员信息</a></li>
                <!-- <li role="presentation"><a href="#" role="button" class="admin_add_btn" data-toggle="modal" data-target=".admin-add-modal">管理员新增</a></li> -->
               <!-- <li role="presentation"><a href="#" class="emp_clearall_btn">员工清零</a></li> -->
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked go_sidebar">
        <li role="presentation" class="active">
           <!-- collapse 折叠  href="#'指跳转到当前界面 也就是不可用 -->
            <a href="#collapse_go" data-toggle="collapse" >
                <span class="glyphicon glyphicon-go" aria-hidden="true">商品管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked panel-collapse collapse" id="collapse_go">
                <li role="presentation"><a href="#" class="go_info">商品信息</a></li>
                <li role="presentation"><a href="#" role="button" class="go_add_btn" data-toggle="modal" data-target=".go-add-modal">商品新增</a></li>
               <!-- <li role="presentation"><a href="#" class="emp_clearall_btn">员工清零</a></li> -->
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked kind_sidebar">
        <li role="presentation" class="active">
           <!-- collapse 折叠  href="#'指跳转到当前界面 也就是不可用 -->
            <a href="#collapse_kind" data-toggle="collapse" >
                <span class="glyphicon glyphicon-kind" aria-hidden="true">一级分类管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked panel-collapse collapse" id="collapse_kind">
                <li role="presentation"><a href="#" class="kind_info">一级分类信息</a></li>
                <li role="presentation"><a href="#" role="button" class="kind_add_btn" data-toggle="modal" data-target=".kind-add-modal">一级分类新增</a></li>
               <!-- <li role="presentation"><a href="#" class="emp_clearall_btn">员工清零</a></li> -->
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked sort_sidebar">
        <li role="presentation" class="active">
           <!-- collapse 折叠  href="#'指跳转到当前界面 也就是不可用 -->
            <a href="#collapse_sort" data-toggle="collapse" >
                <span class="glyphicon glyphicon-sort" aria-hidden="true">二级分类管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked panel-collapse collapse" id="collapse_sort">
                <li role="presentation"><a href="#" class="sort_info">二级分类信息</a></li>
                <li role="presentation"><a href="#" role="button" class="sort_add_btn" data-toggle="modal" data-target=".sort-add-modal">二级分类新增</a></li>
               <!-- <li role="presentation"><a href="#" class="emp_clearall_btn">员工清零</a></li> -->
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked order_sidebar">
        <li role="presentation" class="active">
           <!-- collapse 折叠  href="#'指跳转到当前界面 也就是不可用 -->
            <a href="#collapse_order" data-toggle="collapse" >
                <span class="glyphicon glyphicon-order" aria-hidden="true">订单管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked panel-collapse collapse" id="collapse_order">
                <li role="presentation"><a href="#" class="order_info">订单信息</a></li>
               <!-- <li role="presentation"><a href="#" class="emp_clearall_btn">员工清零</a></li> -->
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked cart_sidebar">
        <li role="presentation" class="active">
           <!-- collapse 折叠  href="#'指跳转到当前界面 也就是不可用 -->
            <a href="#collapse_cart" data-toggle="collapse" >
                <span class="glyphicon glyphicon-order" aria-hidden="true">购物车管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked panel-collapse collapse" id="collapse_cart">
                <li role="presentation"><a href="#" class="cart_info">购物车信息</a></li>
                <li role="presentation"><a href="#" class="cart_clearall_btn">购物车清空</a></li> 
            </ul>
        </li>
    </ul>
   

</div><!-- /.panel-group，#hrms_sidebar_left -->

<script type="text/javascript">
    //跳转到员工页面
    $(".emp_info").click(function () {
        $(this).attr("href", "hrms/emp/getEmpList");
    });
    //跳转到部门页面
    $(".dept_info").click(function () {
        $(this).attr("href", "hrms/dept/getDeptList");
    });
    //跳转到用户页面
    $(".user_info").click(function () {
        $(this).attr("href", "hrms/user/getUserList");
    });
  //跳转到商品页面
    $(".go_info").click(function () {
        $(this).attr("href", "hrms/go/getGoList");
    });
  //跳转到分类页面
    $(".kind_info").click(function () {
        $(this).attr("href", "hrms/kind/getKindList");
    });
  //跳转到分类页面
    $(".sort_info").click(function () {
        $(this).attr("href", "hrms/sort/getSortList");
    });
  //跳转到管理员页面
    $(".admin_info").click(function () {
        $(this).attr("href", "hrms/admin/getAdminList");
    });
  //跳转到订单页面
    $(".order_info").click(function () {
        $(this).attr("href", "hrms/order/getOrderList");
    });
  //跳转到购物车页面
    $(".cart_info").click(function () {
        $(this).attr("href", "hrms/cart/getCartList");
    });
    //购物车清空
   $(".cart_clearall_btn").click(function () {
        if (confirm("确认清空购物车的信息吗？")){
            $.ajax({
                url:"<%=request.getContextPath()%>/hrms/cart/deleteCartAll",
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="hrms/cart/getCartList";
                    }else {
                        alert(result.extendInfo.cart_del_error);
                    }
                }
            });
        }
    });
    //部门清零这个功能暂未实现
    $(".dept_clearall_btn").click(function () {
        alert("对不起，您暂无权限进行操作！请先获取权限");
    });
</script>
</body>
</html>
