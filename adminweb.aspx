<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminweb.aspx.cs" Inherits="adminweb"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="adminsty.css" />
<title>后台管理</title>
 </head>   
<body>
<script language="JavaScript" type="text/javascript">
var lang = navigator.language || navigator.userLanguage;
if(lang.substr(0, 3) == "zh-"){
document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>"); }
</script>
<form id="form1" runat="server">
  <table width="1038" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="9" align="left" valign="middle" bgcolor="#ff7d23" class="style1">丽军数码</td>
    </tr>
  <tr>
    <td height="15" colspan="17" bgcolor="#585858"></td>
  <tr>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="Default.aspx" target="_blank"><h2>网站首页</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#ff7d23"><a href="show.aspx" target="_blank"><h2>配件展示</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="error.aspx" target="_blank"><h2>常见故障</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#ff7d23"><a href="fix.aspx" target="_blank"><h2>报修流程</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="bbs.aspx" target="_blank"><h2>维修论坛</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="shop.aspx" target="_blank"><h2>网店介绍</h2></a></td>
   <td  align="center" valign="middle" bgcolor="#ff7d23"> <a href="staff.aspx" target="_blank"><h2>人才招聘</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="messages.aspx" target="_blank"><h2>网上留言</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#ff7d23"><a href="connect.aspx" target="_blank"><h2>联系我们</h2></a></td>
  </tr>  <tr>
  <td height="15" colspan="17" align="center" bgcolor="#FFFFFF">
        <p><br />
        </p>
       
        <table width="90%" border="0" cellspacing="0" cellpadding="12">
          <tr>
            <td width="157" align="left"><h1>后台管理</h1>
             </td>
            <td width="324" align="right" nowrap="nowrap">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
            <td width="381" align="right">
                &nbsp;<asp:ImageButton ID="btnUser" runat="server" ImageUrl="~/imgs/user.gif" 
                    Height="32" Width="32" title="用户管理" OnClick="btnUser_Click"/>
                     &nbsp;<asp:ImageButton ID="btnSet" runat="server" ImageUrl="~/imgs/seting.gif" 
                    Height="32" Width="32" title="板块更新" OnClick="btnSet_Click"/>
                     &nbsp;<asp:ImageButton ID="btnArt" runat="server" ImageUrl="~/imgs/artcle.gif" 
                    Height="32" Width="32" title="文章管理" OnClick="btnArt_Click"/>
                     &nbsp;<asp:ImageButton ID="btnAub" runat="server" ImageUrl="~/imgs/photo.gif" 
                    Height="32" Width="32" title="相册管理" OnClick="btnAub_Click"/>
                     &nbsp;<asp:ImageButton ID="btnCont" runat="server" ImageUrl="~/imgs/content.gif" 
                    Height="32" Width="32" title="消息管理" OnClick="btnCont_Click"/>
                &nbsp;<asp:ImageButton ID="btnChgpwd" runat="server" ImageUrl="~/imgs/chgpwd.gif" Height="32" Width="32" title="修改密码" OnClick="btnChgpwd_click"/>
                &nbsp;<asp:ImageButton ID="btnSwtich" runat="server" ImageUrl="~/imgs/switch.gif" Height="32" Width="32" title="切换用户" OnClick="btnSwitch_click"/>
                &nbsp;<asp:ImageButton ID="btnLogout" runat="server" ImageUrl="~/imgs/logout.gif" Height="32" Width="32" title="登出" OnClick="btnLogout_click"/></td>
          </tr>
          <tr>
            <td colspan="3" align="center" valign="middle">
            <!--修改密码-->
            <div id="divchgpwd" class="divcss" runat="server" align="center" visible="False">
              <table width="100%" border="0" cellspacing="0" cellpadding="12">
                <tr>
                  <td width="49%" align="right"><img src="imgs/chgpwd.gif" width="32" height="32" /></td>
                  <td width="25%" align="left"><strong>密码修改：</strong></td>
                  <td width="26%" align="right"><asp:ImageButton ID="Cls" runat="server" ImageUrl="~/imgs/close.gif" title="关闭" OnClick="Cls_click"/></td>
                </tr>
                <tr>
                  <td colspan="3"><p>原密码：
                      <asp:TextBox ID="oldpwd" 
                          class="txt3" runat="server" BackColor="Silver" 
                          MaxLength="20" TextMode="Password"></asp:TextBox>
                  </p>
                  <p>新密码：<asp:TextBox ID="newpwd" class="txt3" 
                            runat="server" BackColor="Silver" 
                            TextMode="Password" MaxLength="20" ></asp:TextBox></p>
                  <p>新密码确认：<asp:TextBox ID="newconf" class="txt3" runat="server" 
                            BackColor="Silver" MaxLength="20"  TextMode="Password" 
                            ></asp:TextBox></p>
                                            <p align="center"><div id="aptips" runat="server">
                            
                        </div>
                        
                        
                                          </td>
                </tr>
                <tr>
                  <td colspan="3"><asp:ImageButton ID="Chgpwd" runat="server" ImageUrl="~/imgs/okbtn.gif" OnClick="Chgpwd_click"/>
                      &nbsp;<asp:ImageButton ID="btnReset" runat="server" ImageUrl="~/imgs/clearbtn.gif" OnClick="btnReset_click"/></td>
                </tr>
              </table>
            </div>
</td>
          </tr>
          <tr>
            <td colspan="3" align="center" valign="middle">
            <!--管理用户-->
             <div id="divusers" class="divcss" runat="server" align="center" visible="False"><table width="100%" border="0" cellspacing="0" cellpadding="12">
                <tr>
                  <td width="49%" align="right"><img src="imgs/user.gif" width="32" height="32" /></td>
                  <td width="25%" align="left"><strong>用户管理：</strong></td>
                  <td align="right"><asp:ImageButton ID="Cls2" runat="server" ImageUrl="~/imgs/close.gif" title="关闭" OnClick="Cls2_click"/></td>
                </tr>
                <tr>
                  <td colspan="4" align="center">
                      <asp:GridView ID="gvuser" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="id" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                                BorderWidth="1px" CellPadding="2" ForeColor="Black" 
                            class="txt3" Height="84px" Width="700px" onrowdeleting="gvuser_RowDele" 
                          onrowediting="gvuser_RowEdt" onrowupdating="gvuser_RowUpd" HorizontalAlign="Center" 
                          >
                            <Columns>
                                <asp:BoundField DataField="rowsid" HeaderText="序号" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Left" Width="6%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="true" Visible="False">
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="adname" HeaderText="用户名" ReadOnly="true"> 
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="超级用户">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("suadmin") %>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("suadmin") %>' />
                                    </EditItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="code" HeaderText="验证码" ReadOnly="True" >
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:CommandField ButtonType="Button" EditText="管理权限" ShowEditButton="True" 
                                    UpdateText="保存" ShowCancelButton="False" >
                                    
                                    <ControlStyle BackColor="#FF7D23" BorderColor="#FF7D23" BorderStyle="Solid" 
                                        Font-Bold="True" Font-Names="宋体" Font-Size="Medium" ForeColor="White" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                                    
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="删除" 
                                            OnClientClick="javascript:return confirm('您确定删除该用户吗？');" />
                                    </ItemTemplate>
                                    <ControlStyle BackColor="#FF7D23" BorderColor="#FF7D23" BorderStyle="Solid" 
                                        Font-Bold="True" Font-Names="宋体" Font-Size="Medium" ForeColor="White" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                                               
                            </Columns>
                                <FooterStyle BackColor="Tan" />
                                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                    HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                      </asp:GridView>
                        
                        <br /></td>
                </tr>
                <tr>
                  <td colspan="3">
                  <asp:Button ID="btnCeuser" runat="server" class="txt3" Text="创建新用户" 
                    BackColor="#FF7D23" BorderStyle="Solid" Font-Bold="True" 
                    ForeColor="White" BorderColor="#FF7D23" OnClick="btnCeuser_Click" /></td>
                </tr>
              </table>
              </div>          
               
            </td>
          </tr>
        </table>

          <p>
            <br />
            <br />
            

        </p>
 <br />

            
  </tr>

  <tr>
    <td colspan="9" align="center" valign="middle" bgcolor="#FFFFFF" cellpadding="0">
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<p><br />
             <br />
            <br />
             <br /></p></td>
  </tr>
  <tr>
    <td height="40" colspan="9" bgcolor="#A1A1A1"  class="footer"><p>&nbsp;</p>
      <p>&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text=""></asp:Label></p></td></tr></table>          
    </form>
</body>
</html>
