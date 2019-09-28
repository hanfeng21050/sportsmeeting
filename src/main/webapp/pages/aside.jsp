<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
                     class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>
                    <security:authentication property="principal.username"></security:authentication>
                </p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>
            <li id="admin-index"><a
                    href="${pageContext.request.contextPath}/pages/main.jsp"><i
                    class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <li class="treeview"><a href="#"> <i class="fa fa-align-justify"></i>
                <span>比赛管理</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>


            </a>
                <ul class="treeview-menu">

                    <li id="system-setting">
                        <security:authorize access="hasRole('ADMIN')">
                            <a
                                    href="${pageContext.request.contextPath}/project/findAll"> <i
                                    class="fa fa-circle-o"></i> 比赛列表
                            </a>
                        </security:authorize>
                    </li>
                    <li id="system-setting"><a
                            href="${pageContext.request.contextPath}/role/findAll"> <i
                            class="fa fa-circle-o"></i> 报名审核
                    </a></li>
                    <li id="system-setting"><a
                            href="${pageContext.request.contextPath}/permission/findAll">
                        <i class="fa fa-circle-o"></i> 器材管理
                    </a></li>
                    <li id="system-setting"><a
                            href="${pageContext.request.contextPath}/sysLog/findAll"> <i
                            class="fa fa-circle-o"></i> 成绩打印
                    </a></li>
                </ul>
            </li>
            <li class="treeview"><a href="#"> <i class="fa fa-user"></i>
                <span>用户管理</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>
            </a>
                <ul class="treeview-menu">

                    <li id="system-setting"><a
                            href="${pageContext.request.contextPath}/user/findByPage">
                        <i class="fa fa-circle-o"></i> 用户列表
                    </a></li>
                    <li id="system-setting"><a
                            href="${pageContext.request.contextPath}/athlete/findByPage"> <i
                            class="fa fa-circle-o"></i> 运动员列表
                    </a></li>

                </ul>
            </li>

            <li class="treeview"><a href="#"> <i class="fa fa-users"></i>
                <span>团队管理</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>
            </a>
                <ul class="treeview-menu">

                    <li id="system-setting"><a
                            href="">
                        <i class="fa fa-circle-o"></i> 团队列表
                    </a></li>
                    <li id="system-setting"><a
                            href=""> <i
                            class="fa fa-circle-o"></i> XXX
                    </a></li>

                </ul>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>