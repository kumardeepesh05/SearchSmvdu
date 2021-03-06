<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="JavaSrc.Connections"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SMVDU SEARCH| SMVDU SHARE </title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="images/icons/favicon.ico">
        <link rel="apple-touch-icon" href="images/icons/favicon.png">
        <link rel="apple-touch-icon" sizes="72x72" href="images/icons/favicon-72x72.png">
        <link rel="apple-touch-icon" sizes="114x114" href="images/icons/favicon-114x114.png">
        <!--Loading bootstrap css-->
        <link href="images/img/css/full-slider.css" rel="stylesheet" type="text/css"/>
        <link href="images/img/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="images/img/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
        <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
        <link type="text/css" rel="stylesheet" href="styles/jquery-ui-1.10.4.custom.min.css">
        <link type="text/css" rel="stylesheet" href="styles/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="styles/animate.css">
        <link type="text/css" rel="stylesheet" href="styles/all.css">
        <link type="text/css" rel="stylesheet" href="styles/main.css">
        <link type="text/css" rel="stylesheet" href="styles/style-responsive.css">
        <link type="text/css" rel="stylesheet" href="styles/zabuto_calendar.min.css">
        <link type="text/css" rel="stylesheet" href="styles/pace.css">
        <link type="text/css" rel="stylesheet" href="styles/jquery.news-ticker.css">
        <link type="text/css" rel="stylesheet" href="styles/jplist-custom.css">
        <script src="script/jquery-1.10.2.js" type="text/javascript"></script>
        <script src="script/jquery-ui1.js" type="text/javascript"></script>
        <script src="script/jquery.min.js" type="text/javascript"></script>
        <%
            Connection con = Connections.conn();
            
            String query = "select distinct filename from files";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            String Autostr = "";
            while (rs.next()) {
                Autostr = Autostr + "," + rs.getString(1);
            }
        %>
        <script>
            $(function () {
                var s = "<%=Autostr%>";
                var availableTags = s.split(",");
                
                $("#tags").autocomplete({
                    autoFocus: true,
                    source: availableTags
                });
            });
        </script>

    </head>
    <body>
        <div>

            <!--BEGIN BACK TO TOP-->

            <!--END BACK TO TOP-->
            <!--BEGIN TOPBAR-->
            <%
                if (((String) request.getSession().getAttribute("username")) != null) {
            %>
            <div id="header-topbar-option-demo" class="page-header-topbar">
                <nav id="topbar" role="navigation" style="margin-bottom: 0; position: fixed;" data-step="3" class="navbar navbar-default navbar-static-top">
                    <div class="navbar-header">
                        <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                        <a id="logo" href="home" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">SMVDU</span><span style="display: none" class="logo-text-icon">�</span></a></div>
                    <div class="topbar-main"><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a>
                        <form id="topbar-search" action="search" method="" class="hidden-sm hidden-xs" style="width:28%;">
                            <div class="input-icon right text-white"><a href="#" onclick="document.getElementById('topbar-search').submit();"><i class="fa fa-search"></i></a><input id="tags"  type="text" placeholder="Search here..." class="form-control text-white" name="searchtext"/></div>
                        </form>
                        <ul class="nav navbar navbar-top-links navbar-right mbn">
                            <%                    
                                if (((String) request.getSession().getAttribute("username")).equals("admin")) {
                            %>
                            <a href ="Searchbyadmin"><strong style="font-size: 14px;"><span class="fa fa-search"></span>&nbsp;Search</strong></a>
                            &nbsp;&nbsp;&nbsp;
                            <%                        
                                }%>
                            <a href ="UploadFrom"><strong style="font-size: 14px;"><span class="fa fa-cloud-upload"></span>&nbsp;Upload</strong></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href ="#"><strong style="font-size: 14px;"><span class="fa fa-globe"></span>&nbsp;About Us</strong></a>
                            &nbsp;&nbsp;&nbsp;
                            <%!                                
                                String fileid;
                            %>
                            <%
                                con = Connections.conn();
                                String username;
                                String image_path = "";
                                HttpSession hs = request.getSession();
                                username = (String) hs.getAttribute("username");
                                query = "select image from user where username='" + username + "'";
                                st = con.createStatement();
                                rs = st.executeQuery(query);
                                if (rs.next()) {
                                    image_path = rs.getString(1);
                                }
                                
                                Timestamp notificationstatustime = new Timestamp(System.currentTimeMillis());
                                String q = "select notificationtime from notification_status where username='" + username + "'";
                                st = con.createStatement();
                                rs = st.executeQuery(q);
                                while (rs.next()) {
                                    notificationstatustime = rs.getTimestamp(1);
                                }
                                
                                int count = 0;
                                String q1 = "select  notification,notifications.username,files.username ,notifications.idfiles,filedescription,filetags,filename,notificationdatetime,image from circle inner join notifications on notifications.username=circle.username inner join files on notifications.idfiles=files.idfiles inner join user  on circle.username=user.username where circle.circlename='" + username + "'";
                                st = con.createStatement();
                                rs = st.executeQuery(q1);
                                while (rs.next()) {
                                    if (rs.getTimestamp(8).after(notificationstatustime)) {
                                        count++;
                                    }
                                }
                            %>
                            <li class="dropdown"><a data-hover="dropdown" href="Setnewtimestamp" class="dropdown-toggle"><i class="fa fa-tasks fa-fw"></i><span class="badge badge-yellow"><%=count%></span></a>
                                <ul class="dropdown-menu dropdown-user pull-right" style="width:340px;">
                                    <div style="margin-left:4%;margin-top: 2%;"><strong>Notification</strong></div> 
                                    <div style="overflow: auto; max-height:500px;">
                                        <%
                                            if (count == 0) {
                                        %>
                                        <li class="divider"></li>
                                        <p style="padding: 3%;">No new notifications</p>
                                        <%        
                                            }
                                            Timestamp notificationtime = new Timestamp(System.currentTimeMillis());
                                            String q2 = "select  notification,notifications.username,files.username ,notifications.idfiles,filedescription,filetags,filename,notificationdatetime,image from circle inner join notifications on notifications.username=circle.username inner join files on notifications.idfiles=files.idfiles inner join user  on circle.username=user.username where circle.circlename='" + username + "' order by notificationdatetime desc";
                                            st = con.createStatement();
                                            rs = st.executeQuery(q2);
                                            while (rs.next()) {
                                                notificationtime = rs.getTimestamp(8);
                                                if (notificationtime.after(notificationstatustime)) {
                                        %>
                                        <li class="divider"></li>
                                        <a href="<s:url  action="fileview"><s:param name="fileid"><%=rs.getString(4)%></s:param></s:url>"> 
                                                    <fieldset>
                                                        <li style="height:50px;">
                                                            <div style="width:40px;float:left;padding-left:2%;">  
                                                                <img src="<%=rs.getString(9)%>" class="avatar img-responsive"/>
                                                    </div>
                                                    <div style="width: 235px; float: left; padding-left: 2%;">
                                                        <%=rs.getString(2)%>
                                                        <%=rs.getString(1)%> a <%=rs.getString(6)%>
                                                    </div>
                                                    <div style="width:30px;float:left;padding-right:2%;"><img data-src="images/movie.jpg" alt="avatar" class="media-object" src="images/<%=rs.getString(6)%>.jpg" style="width: 40px; height: 40px;">
                                                    </div>
                                                </li>
                                            </fieldset>
                                        </a>
                                        <%
                                                }
                                            }
                                        %>
                                    </div>
                                </ul>
                            </li>
                            <li class="dropdown topbar-user"><a data-hover="dropdown" href="#" class="dropdown-toggle"><img src="<%=image_path%>" alt="" class="img-responsive img-circle"/>&nbsp;<span class="hidden-xs"><s:property value="#session.username"/></span>&nbsp;<span class="caret"></span></a>
                                <ul class="dropdown-menu dropdown-user pull-right">
                                    <li><a href="Myprofile"><i class="fa fa-user"></i>My Profile</a></li>
                                    <li><a href="Addcircle"><i class="fa fa-circle-o"></i>Add Circle</a></li>
                                    <li><a href="Mailbox"><i class="fa fa-envelope"></i>My Inbox</a></li>
                                    <li><a href="Forum"><i class="fa fa-tasks"></i>Forum</a></li>
                                    <li class="divider"></li>
                                    <li><a href="Logout"><i class="fa fa-key"></i>Log Out</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>

            </div>
            <%
            } else {
            %>
            <div id="header-topbar-option-demo" class="page-header-topbar"  >
                <nav id="topbar" role="navigation" style="margin-bottom: 0; position: fixed;" data-step="3" class="navbar navbar-default navbar-static-top">
                    <div class="navbar-header">
                        <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                        <a id="logo" href="index.jsp" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">SMVDU</span><span style="display: none" class="logo-text-icon">�</span></a></div>
                    <div class="topbar-main"><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a>                        
                        <form id="topbar-search" action="search" method="" class="hidden-sm hidden-xs" style="width:38%;">
                            <div class="input-icon right text-white"><a href="#" onclick="document.getElementById('topbar-search').submit();"><i class="fa fa-search"></i></a><input id="tags"  onkeyup="showData(this.value);" type="text" placeholder="Search here..." class="form-control text-white" name="searchtext"/></div>
                        </form>

                        <div style="float:right; margin-top:1%; margin-right: 3%">
                            <a href ="LoginFrom"><strong style="font-size: 14px;"><span class="fa fa-cloud-upload"></span>&nbsp;Upload</strong></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href ="#"><strong style="font-size: 14px;"><span class="fa fa-globe"></span>&nbsp;About Us</strong></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href ="LoginFrom"><strong style="font-size: 14px;">Login</strong></a>
                            &nbsp;&nbsp;&nbsp;
                            <a href ="Register.jsp"><strong style="font-size: 14px;">Signup</strong></a>
                        </div>
                    </div>
                </nav>
            </div>
            <%        
                }
            %>