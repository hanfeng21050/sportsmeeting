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

    <style type="text/css">
        input{
            border-radius: 6px !important;
        }
        select{
            border:1px solid #c9c9c9;
            background-color:#fff;
            color:#666;
            height:34px;
            line-height:28px;
            padding:4px 6px;
            font-size:14px;
            border-radius:6px;
            cursor:pointer;
            outline:none;
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
                团队列表 <small>团队详情</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li>团队列表</li>
                <li class="active">团队详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <div class="tab-pane active" id="tab-label">

                <div class="row data-type">
                    <div class="col-md-2 title">团队名称</div>
                    <div class="col-md-4 data text">
                        ${ext.team.name}
                    </div>
                    <div class="col-md-2 title">团队编号</div>
                    <div class="col-md-4 data text">
                        ${ext.team.teamNum}
                    </div>
                    <div class="col-md-2 title">成员数量</div>
                    <div class="col-md-4 data text">
                        ${ext.memberNum}
                    </div>

                    <div class="col-md-2 title">参加比赛</div>
                    <div class="col-md-4 data text">
                        <a href="${pageContext.request.contextPath}/project/findDetailsById?id=${ext.project.id}&type=${ext.project.type}&sort=${ext.project.sort}">${ext.project.name}</a>
                    </div>
                </div>

                <div class="box-tools text-center">
                    <button onclick="getMessage(${ext.team.id})" type="button" class="btn bg-green" data-toggle="modal" data-target="#teamModel">修改
                    </button>
                    <button type="button" class="btn bg-default"
                            onclick="history.back(-1);">返回
                    </button>
                </div>

                <br>
                <br>
                <!-- 人员列表 -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-cube"></i>
                        <h3 class="box-title">成员列表</h3>
                    </div>

                    <div class="box-body">
                        <!--工具栏-->
                        <div>
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn bg-yellow btn-default" title="新增"><i class="fa fa-trash-o"></i> 新增</button>
                                    <button type="button" class="btn bg-red btn-default" title="删除"><i class="fa fa-trash-o"></i> 删除</button>
                                </div>
                            </div>
                        </div>
                        <!--工具栏/-->
                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--数据列表-->
                            <table style="text-align: center" id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th style="vertical-align: middle;margin:auto; padding:10px" width="20px">
                                        <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                    </th>
                                    <th style="text-align: center">ID</th>
                                    <th style="text-align: center">姓名</th>
                                    <th style="text-align: center">运动员编号</th>
                                    <th style="text-align: center">性别</th>
                                    <th style="text-align: center">年龄</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${athleteList}" varStatus="vs" var="athlete">
                                    <tr>
                                        <td><input name="ids" type="checkbox" value="${athlete.id}"></td>
                                        <td style="text-align: center">${vs.index+1}</td>
                                        <td style="text-align: center">${athlete.name}</td>
                                        <td style="text-align: center">${athlete.playerNum}</td>
                                        <td style="text-align: center">${athlete.gender == false ? "男":"女"}</td>
                                        <td style="text-align: center">${athlete.age}</td>

                                        <td style="text-align: center" class="text-center">
                                            <button type="button" class="btn bg-olive btn-xs" onclick='location.href="${pageContext.request.contextPath}/athlete/findDetailsById?id=${athlete.id}"'>详情</button>
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


            <%--保存弹出窗--%>
            <div id="teamModel" class="modal fade" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <form id="myForm" method="post">
                        <div class="modal-content" style="border-radius: 6px">
                            <div class="modal-header">
                                <h4 class="modal-title" id="title">修改</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group text-center">
                                    <input type="hidden" name="id" id="id">

                                    <label for="name" class="col-sm-3 control-label">团队名称</label>
                                    <div class="col-sm-9">
                                        <input id="name" type="text" class="form-control rounded" placeholder="团队名称" name="name" required="required">
                                    </div>
                                    <br>
                                    <br>
                                    <label for="teamNum" class="col-sm-3 control-label">团队编号</label>
                                    <div class="col-sm-9">
                                        <input id="teamNum" type="text" class="form-control rounded" placeholder="团队编号" name="teamNum" required="required">
                                    </div>
                                    <br>
                                    <br>
                                    <label for="project" class="col-sm-3 control-label">比赛</label>
                                    <div class="col-sm-9">
                                        <select id="project" style="width: 100%;" name="projectId">

                                        </select>
                                    </div>
                                    <br>
                                    <br>
                                    <label class="col-md-3 control-label">运动员</label>
                                    <div class="col-md-9">
                                        <select  id="athlete" class="select2" multiple="multiple" data-placeholder="可多选" style="width: 100%;" name="roleIds">
                                        </select>
                                    </div>
                                    <br>
                                    <br>

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

   function getMessage(id){
        var url = "${pageContext.request.contextPath}/team/findById?id="+id;
        console.log(url)
       $.get(url,function (data) {
            console.log(data);
           document.getElementById("id").value = data.team.id;
           document.getElementById("name").value = data.team.name;
           document.getElementById("teamNum").value = data.team.teamNum;

           /*比赛*/
           var projectList = data.projectList;
           var html = "";
           for (var i = 0; i < projectList.length; i++) {

              if(projectList[i].name == "${ext.project.name}")
              {
                  console.log(123123)
                  html+= "<option value=\""+projectList[i].id +" \" selected='selected'>"+ projectList[i].name+"</option>";
              }else {
                  html+= "<option value=\""+projectList[i].id +"\">"+ projectList[i].name+"</option>";
              }
           }
           $("#project").html(html);

           /*运动员*/
           var athletaList = data.athleteList;
           var html2="";
           for (var i = 0; i < athletaList.length; i++) {
               html2 += "<option value=\""+athletaList[i].id +"\">"+ athletaList[i].name+"</option>";
           }
           $("#athlete").html(html2);

       });

   };

    $(function() {
        $('#dataList').DataTable({
            "paging": true,
            "lengthChange": true,
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
        $(".select2").select2();

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
</script>
</body>

</html>