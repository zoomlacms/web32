﻿<%@ page language="C#" autoeventwireup="true" inherits="manage.Page.PageTemplate, App_Web_02cfupoy" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>栏目管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="addtree" runat="server" Visible="false"></asp:Label>
        <table  class="table table-striped table-bordered table-hover">
            <tbody id="Tbody1">
                <tr>
                    <td class="td_s"><span>ID</span></td>
                    <td><span>栏目名称</span></td>
                    <td style="width: 10%"><span>启用状态</span></td>
                    <td style="width: 15%"><span>节点类型</span></td>
                    <td style="width: 25%"><span>相关操作</span></td>
                </tr>
                <tr>
                    <td >0</td>
                    <td><a href="javascrip:;"><span class="glyphicon glyphicon-folder-close"></span><span><asp:Label runat="server" ID="StyleName_L" /></span></a></td>
                    <td><span class="rd_green">启用</span></td>
                    <td>根栏目</td>
                    <td>
                        <a href="AddPageTemplate.aspx?StyleID=<%:StyleID %>">添加节点</a> | <a href="javascript:SetIF(0);">节点排序</a>
                    </td>
                </tr>
                <asp:Repeater ID="Temptable" runat="server">
                    <ItemTemplate>
                        <tr class="list<%# Eval("ParentID") %>" name="list<%# Eval("ParentID") %>" state="1" id="list<%#Eval("templateID")%>" onclick="showlist('<%# Eval("templateID") %>')">
                            <td><%#Eval("templateID")%></td>
                            <td>
                                <img src="/Images/TreeLineImages/t.gif" />
                                <a href="AddPageTemplate.aspx?menu=edit&sid=<%#Eval("templateID") %>"><span class='<%# getnodesrc(Eval("templateID","{0}"))%>'></span> <%#gettempname(Eval("templateID", "{0}"))%></a>
                            </td>
                            <td><%#getistrue(Eval("isTrue","{0}"))%></td>
                            <td><%#gettemptype(Eval("templateType","{0}"))%></td>
                            <td><%#getaddnode(Eval("templateID", "{0}"))%><%#getmodefy(Eval("templateID", "{0}"))%><%#getdelbotton(Eval("templateID","{0}"))%></td>
                        </tr>
                        <%#getparentid(Eval("templateID","{0}")) %>
                    </ItemTemplate>
                </asp:Repeater>
                
            </tbody>
        </table>
    <div class="text-center" runat="server" id="updatetemplate">
        <span>首页模板地址:</span>
        <div class="btn-group Template_btn">
            <button type="button" class="btn btn-default dropdown-toggle text_300" data-toggle="dropdown" aria-expanded="false">
                <span class="gray_9"><i class="fa fa-warning"></i>点击选择模板!</span> <span class='pull-right'><span class='caret'></span></span>
            </button>
            <ul class="dropdown-menu Template_files" role="menu">
            </ul>
           <asp:HiddenField ID="templateUrl" runat="server" />
        </div>
       <%-- <input type="button" value="选择模板" class="btn btn-primary" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('templateUrl') + '&FilesDir=', 650, 480)" />--%>
        <asp:Button ID="Button1" runat="server" Text="更新" CssClass="btn btn-primary" OnClick="Button1_Click" />
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 900px; margin: auto;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">黄页节点排序</h4>
                </div>
                <div class="modal-body">
                    <iframe id="oif" src="SetNodeOrder.aspx?ParentID=0" style="width: 100%; height: 500px;"></iframe>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
    <button id="modBtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="display:none;"></button>
    <div style="display:none;">
        <ul id="templist_ul">
            <asp:Repeater ID="TempList_RPT" runat="server">
                <ItemTemplate>
                    <li><%#GetFileInfo() %></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <script>
            function SetIF(id)
            {
                var url = "SetNodeOrder.aspx?ParentID=" + id;
                $("#oif").attr("src", url);
                $("#modBtn").click();
            }
            $().ready(function () {
                
            })
            function showlist(sid) {
                var i = 0;
                var j = 0;
                var state = $("#list" + sid).attr("state");
                if (sid == "0") {
                    for (i = 3; i <= $("tr").length; i++) {
                        if (state == "1") {
                            $("tr:nth-child(" + i + ")").css("display", "none");
                            $("tr:nth-child(" + i + ")").attr("state", "1");
                        }
                        else {
                            $(".list" + sid).css("display", "");
                            $("tr:nth-child(" + i + ")").attr("state", "0");
                        }
                    }
                }
                else {
                    for (i = 1; i <= $("tr").length - 1; i++) {
                        if ($("tr:nth-child(" + i + ")").attr("name") == $("#list" + sid).attr("name") && $("tr:nth-child(" + i + ")").attr("id") == ("list" + sid)) {
                            j++;
                            continue;
                        }
                        if (j == 1 && $("tr:nth-child(" + i + ")").attr("name") == $("#list" + sid).attr("name")) {
                            j++;
                            break;
                        }
                        switch (j) {
                            case 1:
                                if (state == "0") {
                                    if ($("tr:nth-child(" + i + ")").attr("name") != "list0") {
                                        $("tr:nth-child(" + i + ")").css("display", "none");
                                        $("tr:nth-child(" + i + ")").attr("state", "0");
                                    }
                                }
                                else {
                                    $(".list" + sid).css("display", "");
                                    $("tr:nth-child(" + i + ")").attr("state", "1");
                                }
                                break;
                        }
                    }
                }
                if (state == "1")
                    $("#list" + sid).attr("state", "0");
                else
                    $("#list" + sid).attr("state", "1");
                if ($("#list" + sid).next().attr("name") == $("#" + $("#list" + sid).attr("name")).attr("name"))
                    $("#list" + sid).attr("state", "1");
            }
        </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $(function () {
            initTempFiles();
        })
    </script>
</asp:Content>
