﻿<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Guest/Ask/Ask.master" inherits="Guest_AskStar, App_Web_xp4yovfz" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>问答中心-问答之星</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="navbar navbar-default" role="navigation" id="guest_nav">
<div class="container">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="/Guest">留言反馈</a>
</div>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="/Ask">问答首页</a></li>
<li><a href="/Guest/Ask/List.aspx" target="_blank">问题库</a></li>
<li class="active"><a href="/Guest/Ask/Add.aspx" target="_blank">在线提问</a></li>
<li><a href="/Guest/Ask/Star.aspx" target="_blank">问答专家</a></li>
<li><a href="/Guest/Ask/MyAskList.aspx" target="_blank">我的提问</a></li>
<li><a href="/Guest/Ask/MyAnswerlist.aspx" target="_blank">我的问答</a></li>
</ul>
</div>
</div>
</div>
<div class="container">
<ul class="breadcrumb">
<li>您的位置：<a href="/">网站首页</a></li>
<li><a href="/Ask">问答中心</a></li>
<li class="active">问答之星</li>
</ul> 
</div>
<div class="container">
<div class="header">    
<div class="h_mid">
<div class="h_mid_l"></div>
<div id="tdh" class="h_mid_m"> 
<ul class="list-inline">
<li><a title="问答首页" href="/Ask" class="btn btn-primary btn_guest">问答首页</a> </li>
<li class="on"><a title="问答之星" href="../Ask/Star.aspx" class="btn btn-primary btn_guest">问答之星</a></li>
<li><a title="分类大全" href="../Ask/Classification.aspx" class="btn btn-primary btn_guest">分类大全</a></li>
<li><span style="<%=getstyle()%>">   <a href="MyAskList.aspx?QueType=">我的提问</a> <a href="MyAnswerlist.aspx">我的回答</a></span></li>
</ul>
</div>
<div class="h_mid_r"></div>
</div>
<div class="clr"></div>
<div class="h_b">
<div class="h_b_l"></div>
<div class="h_b_m">
<div class="question_count">
<span class="count">最佳回答采纳率:</span><span class="adopt" ><%=getAdoption() %></span><br />
<span class="count">已解决问题数:</span><span class="countques" ><% =getSolvedCount() %></span><br />
<span class="count">待解决问题数:</span><span class="countques" ><% =getSolvingCount() %></span>
</div> 
<div class="tongji margin_t10">
<div id="move">
<div class="col-lg-1 col-md-1 col-sm-2 col-xs-12 padding0 sybz">
<a href="http://help.Zoomla.cn/?index/help.html" class="btn btn-primary btn_guest" title="帮助" target="_blank">使用<br />帮助</a>
</div>
<div class="col-lg-11 col-md-11 col-sm-10 col-xs-12">
<span class="count"><i class="fa fa-user guest_color margin_r5"></i>当前在线:</span><%=getLogined() %><br />
<span class="count"><i class="fa fa-user guest_color margin_r5"></i>注册用户:</span><%=getUserCount() %> 
</div>
</div>
</div>
<div class="clr"></div>
</div>
<div class="h_b_r"></div>
</div>
<div class="clr"></div>
</div>
<div class="clearfix"></div>
<div id="main" class="rg_inout">
<div class="clear"></div>
<asp:Repeater runat="server" ID="Repeater1" OnItemDataBound="Repeater1_ItemDataBound">
<ItemTemplate> 
<div class="starR">
<div>
<div class="starRimg">
<img src="../../Images/InitHead.gif" width='100px' height='100px' />
</div>
<div class="starRC">
<ul>
<li style="line-height:40px; float:none;">用户ID:<a href="../../ShowList.aspx?id=<%#Eval("UserID")%>" target='_blank'><%#Eval("UserName")%></a></li>
<div class="clear"></div>
<li class="sli1">回答数:<%#getanswer(Eval("UserID","{0}"))%></li>
<li class="sli1">采纳率:<%#getRat(Eval("UserID","{0}"))%></li>
<li class="sli1">提问数:<%#getask(Eval("UserID","{0}"))%></li>
<li class="sli1">问答积分:<%#Eval("GuestScore","{0}")%></li>
</ul>
</div>
<div class="starRW">
精选解答:  <a href='Add.aspx?fix=<%#Eval("UserID") %>' class="button1">向TA提问</a>
<asp:Repeater runat="server" ID="Repeater2">
<ItemTemplate>
<br /><a href="SearchDetails.aspx?ID=<%#Eval("ID")%>" target='_blank' title=" "><%#Eval("Qcontent")%></a>
</ItemTemplate>
</asp:Repeater>
</div>
</div>
<div class="clr"></div>
</div>
</ItemTemplate>
</asp:Repeater>
</div>
</div>
<div class="ask_bottom">
<p class="text-center"><a target="_blank" title="如何提问" href="http://help.Zoomla.cn/?index/help.html#如何提问">如何提问</a> <a target="_blank" title="如何回答" href="http://help.Zoomla.cn/?index/help.html#如何回答">如何回答</a> <a target="_blank" title="如何获得积分" href="http://help.Zoomla.cn/?index/help.html#如何获得积分">如何获得积分</a> <a target="_blank" title="如何处理问题" href="http://help.Zoomla.cn/?index/help.html#如何处理问题">如何处理问题</a></p>
<p class="text-center"><%Call.Label("{$Copyright/}"); %></p>
</div>
</asp:Content>
