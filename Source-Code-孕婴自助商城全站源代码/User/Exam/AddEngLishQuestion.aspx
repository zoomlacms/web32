﻿<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="manage_Question_AddEngLishQuestion, App_Web_pwji0luf" enableviewstatemac="false" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script src="/Plugins/Ueditor/ueditor.config.js" charset="utf-8"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js" charset="utf-8"></script>
<script src="/Plugins/Ueditor/kityformula-plugin/addKityFormulaDialog.js"></script>
<script src="/Plugins/Ueditor/kityformula-plugin/getKfContent.js"></script>
<script src="/Plugins/Ueditor/kityformula-plugin/defaultFilterFix.js"></script>
<%--    <script src="/Plugins/Ueditor/Formdesign/leipi.Formdesign.v4.js" charset="utf-8" ></script>--%>
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="/App_Themes/V3.css" />
<script type="text/javascript" src="/JS/OAKeyWord.js"></script>
<title>试题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li>您现在的位置：<a title="网站首页" href="/"><%= Call.SiteName%></a></li>
<li><a href="/user">用户中心</a></li>
<li><a href="QuestList.aspx">试题管理</a></li>
<li class="active">添加试题</li>
</ol>
</div>
<div class="container">
    <ul class="nav nav-tabs" style="border-bottom:none;">
        <li class="active"><a href="#basic" data-toggle="tab">基本信息</a></li>
        <li><a href="#question" id="questtype_a" data-toggle="tab">试题信息</a></li>
        <li><a href="#other" data-toggle="tab">解析说明</a></li>
    </ul>
    <table class="table table-striped table-bordered table-hover tab-content">
        <tbody id="basic" class="tab-pane active">
            <tr>
                <td class="td_m">试题标题</td>
                <td>
                    <asp:TextBox ID="txtP_title" runat="server" CssClass="form-control text_300 required" MaxLength="50" />
                    <span class="r_red">*</span>
                    <span id="titleNum_sp"></span>
                </td>
            </tr>
            <tr><td>教材版本</td><td>
                <asp:RadioButtonList ID="Version_Rad" runat="server" RepeatDirection="Horizontal" DataValueField="GradeID" DataTextField="GradeName"></asp:RadioButtonList>
             </td></tr>
            <tr>
                <td>所属年级</td>
                <td>
                    <asp:RadioButtonList ID="Grade_Radio" runat="server" RepeatDirection="Horizontal" DataValueField="GradeID" DataTextField="GradeName"></asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="td_l">试题类别</td>
                <td>
                    <div class="btn-group Quesst_Dr">
                        <button type="button" class="btn btn-default dropdown-toggle text-left text_300"><span class="curquest"><span class="gray_9"><i class="fa fa-warning"></i>点击选择类别!</span></span> <span class="pull-right"><span class="caret"></span></span></button>
                        <ul class="dropdown-menu Template_files" role="menu">
                            <asp:Literal ID="QuestType_Li" runat="server" EnableViewState="false"></asp:Literal>
                        </ul>
                    </div>
                    <asp:HiddenField ID="NodeID_Hid" runat="server" />
                    </td></tr>
            <tr>
                <td>难度:</td>
                <td>
                    <div style="width: auto; float: left">
                        <asp:RadioButtonList ID="rblDiff" runat="server" DataTextField="GradeName" DataValueField="GradeID" RepeatDirection="Horizontal" Height="22px">
                        </asp:RadioButtonList>
                    </div>
                </td>
            </tr>
            <tr>
                <td>题型:</td>
                <td>
                    <label><input type="radio" name="qtype_rad" value="0" checked="checked" />单选题 </label>
                    <label><input type="radio" name="qtype_rad" value="1" />多选题 </label>
                    <label><input type="radio" name="qtype_rad" value="2" />填空题 </label>
                    <label><input type="radio" name="qtype_rad" value="3" />解析题 </label>
                    <label><input type="radio" name="qtype_rad" value="4" />完形填空 </label>
                    <label id="bigrad"><input type="radio" name="qtype_rad" value="10" />大题</label>
                </td>
            </tr>
            <tr>
                <td>关键字:</td>
                <td>
                    <div id="OAkeyword"></div>
                    <asp:TextBox ID="TagKey_T" runat="server" Style="display: none;" CssClass="form-control text_300"></asp:TextBox>
                    <button type="button" onclick="ShowKeyWords()" class="btn btn-primary btn-sm">选择关键字</button>
                    <span class="rd_green">(使用空格键或回车键分隔关键字，每个关键字长度不超过5个)</span>
                </td>
            </tr>
            <tr>
                <td>分数:</td>
                <td>
                    <asp:TextBox ID="txtDefaSocre" runat="server" Text="5" CssClass="form-control text_xs"></asp:TextBox></td>
            </tr>
            <tr><td>是否共享:</td><td>
                <input type="checkbox" runat="server" id="IsShare_Chk" checked="checked" class="switchChk"/>
            </td></tr>
            <tr id="normaltr">
                <td>试题内容:<span class="rd_red">*</span></td>
                <td>
                    <asp:TextBox ID="txtP_Content" runat="server" Style="height: 200px; width: 100%;" TextMode="MultiLine"></asp:TextBox>
                    <%=Call.GetUEditor("txtP_Content",2) %>
                </td>
            </tr>
            <tr id="bigtr" style="display:none;">
                <td>试题内容</td>
                <td ng-app="app">
                    <div ng-controller="appController">
                        <table class="table table-bordered">
                            <tr><td>序号</td><td>试题名</td><td>类型</td><td>排序</td><td>操作</td></tr>
                            <tbody ng-repeat="item in list|orderBy:'-orderid'">
                                <tr>
                                    <td ng-bind="$index+1"></td>
                                    <td ng-bind="item.p_title"></td>
                                    <td>{{getTypeStr(item.p_Type)}}</td>
                                    <td>
                                        <input type="text" class="form-control int" style="width: 60px;" ng-model="item.orderid" /></td>
                                    <td><a href="javascript:;" ng-click="remove(item.p_id);" title="移除"><span class="glyphicon glyphicon-remove"></span></a></td>
                                </tr>
                            </tbody>
                        </table>
                        <button class="btn btn-primary btn-sm" type="button" onclick="ShowAdd()">添加小题</button>
                        <button class="btn btn-primary btn-sm" type="button" onclick="ShowSel()">题库引用</button>
                    </div>
                </td>
            </tr>
        </tbody>
        <tbody id="question" class="tab-pane">
            <tr>
                <td class="td_l">选项信息:</td>
                <td>
                    <span></span>
                    <asp:DropDownList ID="ddlNumber1" CssClass="form-control text_x" onchange="AddOption($(this).val());" runat="server">
                        <asp:ListItem Value="0">0</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                    </asp:DropDownList>
                    <div>
                        <ul id="option_ul"></ul>
                    </div>
                    <asp:Literal ID="Tips" runat="server" Visible="false"></asp:Literal>
                    <div id="optionDiv" runat="server" visible="false"></div>
                </td>
            </tr>
            <tr>
                <td>正确答案：<span class="rd_green">(仅用于自动改卷)</span></td>
                <td>
                    <asp:TextBox runat="server" ID="Answer_T" CssClass="form-control text_300"></asp:TextBox>
                    <span class="r_green_x">如有多个答案用|号分隔,用于支持自动批阅试卷,单选:A,多选:A|B,填空:值1|值2|值3</span>
                </td>
            </tr>
            <tr>
                <td>正确答案：<span class="rd_green">(教师与学生可见)</span></td>
                <td>
                    <asp:TextBox runat="server" ID="AnswerHtml_T" TextMode="MultiLine" Style="width: 100%; height: 200px;"></asp:TextBox>
                    <%=Call.GetUEditor("AnswerHtml_T",2) %>
                </td>
            </tr>
        </tbody>
        <tbody id="other" class="tab-pane">
            <tr>
                <td class="td_m">试题解析:</td>
                <td>
                    <textarea runat="server" id="txtJiexi" style="height: 200px; width: 100%;">
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; font-weight: bold; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;">【考点】</span></p>
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;"><span style="font-weight: bold;">【专题】</span></span></p>
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;"><span style="font-weight: bold;">【分析】</span></span></p>
                        <p style="white-space: normal;"><span style="font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;"><span style="font-weight: bold;">【解答】</span></span></p>
                        <p style="white-space: normal;"><span style="font-weight: bold; font-family: 宋体, sans-serif; font-size: 13px; letter-spacing: 1px; line-height: 25px; background-color: #FFFFFF;">【点评】</span></p>
                    </textarea>
                    <%=Call.GetUEditor("txtJiexi",2) %>
                </td>
            </tr>
        </tbody>
        <tbody>
            <tr><td colspan="2" class="text-center">
                <asp:HiddenField ID="Optioninfo_Hid" runat="server" />
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存试题" OnClientClick="return CheckData();" OnClick="EBtnSubmit_Click" runat="server" />
                <asp:Button ID="SaveNew_Btn" runat="server" Visible="false" Text="添加为新试题" CssClass="btn btn-primary" OnClick="Save_New_Btn_Click" />
                <a href="QuestList.aspx" class="btn btn-primary">返回列表</a>
            </td></tr>
        </tbody>
    </table>
    <div style="height:50px;"></div>
</div>
<asp:HiddenField ID="Qids_Hid" runat="server" />
<asp:HiddenField ID="Qinfo_Hid" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        #mymodal1 .modal-dialog{margin-top:7%;}
        #mymodal1 .modal-dialog iframe{height:600px!important;}
        #option_ul li{margin-top:3px;}
        #OAkeyword{ max-width:460px; height:36px; border:1px solid #ccc; display:inline-block;min-width:300px;padding-top:3px;}
        .tabinput{ border:none; padding-left:5px; height:30px; line-height:30px;}
        .radius{margin:2px;margin-top:20px;height:24px; line-height:24px; background:#eee; border:1px solid #ddd;border-radius:3px;padding:3px;float:none!important;}
        #errormes{z-index:9999;}
    </style>
    <script src="/dist/js/bootstrap-switch.js"></script>
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Exam_Paper.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/SelectCheckBox.js"></script>
    <script src="/JS/jquery.validate.min.js"></script>
    <script src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script src="/JS/ICMS/ZL_Exam_Question.js"></script>
    <script>
        $(function () {
            var option = $("#Optioninfo_Hid").val();
            if (option != "") {
                AnalyOption(JSON.parse(option));
            }
            InitQuestEvent();
            InitKeyWord($("#TagKey_T").val());
            //-------------题目类型
            var qtype = $("input[name=qtype_rad]:checked").val();
            $("input[name=qtype_rad]").click(function () {
                if (this.value == 10) { $("#bigtr").show(); $("#normaltr").hide(); }
                else { $("#bigtr").hide(); $("#normaltr").show(); }
            });
            if (qtype == 10) { $("#bigtr").show(); $("#normaltr").hide(); }
            if ("1" == "<%:IsSmall%>") { $("#bigrad").hide(); }
            //-------------
            ZL_Regex.B_Num(".int");
            $("#txtP_title").bind("keydown paste cut blur", function () {
                setTimeout(function () { $("#titleNum_sp").html("字数：<strong style='color:green;'>" + $("#txtP_title").val().length) + "</span>"; }, 50);
            })
            //$("form").validate({});
            if ($("input[name='qtype_rad']:checked").val() == "4") {
                SetQuestType();
            }
            $("input[name='qtype_rad']").change(function () {
                if ($(this).val() == "4")//完型填空
                {
                    SetQuestType();
                }
            });
        })
        function SetQuestType() {
            $("#questtype_a").removeAttr("data-toggle");
            $("#questtype_a").attr("href", "javascript:;");
            $("#questtype_a").attr("onclick", "ShowQuestType()");
        }
        //显示完型填空设置
        function ShowQuestType() {
            comdiag.maxbtn = false;
            comdiag.reload = true;
            ShowComDiag("QuestOption.aspx?id=<%=Mid %>","试题信息");
        }
        function GetContent() {
           return UE.getEditor("txtP_Content").getContent();
        }
        function GetQuesType(questdata) {
            $("#Optioninfo_Hid").val(questdata);
            CloseComDiag();
        }

    </script>
</asp:Content>
