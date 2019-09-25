<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>运动会管理系统</title>
    <meta name="description" content="运动会管理系统">
    <meta name="keywords" content="运动会管理系统">

    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
</head>

<body class="hold-transition skin-red sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="aside.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                用户管理 <small>用户详情</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li>用户管理</li>
                <li class="active">用户详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">
            <div class="tab-pane active">
                <div class="row data-type">
                    <div class="col-md-2 title">姓名</div>
                    <div class="col-md-4 data text">
                        ${project.name}
                    </div>
                    <div class="col-md-2 title">运动员编号</div>
                    <div class="col-md-4 data text">
                        ${project.unitStr}
                    </div>
                    <div class="col-md-2 title">性别</div>
                    <div class="col-md-4 data text">
                        ${project.sortStr}
                    </div>

                    <div class="col-md-2 title">年龄</div>
                    <div class="col-md-4 data text">
                        ${project.genderStr}
                    </div>
                    <div class="col-md-2 title">身高</div>
                    <div class="col-md-4 data text">
                        ${project.place}
                    </div>
                    <div class="col-md-2 title">体重</div>
                    <div class="col-md-4 data text">
                        ${project.typeStr}
                    </div>
                    <div class="col-md-2 title">名族</div>
                    <div class="col-md-4 data text">
                        ${project.startTimeStr}
                    </div>
                    <div class="col-md-2 title">身份证号码</div>
                    <div class="col-md-4 data text">
                        ${project.endTimeStr}
                    </div>
                </div>
                <br>
                <br>

                <!--tab头-->
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tab-project" data-toggle="tab">参加的比赛</a>
                    </li>
                    <li>
                        <a href="#tab-team" data-toggle="tab">所在团队</a>
                    </li>
                </ul>
                <!--tab头/-->

                <div class="tab-content">
                    <!-- 参赛人员列表 -->
                    <div class="tab-pane active"id="tab-project">
                        <div class="box-header with-border">
                            <i class="fa fa-cube"></i>
                            <h3 class="box-title">参赛人员列表</h3>
                        </div>

                        <div class="box-body">
                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新建"><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="删除"><i class="fa fa-trash-o"></i> 删除</button>
                                        <button type="button" class="btn btn-default" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <!--工具栏/-->
                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--数据列表-->
                                <table id="projects" class="table table-bordered table-striped table-hover dataTable" >
                                    <thead>
                                    <tr>
                                        <th class="" style="vertical-align: middle;margin:auto; padding:10px" width="20px">
                                            <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                        </th>
                                        <th class="">ID</th>
                                        <th class="">姓名</th>
                                        <th class="">性别</th>
                                        <th class="">年龄</th>
                                        <th class="">团队</th>
                                        <th class="">运动员号码</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${athleteList}" varStatus="vs" var="athlete">
                                        <tr>
                                            <td><input name="ids" type="checkbox"></td>
                                            <td>${vs.index+1}</td>

                                            <td>${athlete.name}</td>
                                            <td>${athlete.genderStr}</td>
                                            <td>${athlete.age}</td>
                                            <td>${athlete.teamId}</td>
                                            <td>${athlete.playerNum}</td>
                                            <td class="text-center">
                                                <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!--数据列表/-->

                            </div>
                            <!-- 数据表格 /-->
                        </div>
                        <!-- /.box-body -->

                    </div>

                    <!-- 参赛人员列表 -->
                    <div class="tab-pane"id="tab-team">
                        <div class="box-header with-border">
                            <i class="fa fa-cube"></i>
                            <h3 class="box-title">所在团队</h3>
                        </div>

                        <div class="box-body">
                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新建"><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="删除"><i class="fa fa-trash-o"></i> 删除</button>
                                        <button type="button" class="btn btn-default" title="刷新"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <!--工具栏/-->
                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--数据列表-->
                                <table id="teams"  class="table table-bordered table-striped table-hover dataTable" >
                                    <thead>
                                    <tr>
                                        <th class="" style="vertical-align: middle;margin:auto; padding:10px" width="20px">
                                            <input type="checkbox" class="icheckbox_square-blue">
                                        </th>
                                        <th class="">ID</th>
                                        <th class="">姓名</th>
                                        <th class="">性别</th>
                                        <th class="">年龄</th>
                                        <th class="">团队</th>
                                        <th class="">运动员号码</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${athleteList}" varStatus="vs" var="athlete">
                                        <tr>
                                            <td><input name="ids" type="checkbox"></td>
                                            <td>${vs.index+1}</td>

                                            <td>${athlete.name}</td>
                                            <td>${athlete.genderStr}</td>
                                            <td>${athlete.age}</td>
                                            <td>${athlete.teamId}</td>
                                            <td>${athlete.playerNum}</td>
                                            <td class="text-center">
                                                <button type="button" class="btn bg-olive btn-xs" onclick='location.href="all-product-line-edit.html"'>编辑</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!--数据列表/-->

                            </div>
                            <!-- 数据表格 /-->
                        </div>
                        <!-- /.box-body -->

                    </div>
                </div>




            </div>


        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <jsp:include page="foot.jsp"></jsp:include>
    <!-- 底部导航 /-->

</div>

<script
        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script>

    $(function() {
        $('#projects').DataTable({
            "paging": false,
            "lengthChange": false,
            "searching": true,
            "ordering": false,
            "info": false,
            "autoWidth": true
        });

        $('#teams').DataTable({
            "paging": false,
            "lengthChange": false,
            "searching": true,
            "ordering": false,
            "info": false,
            "autoWidth": true
        });
    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("order-manage");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</body>

</html>