﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Question_SelectAllStudent, App_Web_ww31l4fh" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
<title>成绩查询</title>
<link href="../../App_Themes/AdminDefaultTheme/Guide.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/index.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/AdminDefaultTheme/main.css" type="text/css" rel="stylesheet" />
<link href="../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
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
<style>
th { background:none #CBE6FC;}
</style>
</head>
<body>
<form id="form1" runat="server">
 <div class="us_topinfo" style="width: 97%">
您现在的位置：<a title="网站首页" href="/" target="_blank"><asp:Label ID="LblSiteName" runat="server" Text=""></asp:Label></a>&gt;&gt; <a title="会员中心" href="/User/Default.aspx" target="_parent">会员中心</a> &gt;&gt; <a href="MyMarks.aspx">我的成绩</a>
</div>
  <br />
  <table width="100%" border="0" cellpadding="2" cellspacing="1" class="border" style="margin: 0 auto;">
    <tr align="center" >
      <th width="5%"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></th>
      <th width="5%">考试编号</th>
      <th width="10%">试卷名称</th>
      <th width="7%">评卷老师</th>
      <th width="8%">分数</th>
      <th width="10%">考试时间</th>
      <th width="10%">操作</th>
    </tr>
    <asp:Repeater ID="Repeater1" runat="server">
      <ItemTemplate>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
          <td height="22" align="center"><input name="Item" type="checkbox" value='<%#Eval("ID") %>' /></td>
          <td height="22" align="center"><%#Eval("ID")%></td>
          <td height="22" align="center"><%#GetPName(Eval("PID", "{0}"))%></td>
          <td align="center"><%#Eval("GraderWill")%></td>
          <td height="22" align="center"><%#Eval("Fraction")%></td>
          <td height="22" align="center"><%#Eval("ExamTime")%></td>
          <td height="22" align="center"><a href="ExamAnswer.aspx?pid=<%#Eval("PID")%>&&sid=<%#Eval("ID") %>">查看</a><%--&nbsp<a href="?menu=delete&id=<%#Eval("ID")%>" OnClick="return confirm('确实要删除此课程吗？');">删除</a>--%></td>
        </tr>
      </ItemTemplate>
    </asp:Repeater>
    <tr class="tdbg">
      <td height="22" colspan="7" align="center" class="tdbg"> 共
        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
        条数据
        <asp:Label ID="Toppage" runat="server" Text="" />
        <asp:Label ID="Nextpage" runat="server" Text="" />
        <asp:Label ID="Downpage" runat="server" Text="" />
        <asp:Label ID="Endpage" runat="server" Text="" />
        页次：
        <asp:Label ID="Nowpage" runat="server" Text="" />
        /
        <asp:Label ID="PageSize" runat="server" Text="" />
        页
        <asp:TextBox ID="txtPage" runat="server" AutoPostBack="true" class="l_input" Width="22px"  OnTextChanged="txtPage_TextChanged"></asp:TextBox>
        条数据/页 转到第
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"> </asp:DropDownList>
        页
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPage" ErrorMessage="只能输入数字" Type="Integer" MaximumValue="100000" MinimumValue="0"></asp:RangeValidator></td>
    </tr>
  </table>
  <div>
    <asp:Button ID="Button3" class="i_bottom" Style="width: 110px;" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" Text="批量删除" onclick="Button3_Click" />
  </div>
</form>
</body>
</html>