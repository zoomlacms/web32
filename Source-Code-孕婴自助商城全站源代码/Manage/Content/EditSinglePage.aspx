﻿<%@ page language="C#" autoeventwireup="true" inherits="Manage_I_Content_EditSinglePage, App_Web_nwacx0ki" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDown" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>修改单页节点</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <ul class="nav nav-tabs">
        <li class="active"><a href="#Tabs0" data-toggle="tab">基本信息</a></li>
        <li><a href="#Tabs1" data-toggle="tab">栏目选项</a></li>
        <li><a href="#Tabs2" data-toggle="tab">生成选项</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="Tabs0">
            <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover" style="margin: 0 auto;">
                <tbody>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>所属节点：</strong>
                        </td>
                        <td>
                            <input id="ADHid" type="hidden" value="" runat="server" />
                            &nbsp;<asp:Label ID="LblNodeName" runat="server" Text=""></asp:Label>
                            <asp:HiddenField ID="HdnParentId" Value="0" runat="server" />
                            <asp:HiddenField ID="HdnDepth" Value="0" runat="server" />
                            <asp:HiddenField ID="HdnOrderID" Value="0" runat="server" />
                            <asp:HiddenField ID="HdnNodeID" Value="0" runat="server" />
                            <asp:HiddenField ID="HdnKeyName" Value="0" runat="server" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>单页名称：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtNodeName" class="form-control pull-left" Style="max-width: 200px;" AutoPostBack="true" runat="server" Columns="30" OnTextChanged="TxtNodeName_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="tips" ForeColor="Red" runat="server" ErrorMessage="标识符不能为空！" ControlToValidate="TxtNodeDir" Display="Dynamic" SetFocusOnError="True" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>单页标识符：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtNodeDir" OnTextChanged="TxtNodeDir_TextChanged" CssClass="form-control pull-left" Style="max-width: 200px;" MaxLength="20" runat="server" Columns="20" Enabled="false" AutoPostBack="true"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="修改" Style="margin-left: 5px;" CssClass="btn btn-primary" OnClick="Button1_Click" />
                            <asp:RequiredFieldValidator ID="ValrNodeIdentifier" ForeColor="Red" runat="server" ErrorMessage="标识符不能为空！" ControlToValidate="TxtNodeDir" Display="Dynamic" SetFocusOnError="True" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>栏目图片地址：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtNodePicUrl" class="form-control pull-left" Style="max-width: 300px;" MaxLength="255" runat="server" Columns="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>单页提示：</strong>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtTips" class="form-control pull-left" Style="max-width: 300px;" runat="server" Columns="60" Height="60px" Rows="2" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>单页说明：</strong><br />
                            用于在单页页详细介绍单页信息，支持HTML
                        </td>
                        <td>
                            <asp:TextBox ID="TxtDescription" class="form-control pull-left" Style="max-width: 300px;" runat="server" Columns="60" Height="65px" Rows="2" TextMode="MultiLine" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>单页META关键词：</strong><br />
                            针对搜索引擎设置的关键词<br />
                        </td>
                        <td>
                            <asp:TextBox ID="TxtMetaKeywords" class="form-control pull-left" Style="max-width: 300px;" runat="server" Height="65px" Columns="60" Rows="4" TextMode="MultiLine" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>单页META网页描述：</strong><br />
                            针对搜索引擎设置的网页描述<br />
                        </td>
                        <td>
                            <asp:TextBox ID="TxtMetaDescription" class="form-control pull-left" Style="max-width: 300px;" runat="server" Height="65px" Columns="60" Rows="4" TextMode="MultiLine" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs1">
            <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover" style="margin: 0 auto;">
                <tbody>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>打开方式：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RBLOpenType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="0">原窗口打开</asp:ListItem>
                                <asp:ListItem Value="1">新窗口打开</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>内容打开方式：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RBLItemOpenType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="0">原窗口打开</asp:ListItem>
                                <asp:ListItem Value="1">新窗口打开</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>转换形式：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList runat="server" AutoPostBack="True" RepeatDirection="Horizontal" ID="RadioButtonList1">
                                <asp:ListItem Value="1">页面转换</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>内容防护：</strong>
                        </td>
                        <td class="style2">
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="SafeGuard">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>备注:如启用则将 <span style="color: #FF0000; background-color: #FFFF00">{ZL.Guard/}</span> 放到相应的容器中即能防止复制与盗链。
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>绑定互动管理：</strong><br />
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" class="form-control pull-left" Style="max-width: 150px;" runat="server"></asp:DropDownList>
                            <span class="tips" style='color: #1e860b;'>只能绑定节点类别的互动模块</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane" id="Tabs2">
            <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover" style="margin: 0 auto;">
                <tbody>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="tdbgleft">
                            <strong>指定单页模板：</strong>
                        </td>
                        <td align="left">
                            <%=PageCommon.GetTlpDP("TxtSinglepageTemplate") %>
                            <asp:HiddenField ID="TxtSinglepageTemplate_hid" runat="server" />
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td style="width: 288px" class="tdbgleft">
                            <strong>单页扩展名：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RBLListEx" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="0">.html</asp:ListItem>
                                <asp:ListItem Value="1">.htm</asp:ListItem>
                                <asp:ListItem Value="2">.shtml</asp:ListItem>
                                <asp:ListItem Value="3">.aspx</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
                        <td class="style3">
                            <strong>节点目录生成位置：</strong>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="RBLPosition" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">根目录下</asp:ListItem>
                                <asp:ListItem Selected="True" Value="1">继承父节点目录</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top:10px;">
        <tr>
            <td align="center">&nbsp; &nbsp;
			<asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存" OnClientClick="return EBtnS()" OnClick="EBtnSubmit_Click" runat="server" />&nbsp; &nbsp;
			<input name="Cancel" type="button" class="btn btn-primary" id="BtnCancel" value="取消" onclick="window.location.href = 'NodeManage.aspx'" />
            </td>
        </tr>
    </table>
    <ZL:TlpDown runat="server" />
    <style>
        .tips{ line-height:32px;margin-left:5px;}
    </style>
    <script src="/JS/chinese.js" type="text/javascript"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            Tlp_initTemp();
        });
        function Getpy(ontxt, id) {
            var str = document.getElementById(ontxt).value.trim();
            if (str == "") {
                document.getElementById(id).value = "";
                return;
            }
            var arrRslt = makePy(str);
            if (arrRslt.length > 0) {
                document.getElementById(id).value = arrRslt.toString().toLowerCase();
                if (document.getElementById(id).value.indexOf(',') > -1) {//判断栏目名称有多音字后栏目标识名“，”并去掉逗号后面的数据
                    var str = document.getElementById(id).value;
                    document.getElementById(id).value = str.split(',', 1);
                }
            }
        }
        function EBtnS() {
            var inLen = $("#Tabs0").children("input[type='text']").length;
            var Hidd = "";
            for (var i = 0; i < inLen; i++) {
                Hidd += $("#Tabs0").children("input[type='hidden']").eq(i).val() + "=" + $("#Tabs0").children("input[type='text']").eq(i).val() + "|";
            }
            $("#ADHid").val(Hidd);
            return true;
        }
    </script>
</asp:Content>