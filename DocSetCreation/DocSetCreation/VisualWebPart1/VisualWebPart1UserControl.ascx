<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@  Control Language="C#" AutoEventWireup="true" CodeBehind="VisualWebPart1.ascx.cs"
    Inherits="DocumentSetApp.VisualWebPart1.VisualWebPart1" %>
<center>
    <div>
        <table style="text-align: center">
            <tr>
                <td colspan="2">
                    <asp:label id="Label1" runat="server" text="DocumentSet  - SharePoint 2010 Programatically using VS 2012"
                        font-bold="true" font-size="Large" font-names="Verdana" forecolor="Maroon"></asp:label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:label id="Label2" runat="server" text="Please Enter List Name" font-size="Large"
                        font-names="Verdana" font-italic="true"></asp:label>
                </td>
                <td>
                    <asp:textbox id="TextBox1" runat="server"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:label id="Label3" runat="server" text="Please Enter DocumentSet Name" font-size="Large"
                        font-names="Verdana" font-italic="true"></asp:label>
                </td>
                <td>
                    <asp:textbox id="TextBox2" runat="server"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:button id="Button1" runat="server" text="Create Document Set" font-names="Verdana"
                        width="174px" backcolor="Orange" font-bold="True" onclick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:label id="Label5" runat="server" font-bold="true" font-names="Verdana"></asp:label>
                </td>
            </tr>
        </table>
    </div>
</center>