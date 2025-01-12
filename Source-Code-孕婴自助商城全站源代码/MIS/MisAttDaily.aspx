﻿<%@ page language="C#" autoeventwireup="true" inherits="MIS_MisAttDaily, App_Web_4lf2opvy" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JS日历</title>
<style type="text/css">
*{ margin:0; padding:0;}
.red{ color:red;}
.date{ cursor:pointer;}
.today{ background:#F90; font-weight:bold;cursor:pointer;}
.arrive{ background:#ffd800; font-weight:bold;cursor:pointer; text-align:left; font-size:12px;}
#calendar{ width:680px; 
margin:auto;}
#date{ text-align:center; border:1px #ccc solid; border-bottom:0;} 	
#date a{ display:inline-block; width:18px; height:20px; background-position:center -20px; vertical-align:middle; cursor:pointer;}
#date a:hover{text-decoration:none;}
#date #selectDate{ width:120px;display:inline-block;}
#preYear{ background:url(); font-size:16px;}
#preMonth{ background:url();font-size:16px;}
#nextMonth{ background:url();font-size:16px;}
#nextYear{ background:url();font-size:16px;}
#calTable{ width:100%; text-align:center; border-collapse:collapse;height: 377px;}
#calTable th,#calTable td{ width:96px;height:60px; border:1px #ccc solid; text-align:center;}
#calTable tbody{ font-family:Georgia, "Times New Roman", Times, serif;}
</style>
</head>
<body>
<div id="calendar">
    <div style="text-align:center; margin-top:6px; margin-bottom:6px;"><span style="font-size:16px; font-weight:bold; color:#808080;">我的考勤记录</span></div>
	<div id="date">
    	<a id="preMonth" title="上一年"> < </a>
        <a id="preYear" title="上一月"> < </a>
        <span id="selectDate">
            <select id="selectYear">	
            </select>
            <select id="selectMonth">
                <option value="1">1月</option>
                <option value="2">2月</option>
                <option value="3">3月</option>
                <option value="4">4月</option>
                <option value="5">5月</option>
                <option value="6">6月</option>
                <option value="7">7月</option>
                <option value="8">8月</option>
                <option value="9">9月</option>
                <option value="10">10月</option>
                <option value="11">11月</option>
                <option value="12">12月</option>
            </select>
        </span>
        <a id="nextYear" title="下一月"> > </a>
        <a id="nextMonth" title="下一年"> > </a>
    </div>
    <table id="calTable">
    	<thead>
            <tr>
                <th class="red">日</th>
                <th>一</th>
                <th>二</th>
                <th>三</th>
                <th>四</th>
                <th>五</th>
                <th class="red">六</th>
            </tr>
        </thead>
        <tbody>
        	<tr>
            	<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
            	<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
            	<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
            	<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
            	<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
            </tr>
            <tr>
            	<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
            </tr>
        </tbody>
    </table>
    <div id="hidvalue"></div>
    <div id="hidmon"></div>
    <div id="hidyear"></div>
</div>
<script type="text/javascript">
    var doc = document;
    function Calendar() {
        this.init.apply(this, arguments);
    }
    Calendar.prototype = {
        init: function (tableId, dateId, selectY, selectM, startYear, endYear) {
            var table = doc.getElementById(tableId);
            var dateObj = doc.getElementById(dateId);
            var selectY = doc.getElementById(selectY);
            var selectM = doc.getElementById(selectM);
            this._setSelectYear(selectY,startYear,endYear);
            this._setTodayDate(table, selectY, selectM);
            this._selectChange(table, selectY, selectM);
            this._clickBtn(table, dateObj, selectY, selectM, startYear, endYear);
        },
        //设置年份
        _setSelectYear: function (selectY, startYear, endYear) {
            var html = "";
            var date = new Date();
            if (!endYear) {
                var endYear = date.getFullYear();
            } else {
                var endYear = endYear;
            }
            for (var i = startYear; i <= endYear; i++) {
                var _option = document.createElement('option');
                selectY.appendChild(_option);
                _option.value = i;
                _option.innerHTML = i;
            }
        },
        //设置当天的时间
        _setTodayDate: function (table, selectY, selectM) {
            var _this = this;
            var date = new Date();
            var year = date.getFullYear(), month = date.getMonth(), _date = date.getDate(), day = date.getDay();
            var n = parseInt(_date / 7);
            var l = n % 7;

            if (l >= day) {
                var todayTd = day + 7 * l;
            } else {
                var todayTd = day + 7 * (l + 1);
            }
            var startTd = todayTd - _date + 1;
            var monthDays = this._getMonthDays(year, month);
            var td = table.getElementsByTagName('td');
            this._setSelectValue(selectY, year);
            this._setSelectValue(selectM, month + 1);
            var cou;
            document.getElementById("hidvalue").innerHTML = "<%=Gethid()%>";
            document.getElementById("hidmon").innerHTML = "<%=Gethidmonth()%>";
            document.getElementById("hidyear").innerHTML = "<%=Gethidyear()%>";
            for (i = startTd, len = td.length; i < len; i++) {
                var _td = td[i];
                var j = i - startTd + 1
                _td.innerHTML = j;
                _td.className = "date";
                cou = "<%=Getday().Length%>";
                var vd;
                var vdm;
                if (j == _date) {
                    _td.className = "today";
                    for (var s = 0; s < cou; s++) {
                        vd = document.getElementById("hidday" + s).value;
                        vdm = document.getElementById("hidmonth" + s).value;
                        vdy = document.getElementById("hidyear" + s).value;
                        if (j == vd && month + 1 == vdm&&year == vdy) {
                            _td.className = "today";
                            _td.innerHTML ="<span style='color:green;'>今天已签到</span>";
                        }
                        else {
                            _td.innerHTML = "<span style='color:red;'>今天未签到</span>";
                        }
                    }
                }else if (cou > 0) {
                    for (var s = 0; s < cou; s++) {
                        vd = document.getElementById("hidday" + s).value;
                        vdm = document.getElementById("hidmonth" + s).value;
                        vdy = document.getElementById("hidyear" + s).value;
                        if (j == vd && month + 1 == vdm&&year == vdy) {
                            _td.className = "arrive";
                            _td.innerHTML = j + "<span style='color:green'> 已签到</span>";
                        }
                        else {
                            _this._mouseOn(_td);
                        }
                    }
                }
                else {
                    _this._mouseOn(_td);
                }
                if (j >= monthDays) {
                    break;
                }
            }
        },
        //鼠标移入移出日期
        _mouseOn: function (obj) {
            obj.onmouseover = function () {
                if (this.innerHTML) {
                    this.style.background = "#bbb";
                }
            }
            obj.onmouseout = function () {
                this.style.background = "";
            }
        },
        //下拉菜单选择日期
        _selectChange: function (table, selectY, selectM) {
            var _this = this;
            selectY.onchange = function () {
                var year = _this._getSelectValue(selectY);
                var month = _this._getSelectValue(selectM) - 1;
                _this._showCalendar(table, year, month);
            }
            selectM.onchange = function () {
                var year = _this._getSelectValue(selectY);
                var month = _this._getSelectValue(selectM) - 1;;
                _this._showCalendar(table, year, month);
            }
        },
        //获取下拉菜单的默认值
        _getSelectValue: function (selectObj) {
            var selectList = selectObj.getElementsByTagName('option');
            for (var i = 0, len = selectList.length; i < len; i++) {
                var _option = selectList[i];
                if (_option.selected) {
                    return parseInt(_option.value);
                }
            }
        },
        //设置下拉菜单默认值
        _setSelectValue: function (selectObj, value) {
            var selectList = selectObj.getElementsByTagName('option');
            for (var i = 0, len = selectList.length; i < len; i++) {
                var _option = selectList[i];
                if (parseInt(_option.value) == value) {
                    _option.selected = true;
                    break;
                }
            }
        },
        _clickBtn: function (table, dateObj, selectY, selectM, startYear, endYear) {
            var _this = this, year = 0;
            var btn = dateObj.getElementsByTagName('a');
            btn[0].onclick = function () {
                year = _this._getSelectValue(selectY) - 1;
                var month = _this._getSelectValue(selectM);
                if (!isYearOver(year)) {
                    return;
                }
                _this._setSelectValue(selectY, year);
                _this._setSelectValue(selectM, month);
                _this._showCalendar(table, year, month - 1);
            }
            btn[1].onclick = function () {
                year = _this._getSelectValue(selectY);
                var month = _this._getSelectValue(selectM) - 1;
                if (month <= 0) {
                    month = 12;
                    year--;
                }
                if (!isYearOver(year)) {
                    return;
                }
                _this._setSelectValue(selectM, month);
                _this._setSelectValue(selectY, year);
                _this._showCalendar(table, year, month - 1);
            }
            btn[2].onclick = function () {
                year = _this._getSelectValue(selectY);
                var month = _this._getSelectValue(selectM) + 1;
                if (month > 12) {
                    month = 1;
                    year++;
                }
                if (!isYearOver(year)) {
                    return;
                }
                _this._setSelectValue(selectM, month);
                _this._setSelectValue(selectY, year);
                _this._showCalendar(table,year, month - 1);
            }
            btn[3].onclick = function () {
                year = _this._getSelectValue(selectY) + 1;
                var month = _this._getSelectValue(selectM);
                if (!isYearOver(year)) {
                    return;
                }
                _this._setSelectValue(selectM, month);
                _this._setSelectValue(selectY, year);
                _this._showCalendar(table, year, month - 1);
            }
            function isYearOver(year) {
                var date = new Date();
                var _endYear = endYear ? endYear : date.getFullYear();
                if (year > _endYear || year < startYear) {
                    alert("超出日期范围");
                    return false;
                } else {
                    return true;
                }
            }
        },
        //显示日历
        _showCalendar: function (table, year, month) {
            var date = new Date();
            var _year = date.getFullYear();
            var _month = date.getMonth();
            var _date = date.getDate();
            date.setYear(year);
            date.setMonth(month);
            date.setDate(1);
            var day = date.getDay();
            var _this = this;
            var monthDays = this._getMonthDays(year, month);
            var td = table.getElementsByTagName('td');
            for (var k = 0; k < td.length; k++) {
                td[k].innerHTML = "";
                td[k].className = "";
            }
            var cou;
            document.getElementById("hidvalue").innerHTML = "<%=Gethid()%>";
            document.getElementById("hidmon").innerHTML = "<%=Gethidmonth()%>";
            document.getElementById("hidyear").innerHTML = "<%=Gethidyear()%>";
            for (var i = day,len = td.length; i < len; i++) {
                var _td = td[i];
                var j = i - day + 1;
                cou = "<%=Getday().Length%>";
                var vd;
                var vdm;
                _td.innerHTML = j;
                _td.className = "date";
                if (_year == year && _month == month && _date == j) {
                    _td.className = "today";
                    for (var s = 0; s < cou; s++) {
                        vd = document.getElementById("hidday" + s).value;
                        vdm = document.getElementById("hidmonth" + s).value;
                        vdy = document.getElementById("hidyear" + s).value;
                        if (j == vd && month + 1 == vdm&&year == vdy) {
                            _td.className = "today";
                            _td.innerHTML = "<span style='color:green;'>今天已签到</span>";
                        }
                        else {
                            _td.innerHTML = "<span style='color:red;'>今天未签到</span>";
                        }
                    }
                } else if (cou > 0) {
                    for (var s = 0; s < cou; s++) {
                        vd = document.getElementById("hidday" + s).value;
                        vdm = document.getElementById("hidmonth" + s).value;
                        vdy = document.getElementById("hidyear" + s).value;
                        if (j == vd && month + 1 == vdm&&year==vdy) {
                            _td.className = "arrive";
                            _td.innerHTML = j + "<span style='color:green;'> 已签到</span>";
                        }else {
                            _this._mouseOn(_td);
                        }
                    }
                } else {
                    _this._mouseOn(_td);
                }
                if (j >= monthDays) {
                    break;
                }
            }
        },
        //返回某个月的天数
        _getMonthDays: function (year, month) {
            var monthAry = [31,28,31,30,31,30,31,31,30,31,30,31];
            if (year % 400 == 0) {
                monthAry[1] = 29;
            } else {
                if (year % 4 == 0 && year % 100 != 0) {
                    monthAry[1] = 29;
                }
            }
            return monthAry[month];
        }
    }
    new Calendar("calTable", "date","selectYear", "selectMonth",2000,2020);
</script>
</body>
</html>
