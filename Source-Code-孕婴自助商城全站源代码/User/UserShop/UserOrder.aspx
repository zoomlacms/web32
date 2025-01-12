﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_UserOrder, App_Web_agmfuvcs" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>我的店铺</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li><a href="ProductList.aspx">我的店铺</a></li>
        <li class="active">会员订单</li>
    </ol>
</div>
<div class="container btn_green"> 
        <uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
</div>
<div class="container">
    <div class="alert alert-success"><a href="ProductSaleList.aspx">总体销售统计</a> | <a href="ProductSale.aspx">商品销售排名</a> | <a href="ProductTypeSale.aspx">商品类别销售排名</a> | <a href="UserOrder.aspx">会员订单排名</a> | <a href="UserShopOrder.aspx">会员购物排名</a></div>
</div>
<div class="container">
    <div class="us_topinfo">
        <table class="table table-striped table-bordered table-hover" id="TABLE1">
            <tr align="center">
                <td width="5%" class="title">用户ID</td>
                <td width="10%" class="title">用户名</td>
                <td width="10%" class="title">注册时间</td>
                <td width="10%" class="title">电子信箱</td>
                <td width="10%" class="title">最后登录IP</td>
                <td width="10%" class="title">订单数量</td>
            </tr>

            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr class="">
                        <td height="22" class="tdbg" align="center"><%#Eval("UserID")%></td>
                        <td height="22" class="tdbg" align="center"><%#Eval("Username") %></td>
                        <td height="22" class="tdbg" align="center"><%#Eval("RegTime")%></td>
                        <td height="22" class="tdbg" align="center"><%#Eval("Email")%></td>
                        <td height="22" class="tdbg" align="center"><%#Eval("LastLoginIP")%></td>
                        <td height="22" class="tdbg" align="center"><%#Getordernum(Eval("Username","{0}"))%></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr class="tdbg">
                <td height="22" colspan="10" align="center" class="tdbgleft">共
                    <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
                    条记录 
                    <asp:Label ID="Toppage" runat="server" Text="" />
                    <asp:Label ID="Nextpage" runat="server" Text="" />
                    <asp:Label ID="Downpage" runat="server" Text="" />
                    <asp:Label ID="Endpage" runat="server" Text="" />
                    页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server" Text="" />页 
                    <asp:Label ID="pagess" runat="server" Text="" />条记录/页  转到第<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    </asp:DropDownList>页
                </td>
            </tr>
        </table>
    </div>
</div> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
    </script>
</asp:Content>
