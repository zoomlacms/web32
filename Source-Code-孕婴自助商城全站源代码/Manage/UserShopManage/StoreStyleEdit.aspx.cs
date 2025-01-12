﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ZoomLa.BLL;
using ZoomLa.Model;
using ZoomLa.Common;

public partial class manage_UserShopManage_StoreStyleEdit : CustomerPageAction
{
    #region 业务对象
    B_StoreStyleTable sstbll = new B_StoreStyleTable();
    B_Admin abll = new B_Admin();
    B_Model mbll = new B_Model();
    public int Sid { get { return DataConverter.CLng(Request.QueryString["id"]); } }
    #endregion

    #region 初始化
    protected void Page_Load(object sender, EventArgs e)
    {
        ZoomLa.Common.function.AccessRulo();
        abll.CheckMulitLogin();
        if (!abll.ChkPermissions("StoreStyleManage"))
        {
            function.WriteErrMsg("没有权限进行此项操作");
        }
        if (!IsPostBack)
        {
            if (Sid>0)
            {
                GetInit();                
            }
            //绑定商铺类型
            DataTable list = mbll.GetListStore();
            this.DropDownList1.DataSource = list;
            this.DropDownList1.DataTextField = "ModelName";
            this.DropDownList1.DataValueField = "ModelID";
            this.DropDownList1.DataBind();
            
        }
        Call.SetBreadCrumb(Master, "<li><a href='" + CustomerPageAction.customPath2 + "Main.aspx'>工作台</a></li><li><a href='" + customPath2 + "Shop/ProductManage.aspx'>商城管理</a></li><li><a href='StoreManage.aspx'>店铺管理</a></li><li><a href='StoreStyleManage.aspx'>商家店铺模板管理</a></li><li class='active'>修改模板</li>");
    }
    #endregion

    
    //初始化
    private void GetInit()
    {
        M_StoreStyleTable sst = sstbll.GetStyleByID(Sid);
        this.TxtModelName.Text = sst.StyleName;
        this.txt_Thumbnails.Text = sst.StylePic;
        this.ModeTemplate_hid.Value = sst.StyleUrl;
        this.RadioButtonList1.Text = sst.IsTrue.ToString();
        this.ListModeTemplate_hid.Value = sst.ListStyle;
        this.ContentModeTemplate_hid.Value = sst.ContentStyle;
        this.DropDownList1.SelectedValue = sst.ModelID.ToString();
    }

    protected void EBtnSubmit_Click(object sender, EventArgs e)
    {
        M_StoreStyleTable sst = new M_StoreStyleTable();
        sst.ID = Sid;
        sst.StyleName = this.TxtModelName.Text;
        sst.StylePic = this.txt_Thumbnails.Text;
        sst.StyleUrl = this.ModeTemplate_hid.Value;
        sst.ListStyle = this.ListModeTemplate_hid.Value;
        sst.ContentStyle = this.ContentModeTemplate_hid.Value;
        sst.ModelID = int.Parse(this.DropDownList1.Text);
        sst.IsTrue = int.Parse(this.RadioButtonList1.Text);
        if (Sid>0)
        {
            sstbll.UpdateStoreStyle(sst);

        }
        else
        {
            sstbll.InsertStoreStyle(sst);
        }
        Response.Redirect("StoreStyleManage.aspx");
    }
}
