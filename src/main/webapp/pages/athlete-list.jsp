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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
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
		<!-- @@master = admin-layout.html-->
		<!-- @@block = content -->

		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
				<h1>
					用户管理 <small>运动员列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="#">用户管理</a></li>
					<li class="active">运动员列表</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default bg-yellow" onclick="get_User_Nation_list()" title="新建" data-toggle="modal" data-target="#myModal">
											<i class="fa fa-file-o"></i> 新建
										</button>
										<button type="button" class="btn btn-default bg-red" title="删除" id="delSelected">
											<i class="fa fa-trash-o"></i> 删除
										</button>
									</div>
								</div>
							</div>
							<div class="box-tools pull-right">
								<div class="has-feedback">
									<input type="text" class="form-control input-sm"
										placeholder="搜索"> <span
										class="glyphicon glyphicon-search form-control-feedback"></span>
								</div>
							</div>
							<!--工具栏/-->

							<!--数据列表-->
							<form id="selection" action="${pageContext.request.contextPath}/athlete/deleteByIds" method="post">
								<table id="dataList"
									   class="table table-bordered table-striped table-hover dataTable" style="text-align: center">
									<thead>
									<tr>
										<th class="" style="vertical-align: middle;margin:auto; padding:10px" width="20px"><input
												id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th style="text-align: center">ID</th>
										<th style="text-align: center">姓名</th>
										<th style="text-align: center">运动员编号</th>
										<th style="text-align: center">性别</th>
										<th style="text-align: center">年龄</th>
										<th style="text-align: center">体重</th>
										<th style="text-align: center">身高</th>
										<th style="text-align: center">民族</th>
										<th style="text-align: center">身份证号码</th>
										<th style="text-align: center">操作</th>

									</tr>
									</thead>
									<tbody>


									<c:forEach items="${pageInfo.list}" var="athlete" varStatus="status">

										<tr>
											<td><input name="ids" type="checkbox" value="${athlete.id}"></td>
											<td>${status.index+1}</td>
											<td>${athlete.name}</td>
											<td>${athlete.playerNum}</td>
											<td>${athlete.gender == false? "男":"女"}</td>
											<td>${athlete.age}</td>
											<td>${athlete.weight}</td>
											<td>${athlete.height}</td>
											<td>${athlete.nationId}</td>
											<td>${athlete.idNum}</td>
											<td>
												<button type="button" class="btn bg-olive btn-xs" onclick="location.href='${pageContext.request.contextPath}/athlete/findDetailsById?id=${athlete.id}'">详情</button>
												<button type="button" class="btn bg-red btn-xs" onclick="deleteAthlete(${athlete.id})">删除</button>
												<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#myModal">修改</button>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<!-- /.box-body -->

					<!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages}页，共${pageInfo.total}条数据。 每页
                            <select id="selectSize" class="form-control" onchange="changePageSize()">
                                <option selected="selected">--</option>
								<option value="15">15</option>
                                <option value="30">30</option>
                                <option value="45">45</option>
                                <option value="60">60</option>
                                <option value="75">75</option>
								<option value="100">100</option>
                            </select> 条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li>
                                <a href="${pageContext.request.contextPath}/user/findByPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/user/findByPage?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>

							<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
								<li><a href="${pageContext.request.contextPath}/user/findByPage?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
							</c:forEach>

                            <li><a href="${pageContext.request.contextPath}/user/findByPage?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/user/findByPage?page=${pageInfo.pages}&size=${pageInfo.pageNum}" aria-label="Next">尾页</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /.box-footer-->
				</div>

				<%--保存弹出窗--%>
				<div id="myModal" class="modal fade" role="dialog" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<form id="myForm" method="post">
							<div class="modal-content" style="border-radius: 6px">
								<div class="modal-header">
									<h4 class="modal-title" id="title">新建</h4>
								</div>
								<div class="modal-body">
									<div class="form-group text-center">
										<input type="hidden" name="id" id="id">

										<%--updateOrInsert 用于判断当前模态窗口是新增还是修改--%>
										<%--<input type="hidden" id="updateOrInsert" name="updateOrInsert" value="insert">--%>

										<label for="name" class="col-sm-3 control-label">真实姓名</label>
										<div class="col-sm-9">
											<input id="name" type="text" class="form-control rounded" placeholder="真实姓名" name="name" required="required">
										</div>
										<br>
										<br>

										<label for="playerNum" class="col-sm-3 control-label">运动员编号</label>
										<div class="col-sm-9">
											<input id="playerNum" type="text" class="form-control rounded" placeholder="运动员编号" name="playerNum" required="required">
										</div>
										<br>
										<br>

										<label for="gender" class="col-sm-3 control-label">性别</label>
										<div class="col-sm-9">
											<select id="gender" style="width: 100%;" name="gender">
												<option value="0">男</option>
												<option value="1">女</option>
											</select>
										</div>
										<br>
										<br>

										<label for="age" class="col-md-3 control-label">年龄</label>
										<div class="col-md-9">
											<input id="age" type="number" class="form-control" placeholder="年龄" name="age" min="1" max="100"  required="required">
										</div>
										<br>
										<br>

										<label for="height" class="col-md-3 control-label">身高</label>
										<div class="col-md-9">
											<input id="height" type="number" class="form-control" placeholder="身高/cm" name="height" min="1" max="300"  required="required">
										</div>
										<br>
										<br>

										<label for="weight" class="col-md-3 control-label">体重</label>
										<div class="col-md-9">
											<input id="weight" type="number" class="form-control" placeholder="体重/kg" name="weight" min="1" max="300"  required="required">
										</div>
										<br>
										<br>

										<label for="nation" class="col-md-3 control-label">民族</label>
										<div class="col-md-9">
											<select id="nation" style="width: 100%;" name="nationId">
											</select>
										</div>
										<br>
										<br>

										<label for="idNum" class="col-md-3 control-label">身份证号码</label>
										<div class="col-md-9">
											<input id="idNum" type="text" class="form-control"  maxlength=18 name="idNum" placeholder="请输入身份证号码">
										</div>
										<br>
										<br>

										<label for="user" class="col-md-3 control-label">注册用户</label>
										<div class="col-md-9">
											<select id="user" style="width: 100%;" name="userId">
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
		function get_User_Nation_list()
		{
			var url = "${pageContext.request.contextPath}/athlete/getMessage/type/0";
			$.ajax({
				type: "Get",   //提交的方法
				dataType: "json",
				contentType : 'application/json',//添加这句话
				url:url, //提交的地址
				async: false,
				success: function(data) {  //成功
					console.log(data);
					/*民族*/
					var html = "";
					var nationList = data.nationList;
					for (var i = 0; i < nationList.length; i++) {
						html+= "<option value=\""+nationList[i].id +"\">"+ nationList[i].name                                 +"</option>";
					}
					$("#nation").html(html);

					/*用户*/
					var html = "";
					var userList = data.userList;
					for (var i = 0; i < userList.length; i++) {
						html+= "<option value=\""+userList[i].id +"\">"+ userList[i].username+"</option>";
					}
					$("#user").html(html);
				}
			});
		}


		$('#myModal').on('hidden.bs.modal', function (){
			document.getElementById("myForm").reset();
			$("#btn").text('保存');
			$("#title").text('新增');
		});


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
			console.log(res)

			$.ajax({
				type: "POST",   //提交的方法
				dataType: "json",
				contentType : 'application/json',//添加这句话
				url:"${pageContext.request.contextPath}/athlete/save", //提交的地址
				async: false,
				data:JSON.stringify(res),
				error: function() {  //失败的话
					alert("执行失败!")
				},
				success: function() {  //成功
					alert("执行成功!")
				}
			});
		});



		function deleteAthlete(id)
		{
			if(confirm("您确定要删除吗？"))
			{
				location.href='${pageContext.request.contextPath}/athlete/deleteByIds?ids='+id;
			}
		}

		document.getElementById("delSelected").onclick = function () {
			if(confirm("你确定要删除选中条目吗"));
			{
				document.getElementById("selection").submit();
			}
		}

		$("#refresh").click(function () {
			window.location.reload(true);
		});

		function changePageSize() {
			//获取下拉框的值
			var size = $("#selectSize").val();
			//向服务器发送请求，改变没页显示条数
			location.href = "${pageContext.request.contextPath}/user/findByPage?page=1&size="+size;
		}

		$(document).ready(function() {

			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
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
			setSidebarActive("admin-datalist");

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