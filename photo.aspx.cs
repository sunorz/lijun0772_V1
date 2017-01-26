using System;
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
using System.IO;
using System.Drawing;
public partial class photo : System.Web.UI.Page
{
     protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["suadmin"] == null)
        {
            Response.Write("<script type='text/javascript'>alert('登录超时！');window.location.href='Default.aspx';</script>");
        }

        else
        {
            this.Label1.Text = "欢迎管理员：" + Session["issuper"];
            footerload();
            showname();             
            bind2();
            string poid = Request.QueryString["id"];
            if (poid != "5")//初始值
            {
                ddlclass.SelectedValue = poid;
            }
            else
            {
                ddlclass.SelectedValue = ddlclass.SelectedValue;
            }
        }
    }

    protected void btnBaphoto_click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("photomgr.aspx");
    }
    protected void btnBack_click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("adminweb.aspx");
    }
    protected void btnLogout_click(object sender, ImageClickEventArgs e)
    {
        Session["issuper"] = null;
        Session["suadmin"] = null;
        Response.Write("<script type='text/javascript'>window.location.href='Default.aspx';</script>");
    }
    protected void btnnew_Click(object sender, EventArgs e)
    {
        string alid = ddlclass.SelectedValue;
        string imgname = tbname.Text.Trim();
        string imgupder = tbmkr.Text.Trim();
        if (imgname == "")
        {
            imgname="未命名";
        }
        if (imgupder == "")
        {
            imgupder="丽军数码";
        }        
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string path = Server.MapPath("~/imgs/bbs");
        string filepath = fuimg.PostedFile.FileName;
        string Extend = filepath.Substring(filepath.LastIndexOf(".") + 1);//获取格式名
        DateTime dt= TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "China Standard Time");//转东八区
        string name = "album" + alid.ToString() + "_" +dt.ToString("yyyyMMddHHmmss")+ "." + Extend;//重命名
        if (Extend == "jpg" || Extend == "gif" || Extend == "bmp" || Extend == "png" || Extend == "JPG" || Extend == "GIF" || Extend == "PNG" || Extend == "BMP")
        {
            fuimg.SaveAs(path + "\\" + name);
            string filepath1 = "~/imgs/bbs/" + name;
            string filepath2 = "~/imgs/bbs/smaller/" + name;
            cnn.Open();
            string sql = "insert into Photo(poname,potor,pourl,psmurl,potime,alid) values('" + @imgname + "','" + @imgupder + "','" + @filepath1 + "','" + @filepath2 + "','" + @dt + "','" + @alid + "')";
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.ExecuteNonQuery();
            ResizeImage(100, name);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('上传成功！');window.location.href=window.location.href; </script>");
            aptips.InnerText = "";
            cnn.Close();
        }
        else
        {
            aptips.InnerText = "图片格式不正确！";
        }
    }
    private void ResizeImage(int height, string fileName)
    {
        string webFilePath = Server.MapPath("imgs/bbs/" + fileName);
        string webFilePath_s = Server.MapPath("imgs/bbs/smaller/" + fileName);
        System.Drawing.Image image = System.Drawing.Image.FromFile(webFilePath);
        System.Drawing.Image img = image.GetThumbnailImage(image.Width * height / image.Height, height, null, IntPtr.Zero);
        img.Save(webFilePath_s);
        img.Dispose();
        image.Dispose();
    } 
    protected void gvphoto_RowDele(object sender, GridViewDeleteEventArgs e)
    {
        int poid = Convert.ToInt32(gvphoto.DataKeys[e.RowIndex].Value);
        delpic(poid);     
        Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('删除成功！');</script>");
      }
    //删除图片
    protected void delpic(int poid)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection conur = new SqlConnection(connectionString);
        string delur = "select * from Photo where poid='" + @poid + "'";
        SqlCommand cmdu = new SqlCommand(delur, conur);
        conur.Open();
        SqlDataReader reader = cmdu.ExecuteReader();
        if (reader.Read())
        {
            string filepath1 = reader["pourl"].ToString();
            string filepath2 = reader["psmurl"].ToString();
            File.Delete(Server.MapPath(filepath1));
            File.Delete(Server.MapPath(filepath2));
        }
              conur.Close();
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

    protected void bind2()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string st = "select alname,alid FROM Album where alid<>5";
        SqlDataAdapter da = new SqlDataAdapter(st, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddlclass.DataSource = ds;
        ddlclass.DataBind();
        ds.Clear();
        cnn.Close();
       
    }

    protected void showname()//用于显示相册名和处理错误id
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string alid = Request.QueryString["id"];
        string st="select * from Photo right join Album on Photo.alid=Album.alid where Album.alid='" + @alid + "'";//以Album为基表的右链接
        cnn.Open();
        SqlCommand cmd = new SqlCommand(st, cnn);
        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.Read())
        {
            if (rdr["alname"].ToString() == "（未分类）")
            {
                Label2.Text = "未分类的照片";
            }
            else
            {

                Label2.Text = "来自相册《" + rdr["alname"].ToString() + "》中的照片";
            }        
        }
        else//如果id未输入或者错误
        {
            Response.Redirect("photomgr.aspx");
        }
        cnn.Close();
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