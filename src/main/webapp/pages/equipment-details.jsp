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
                比赛管理 <small>器材详情</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li>比赛管理</li>
                <li class="active">器材详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">
            <div class="tab-pane active">
                <div class="row data-type">
                    <div class="col-md-2 title">名称</div>
                    <div class="col-md-4 data text">
                        ${equipment.name}
                    </div>
                    <div class="col-md-2 title">类型</div>
                    <div class="col-md-4 data text">
                        ${equipment.type}
                    </div>
                    <div class="col-md-2 title">存放地点</div>
                    <div class="col-md-4 data text">
                        ${equipment.place}
                    </div>

                    <div class="col-md-2 title">可借数量</div>
                    <div class="col-md-4 data text">
                        <c:if test="${equipment.num == 0}">
                            <p style="color: red">${equipment.num}</p>
                        </c:if>
                        <c:if test="${equipment.num != 0}">
                            <p style="color: green">${equipment.num}</p>
                        </c:if>
                    </div>

                    <div class="col-md-2 title rowHeight2x">详情</div>
                    <div class="col-md-10 data text rowHeight2x">
                        <textarea class="form-control" rows="3" disabled="disabled">${equipment.description}</textarea>
                    </div>

                </div>

                <%--返回按钮--%>
                <div class="box-tools text-center">
                    <button type="button" class="btn bg-default"
                            onclick="history.back(-1);">返回
                    </button>
                </div>

                <br>
                <br>

                <!--tab头-->
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tab-lend" data-toggle="tab">未归还</a>
                    </li>
                    <li>
                        <a href="#tab-return" data-toggle="tab">已归还</a>
                    </li>
                </ul>
                <!--tab头/-->

                <div class="tab-content">
                    <!-- 未归还的器材 -->
                    <div class="tab-pane active"id="tab-lend">
                        <div class="box-header with-border">
                            <i class="fa fa-cube"></i>
                            <h3 class="box-title">体育器材</h3>
                        </div>

                        <div class="box-body">
                            <!-- 数据表格 -->

                            <div class="table-box">

                                <!--工具栏-->
                                <div>
                                    <div class="form-group form-inline">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default bg-yellow" title="新建" data-toggle="modal" data-target="#myModal"
                                                    onclick="" <c:if test="${equipment.num == 0}">disabled="disabled"</c:if>>
                                                <i class="fa fa-file-o"></i> 新建
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!--数据列表-->
                                <table id="lendList" class="table table-bordered table-striped table-hover dataTable" style="text-align: center">
                                    <thead>
                                    <tr>
                                        <th style="text-align: center">ID</th>
                                        <th style="text-align: center">姓名</th>
                                        <th style="text-align: center">借出数量</th>
                                        <th style="text-align: center">电话号码</th>
                                        <th style="text-align: center">借出时间</th>
                                        <th style="text-align: center">归还时间</th>
                                        <th style="text-align: center">详细</th>
                                        <th style="text-align: center">操作</th>
                                    </tr>
                                    <tbody >
                                    <c:forEach items="${lendList}" var="lend" varStatus="status">
                                        <tr>
                                            <td>${status.index+1}</td>
                                            <td>${lend.borrower}</td>
                                            <td>${lend.borrowNum}</td>
                                            <td>${lend.borrowerTel}</td>
                                            <td>${lend.borrowTimeStr}</td>
                                            <td>${lend.returnTimeStr}</td>
                                            <td>${lend.description}</td>
                                            <td>
                                                <button type="button" class="btn bg-olive btn-xs" onclick="rtn('${lend.id}','${lend.borrowNum}','${lend.borrower}','${equipment.id}')">归还</button>
                                                <button type="button"  class="btn bg-red btn-xs" onclick="del(${lend.id})">删除</button>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                    </thead>

                                </table>
                                <!--数据列表/-->

                            </div>
                            <!-- 数据表格 /-->
                        </div>
                        <!-- /.box-body -->

                    </div>

                    <!-- 所在团队列表 -->
                    <div class="tab-pane"id="tab-return">
                        <div class="box-header with-border">
                            <i class="fa fa-cube"></i>
                            <h3 class="box-title">已归还器材</h3>
                        </div>

                        <div class="box-body">
                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--数据列表-->
                                <table class="table table-bordered table-striped table-hover dataTable" style="text-align: center">
                                    <thead>
                                    <tr>
                                        <th style="text-align: center">ID</th>
                                        <th style="text-align: center">姓名</th>
                                        <th style="text-align: center">借出数量</th>
                                        <th style="text-align: center">电话号码</th>
                                        <th style="text-align: center">借出时间</th>
                                        <th style="text-align: center">归还时间</th>
                                        <th style="text-align: center">详细</th>
                                        <th style="text-align: center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${rtnList}" varStatus="vs" var="rtn">
                                        <tr>
                                            <td>${vs.index+1}</td>
                                            <td>${rtn.borrower}</td>
                                            <td>${rtn.borrowNum}</td>
                                            <td>${rtn.borrowerTel}</td>
                                            <td>${rtn.borrowTimeStr}</td>
                                            <td>${rtn.returnTimeStr}</td>
                                            <td>${rtn.description}</td>

                                            <td class="text-center">
                                                <button type="button" class="btn bg-red btn-xs" onclick='del(${rtn.id})'>删除</button>
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


            <%--新建框--%>
            <div id="myModal" class="modal fade" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <form id="myForm" method="post">
                        <div class="modal-content" style="border-radius: 6px">
                            <div class="modal-header">
                                <h4 class="modal-title" id="title">新建</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group text-center">
                                    <input type="hidden" name="equipmentId" value="${equipment.id}">

                                    <label for="name" class="col-md-3">姓名</label>
                                    <div class="col-md-9">
                                        <input id="name" type="text" class="form-control" placeholder="姓名" name="borrower" required="required">
                                    </div>
                                    <br>
                                    <br>

                                    <label for="type" class="col-md-3">数量</label>
                                    <div class="col-md-9">
                                        <input id="type" type="number" min="1" max="${equipment.num}" class="form-control" placeholder="数量" name="borrowNum" required="required">
                                    </div>
                                    <br>
                                    <br>
                                    <label for="place" class="col-md-3">电话号码</label>
                                    <div class="col-md-9">
                                        <input id="place" type="text" maxlength="11" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" placeholder="电话号码" name="borrowerTel" required="required">
                                    </div>
                                    <br>
                                    <br>

                                    <label for="description" class="col-md-3">详细</label>
                                    <div class="col-md-9" >
                                        <input type="text" id="description" class="form-control" placeholder="可填···" name="description"/>
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
<script>

    $("#myForm").submit(function () {
        //todo 解决空格变成加号问题
        var data = $('#myForm').serialize().replace(/\+/g," ");
        data = decodeURIComponent(data,true);
        //处理data 转成json格式
        var dataArr = data.split("&");
        var res = {};
        for (var i = 0; i < dataArr.length; i++) {
            var str = dataArr[i].split("=");
            res[str[0]] = str[1];
        }

        $.ajax({
            type: "POST",   //提交的方法
            dataType: "json",
            contentType : 'application/json',//添加这句话
            url:"${pageContext.request.contextPath}/lendDetails/save", //提交的地址
            async: false,
            data:JSON.stringify(res),
            error: function() {  //失败的话
                alert("执行失败!")
            },
            success: function(data) {  //成功
                //todo
                alert("执行成功!");
                location.reload();
            }
        });
    });


    function del(id)
    {
        if(confirm("您确定要删除吗？"))
        {
           url = "${pageContext.request.contextPath}/lendDetails/deleteByIds?ids="+id;
           $.get(url,function (data) {
               location.reload();
           })
        }
    }

    function rtn(id,borrowNum,borrower,equipmentId){
        if(confirm("确认归还？"))
        {
            var res = {};
            res['id'] = id;
            res['borrowNum'] = borrowNum;
            res['returner'] = borrower;
            res['equipmentId'] = equipmentId;

            $.ajax({
                type: "POST",   //提交的方法
                dataType: "json",
                contentType : 'application/json',//添加这句话
                url:"${pageContext.request.contextPath}/lendDetails/rtnEquipment", //提交的地址
                async: false,
                data:JSON.stringify(res),
                error: function() {  //失败的话
                    alert("归还失败！")
                },
                success: function(data) {  //成功
                    location.reload();
                }
            });
        }
    }


    $(function() {
        $('#lendList').DataTable({
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

        $('#teams').DataTable({
            "paging": false,
            "lengthChange": false,
            "searching": true,
            "ordering": false,
            "info": false,
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