
<%@taglib uri="/struts-tags" prefix="s"%>
<div id="wrapper">
    <!--BEGIN SIDEBAR MENU-->
    <br/><br/><br/>
    <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
         data-position="right" class="navbar-default navbar-static-side" style="min-height: 100%; position: fixed; margin-top: -5px;">
        <div class="sidebar-collapse menu-scroll">
            <ul id="side-menu" class="nav">
                <div class="clearfix"></div>
                <div class="clearfix"></div>
                <li class="active"><a href="home"><i class="fa fa-home fa-fw">
                            <div class="icon-bg bg-orange"></div>
                        </i><span class="menu-title">Home</span></a></li>

                <li><a href="Popular"><i class="fa fa-desktop fa-fw">
                            <div class="icon-bg bg-pink"></div>
                        </i><span class="menu-title">Popular on SMVDU</span></a>

                </li>
                <li><a href="Recently"><i class="fa fa-envelope-o">
                            <div class="icon-bg bg-primary"></div>
                        </i><span class="menu-title">Recentaly Added</span></a>

                </li>
                <li><a href="<s:url action="searchtags"><s:param name="tagname">Video</s:param></s:url>">
                        <i class="fa fa-video-camera fa-fw">
                            <div class="icon-bg bg-grey"></div>
                        </i><span class="menu-title">videos</span></a>

                </li>
                <li><a href="<s:url action="searchtags"><s:param name="tagname">Software</s:param></s:url>">
                        <i class="fa fa-sitemap fa-fw">
                            <div class="icon-bg bg-dark"></div>
                        </i><span class="menu-title">Softwares</span></a>

                </li>
                <li><a href="<s:url action="searchtags"><s:param name="tagname">Music</s:param></s:url>">
                       <i class="fa fa-music fa-fw">
                            <div class="icon-bg bg-green"></div>
                        </i><span class="menu-title">Musics</span></a>

                </li>
                <li><a href="<s:url action="searchtags"><s:param name="tagname">Sport</s:param></s:url>">
                       <i class="fa fa-spotify fa-fw">
                            <div class="icon-bg bg-violet"></div>
                        </i><span class="menu-title">Sports</span></a>

                </li>
                <li><a href="<s:url action="searchtags"><s:param name="tagname">Book</s:param></s:url>">
                        <i class="fa fa-book">
                            <div class="icon-bg bg-blue"></div>
                        </i><span class="menu-title">Books</span></a>

                </li>
                <li><a href="<s:url action="searchtags"><s:param name="tagname">Game</s:param></s:url>">
                        <i class="fa fa-gamepad fa-fw">
                            <div class="icon-bg bg-red"></div>
                        </i><span class="menu-title">Games</span></a>

                </li>
                <li><a href="<s:url action="searchtags"><s:param name="tagname">Project</s:param></s:url>">
                       <i class="fa fa-file-video-o fa-fw">
                            <div class="icon-bg bg-yellow"></div>
                        </i><span class="menu-title">Projects</span></a>
                </li>
                <li><a href="<s:url action="searchtags"><s:param name="tagname">Paper</s:param></s:url>">
                       <i class="fa fa-university fa-fw">
                            <div class="icon-bg bg-yellow"></div>
                        </i><span class="menu-title">Papers</span></a>
                </li>
                <li><a href="<s:url action="searchtags"><s:param name="tagname">Other</s:param></s:url>">
                       <i class="fa fa-database">
                            <div class="icon-bg bg-yellow"></div>
                        </i><span class="menu-title">Others</span></a>
                </li>
            </ul>
        </div>
    </nav>

