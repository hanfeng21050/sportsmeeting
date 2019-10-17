<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




    <title>田径运动会管理系统</title>
    <meta name="description" content="管理系统">
    <meta name="keywords" content="管理系统">




    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- iCheck -->
    <!-- Morris chart -->
    <!-- jvectormap -->
    <!-- Date Picker -->
    <!-- Daterange picker -->
    <!-- Bootstrap time Picker -->
    <!--<link rel="stylesheet" href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css">-->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--数据表格-->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- Bootstrap Color Picker -->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--bootstrap-markdown-->
    <!-- Theme style -->
    <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
    <!-- Ion Slider -->
    <!-- ion slider Nice -->
    <!-- bootstrap slider -->
    <!-- bootstrap-datetimepicker -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->








    <!-- jQuery 2.2.3 -->
    <!-- jQuery UI 1.11.4 -->
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <!-- Bootstrap 3.3.6 -->
    <!-- Morris.js charts -->
    <!-- Sparkline -->
    <!-- jvectormap -->
    <!-- jQuery Knob Chart -->
    <!-- daterangepicker -->
    <!-- datepicker -->
    <!-- Bootstrap WYSIHTML5 -->
    <!-- Slimscroll -->
    <!-- FastClick -->
    <!-- iCheck -->
    <!-- AdminLTE App -->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- bootstrap color picker -->
    <!-- bootstrap time picker -->
    <!--<script src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>-->
    <!-- Bootstrap WYSIHTML5 -->
    <!--bootstrap-markdown-->
    <!-- CK Editor -->
    <!-- InputMask -->
    <!-- DataTables -->
    <!-- ChartJS 1.0.1 -->
    <!-- FLOT CHARTS -->
    <!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
    <!-- jQuery Knob -->
    <!-- Sparkline -->
    <!-- Morris.js charts -->
    <!-- Ion Slider -->
    <!-- Bootstrap slider -->
    <!-- bootstrap-datetimepicker -->
    <!-- 页面meta /-->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <script>
        function deleteProject(id)
        {
            if(confirm("您确定要删除吗？"))
            {
                location.href="${pageContext.request.contextPath}/equipment/deleteByIds?ids="+id;
            }
        }
    </script>

    <style type="text/css">
        input{
            border-radius: 6px !important;
        }
    </style>
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
                比赛管理 <small>器材列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li>比赛管理</li>
                <li class="active">器材列表</li>
            </ol>
        </section>

        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">


            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">体育器材列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div>
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default bg-yellow" title="新建" data-toggle="modal" data-target="#myModal"
                                            onclick="">
                                        <i class="fa fa-file-o"></i> 新建
                                    </button>
                                    <button type="button" class="btn btn-default bg-red" title="删除" id="delSelected">
                                        <i class="fa fa-trash-o"></i> 删除
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!--工具栏/-->

                        <form id="selection" action="${pageContext.request.contextPath}/equipment/deleteByIds" method="post">
                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable" style="text-align: center">
                                <thead>
                                <tr>
                                    <th class="sorting_asc_disabled" style="vertical-align: middle;margin:auto; padding:10px" width="20px"><input
                                            id="selall" type="checkbox" class="icheckbox_square-blue">
                                    </th>
                                    <th style="text-align: center">ID</th>
                                    <th style="text-align: center">器材</th>
                                    <th style="text-align: center">种类</th>
                                    <th style="text-align: center">地点</th>
                                    <th style="text-align: center">可借数量 </th>
                                    <th style="text-align: center">详细</th>
                                    <th style="text-align: center">操作</th>
                                </tr>
                                <tbody >
                                <c:forEach items="${equipmentList}" var="equipment" varStatus="status">
                                    <tr>
                                        <td><input name="ids" type="checkbox" value="${equipment.id}"></td>
                                        <td>${status.index+1}</td>
                                        <td>${equipment.name}</td>
                                        <td>${equipment.type}</td>
                                        <td>${equipment.place}</td>
                                        <td><span class="label  ${equipment.num == 0 ? "label-danger":"label-success"} "> ${equipment.num}</span></td>
                                        <td>${equipment.description == null ? "无":equipment.description}</td>
                                        <td>
                                            <button type="button" class="btn bg-olive btn-xs" onclick="location.href='${pageContext.request.contextPath}/equipment/findDetailsById?id=${equipment.id}'">详情</button>
                                            <button type="button" class="btn bg-red btn-xs" onclick="javascript:deleteProject(${equipment.id})">删除</button>
                                            <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#myModal" onclick="getProject(${equipment.id})">修改</button>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                                </thead>

                            </table>
                        </form>

                    </div>
                    <!-- 数据表格 /-->


                </div>
                <!-- /.box-body -->
            </div>

            <%--保存弹出窗--%>
            <div id="myModal" class="modal fade" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <form id="myForm">
                        <div class="modal-content" style="border-radius: 6px">
                            <div class="modal-header">
                                <h4 class="modal-title" id="title">新建</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" name="id" id="id">
                                    <%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
                                    <input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">

                                    <label for="name">器材名称</label>
                                    <div class="form-group">
                                        <input id="name" type="text" class="form-control rounded" placeholder="器材名称" name="name" required="required">
                                    </div>

                                    <label for="type">器材类别</label>
                                    <div class="form-group">
                                        <input id="type" type="text" class="form-control rounded" placeholder="器材类别、型号" name="type" required="required">
                                    </div>

                                    <label for="place">存放地点</label>
                                    <div class="form-group">
                                        <input id="place" type="text" class="form-control rounded" placeholder="存放地点" name="place" required="required">
                                    </div>

                                    <label for="num">数量</label>
                                    <div class="form-group">
                                        <input id="num" type="number" class="form-control" placeholder="器材数量" name="num" min="1"  required="required">
                                    </div>

                                    <label for="description">详细</label>
                                    <div class="form-group rowHeight2x" >
                                        <input type="text" id="description" class="form-control rounded" placeholder="输入···" name="description" required="required"/>
                                    </div>

                                </div>
                            </div>

                            <div class="modal-footer">
                                <button id="btn" type="submit" class="btn bg-maroon">保存</button>
                                <button type="button" class="btn bg-blue" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                    </form>


                    <!-- /.modal-content -->
                </div>

                <!-- /.modal-dialog -->
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
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    function getProject(id) {
        //请求角色列表
        console.log(id)
        var url = "${pageContext.request.contextPath}/equipment/findById?id="+id;
        $.get(url,function (data) {
            document.getElementById("updateOrInsert").value = "update";
            document.getElementById("id").value = id;
            document.getElementById("name").value = data.name;
            document.getElementById("type").value = data.type;
            document.getElementById("place").value = data.place;
            document.getElementById("num").value = data.num;
            document.getElementById("description").value = data.description;

            $("#btn").text('修改');
            $("#title").text('修改');
        });
    };

    $('#myModal').on('hidden.bs.modal', function (){
        document.getElementById("myForm").reset();
        $("#btn").text('保存');
        $("#title").text('新增');
    });

    $("#myForm").submit(function () {
        var data = $('#myForm').serialize();
        data = decodeURIComponent(data,true);

        //todo 解决空格变成加号问题

        //处理data 转成json格式
        var dataArr = data.split("&");
        var res = {};
        for (var i = 0; i < dataArr.length; i++) {
            var str = dataArr[i].split("=");
            res[str[0]] = str[1];
        }

        if(res['updateOrInsert'] == 'update')
        {
            $.ajax({
                type: "POST",   //提交的方法
                dataType: "json",
                contentType : 'application/json',//添加这句话
                url:"${pageContext.request.contextPath}/equipment/update", //提交的地址
                async: false,
                data:JSON.stringify(res),
                error: function() {  //失败的话
                    alert("执行失败!")
                },
                success: function() {  //成功
                    alert("执行成功!")
                }
            });
        }else if(res['updateOrInsert'] == 'insert')
        {
            $.ajax({
                type: "POST",   //提交的方法
                dataType: "json",
                contentType : 'application/json',//添加这句话
                url:"${pageContext.request.contextPath}/equipment/save", //提交的地址
                async: false,
                data:JSON.stringify(res),
                error: function() {  //失败的话
                    alert("执行失败!")
                },
                success: function() {  //成功
                    alert("执行成功!")
                }
            });
        }
    });

    $(function () {
        $('#dataList').DataTable({
            "paging": true,
            "lengthChange": true,
            "iDisplayLength": 15,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": true,
            "language": {
                "sInfo": "当前显示第 _START_ 到第 _END_ 条，共 _TOTAL_ 条",
                "sInfoFiltered": "(从_MAX_条筛选 )",
                "sInfoEmpty": "共筛选到0条",
                "sSearch": "搜索:",
                "sLengthMenu": "每页显示 _MENU_ 条",
                "sZeroRecords": "未筛选到相关内容",
                "paginate": {
                    "sFirst": "首页",  //首页和尾页必须在pagingType设为full_numbers时才可以
                    "sLast": "尾页",
                    "sPrevious": "上一页",
                    "sNext": "下一页",
                    "first": "First page",
                    "last": "Last page",
                    "next": "Next page",
                    "previous": "Previous page"
                }
            }
        });


        $("#refresh").click(function () {
            window.location.reload(true);
        });

        document.getElementById("delSelected").onclick = function () {
            if(confirm("你确定要删除选中条目吗"));
            {
                document.getElementById("selection").submit();
            }
        }

        $(document).ready(function () {
            // 选择框
            $(".select2").select2();

            // WYSIHTML5编辑器
            $(".textarea").wysihtml5({
                locale: 'zh-CN'
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
    })

</script>
</body>

</html>