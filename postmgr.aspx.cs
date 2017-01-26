﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;


public partial class postmgr : System.Web.UI.Page
{
	//载入
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
                  footerload();
        }
        if (Session["suadmin"] == null)
        {
            Response.Write("<script type='text/javascript'>alert('登录超时！');window.location.href='Default.aspx';</script>");
        }

        else
        {
            this.Label1.Text = "欢迎管理员：" + Session["issuper"];

            
        }    
    }
	protected void btnLogout_click(object sender, ImageClickEventArgs e)
    {
      Session["issuper"] = null;
      Session["suadmin"] = null;
      Response.Write("<script type='text/javascript'>window.location.href='Default.aspx';</script>");
             
    }
    protected void btnGo_Click(object sender, EventArgs e)
    {

    }
    protected void btnBack_click(object sender, ImageClickEventArgs e)
    {
        Response.Write("<script type='text/javascript'>window.location.href='adminweb.aspx';</script>");
    }
    protected void btnPost_Click(object sender, EventArgs e)
    {
        Response.Write("<script type='text/javascript'>window.location.href='newpost.aspx';</script>");
    }
      protected void gvpost_RowDele(object sender, GridViewDeleteEventArgs e)
    {
        int poid = Convert.ToInt32(gvpost.DataKeys[e.RowIndex].Value);
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection conur = new SqlConnection(connectionString);
        string delur = "delete from Article where artid='" + @poid + "'";
        SqlCommand cmdu = new SqlCommand(delur, conur);
        conur.Open();
        cmdu.ExecuteNonQuery();//返回受影响的行数
        conur.Close();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('删除成功！');</script>");
        }
    protected void footerload()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string st = "select * from Class where classid=7";
        cnn.Open();
        SqlCommand cmd = new SqlCommand(st, cnn);
        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.Read())
        {
            this.Label3.Text = Server.HtmlDecode(rdr["content"].ToString());
            cnn.Close();
        }
    }
    //缩短
    public string SubStr(object caption, int nLeng)
    {
        string sString = caption.ToString().Trim();
        if (sString.Length <= nLeng)
        {
            return sString;
        }
        else
        {
            string sNewStr = sString.Substring(0, nLeng);
            sNewStr = sNewStr + "..."; return sNewStr;
        }
    }
}

