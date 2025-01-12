﻿<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_ImgWorkFlow, App_Web_juajtetg" masterpagefile="~/User/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>查看流程图</title>
<style>
#myDiagram{height:400px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="myDiagram">
    </div>
    <asp:HiddenField ID="ImgData_Hid" runat="server" />
    <script src="/Plugins/Third/go/go.js" type="text/javascript"></script>
    <script src="/js/plugs/ZL_Diagram.js" type="text/javascript"></script>
    <script>
        $().ready(function () {
            var datas = JSON.parse($("#ImgData_Hid").val());//流程数据源
            var proname = datas[0] ? datas[0].ProcedureName : "请为该流程添加步骤!";
            ZL_Diagram.InitDiagram("myDiagram", proname, datas);
        });
    </script>
</asp:Content>
