﻿<%@ page language="C#" autoeventwireup="true" inherits="ZoomLa.WebSite.Admin.Prompt.ShowSuccess, App_Web_gzj3x0td" enableviewstatemac="false" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %><!DOCTYPE HTML>
<html>
<head id="Head1" runat="server">
    <title>成功提示信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
    <!--[if lt IE 9]>
	    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/JS/jquery-1.9.1.min.js"></script>
    <%=link %>
</head>
<body>
    <form id="form1" runat="server">
        <div class="panel panel-primary" style="width: 400px; margin: auto; margin-top: 12%;">
            <div class="panel-heading">
                <h3 class="panel-title"><span class="glyphicon glyphicon-ok pull-left"></span>成功信息</h3>
            </div>
            <div class="panel-body text-center">
                <p class="text-center"><asp:Literal ID="LtrSuccessMessage" runat="server"></asp:Literal></p>
            </div>
             <div class="panel-footer" style="text-align:center;">
                <asp:HyperLink ID="LnkReturnUrl" runat="server" class="btn btn-primary" ToolTip="返回上一页"><span class="glyphicon glyphicon-repeat"></span>返回上一页</asp:HyperLink>
            </div>
        </div>
        <style type="text/css">.glyphicon{margin-right:3px;}</style>
        <script type="text/javascript">
            function AutoReturn(url,time){setTimeout(function () { location = url },time);}
            function SetUrl(url) { $("#LnkReturnUrl").attr("href", url); }
        </script>
        <style type="text/css">ul li{list-style-type:none;}</style>   
    </form>
</body>
</html>
