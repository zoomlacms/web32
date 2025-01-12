﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Manage.Content.CreateLink, App_Web_nwacx0ki" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>Print Server</title>
    <script type="text/javascript">
        function Switch(obj) {
            obj.className = (obj.className == "guideexpand") ? "guidecollapse" : "guideexpand";
            var nextDiv;
            if (obj.nextSibling) {
                if (obj.nextSibling.nodeName == "DIV") {
                    nextDiv = obj.nextSibling;
                }
                else {
                    if (obj.nextSibling.nextSibling) {
                        if (obj.nextSibling.nextSibling.nodeName == "DIV") {
                            nextDiv = obj.nextSibling.nextSibling;
                        }
                    }
                }
                if (nextDiv) {
                    nextDiv.style.display = (nextDiv.style.display != "") ? "" : "none";
                }
            }
        }
        function OpenLink(lefturl, righturl) {
            if (lefturl != "") {
                parent.frames["left"].location = lefturl;
            }
            try {
                parent.MDIOpen(righturl); return false;
            } catch (Error) {
                parent.frames["main_right"].location = righturl;
            }
        }

        function gotourl(url) {
            try {
                parent.MDILoadurl(url); void (0);
            } catch (Error) {
                parent.frames["main_right"].location = "../" + url; void (0);
            }
        }
    </script>

</head>
<body id="Guidebody" style="margin: 0px; margin-top: 1px;">
    <form id="formGuide" runat="server">
        <div id="Div1">
            <ul>
                <li id="Guide_top">
                    <div id="Guide_toptext"><%=lang.LF("文件工厂")%></div>
                </li>
                <li id="Guide_main">
                    <div id="Guide_box">
                        <div class="guideexpand" onclick="Switch(this)">
                            <%=lang.LF("文档生成")%>
                        </div>
                        <div class="guide">
                            <ul>
                                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="../Plus/Doc.aspx" target="main_right">模板设置</a></li>
                            </ul>
                        </div>
                        <div class="guideexpand" onclick="Switch(this)"><%=lang.LF("在线印客")%></div>
                        <div class="guide">
                            <ul>
                                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="Print_Type.aspx" target="main_right"><%=lang.LF("类型设置")%></a></li>
                                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="PrintMaskList.aspx" target="main_right"><%=lang.LF("遮罩库")%></a></li>
                                <li class="guideli" onmouseover="this.className='guidelihover'" onmouseout="this.className='guideli'"><a href="Print_Photo.aspx" target="main_right"><%=lang.LF("图片输出")%></a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </form>
</body>
</html>
