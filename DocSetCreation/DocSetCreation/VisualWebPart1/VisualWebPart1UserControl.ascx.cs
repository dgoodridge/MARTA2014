using System;
using System.Collections;
using System.ComponentModel;
using System.Web.UI.WebControls.WebParts;
using Microsoft.SharePoint;
using Microsoft.Office.DocumentManagement.DocumentSets;
namespace DocumentSetApp.VisualWebPart1
{
    [ToolboxItemAttribute(false)]
    public partial class VisualWebPart1 : WebPart
    {
        // Uncomment the following SecurityPermission attribute only when doing Performance Profiling using
        // the Instrumentation method, and then remove the SecurityPermission attribute when the code is ready
        // for production. Because the SecurityPermission attribute bypasses the security check for callers of
        // your constructor, it's not recommended for production purposes.
         [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Assert, UnmanagedCode = true)]
        public VisualWebPart1() { }
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e); InitializeControl();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Focus();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text))
            {
                Label5.Text = "Please Enter Some Values"; Label5.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                try
                {
                    SPWeb web = SPContext.Current.Web; SPList list = web.Lists[TextBox1.Text];
                    if (list != null)
                    {
                        SPContentType contentType = web.ContentTypes["Document Set"];
                        if (contentType != null)
                        {
                            var hashTable = new Hashtable();
                            hashTable.Add("DocumentSet", "New Doc Setting"); hashTable.Add("CreatedBy", SPContext.Current.Web.CurrentUser.Name);
                            hashTable.Add("ModifiedBy", SPContext.Current.Web.CurrentUser.Name);
                            DocumentSet documentSet = DocumentSet.Create(list.RootFolder, TextBox2.Text, contentType.Id, hashTable, true);
                            documentSet.Item.ProgId = "SharePoint.DocumentSet"; documentSet.Item.Update();
                        }
                    }
                }
                catch (SPException ex)
                {
                    Label5.Text = ex.Message;
                }
                Label5.Text = TextBox2.Text + " Document Set Created Successfully";
                Label5.ForeColor = System.Drawing.Color.Green;
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
            }
        }
    }
}