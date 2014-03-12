using System;
using System.Web.UI;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using Microsoft.SharePoint.WebPartPages;
using System.Web.UI.WebControls;
using Microsoft.Office.DocumentManagement.DocumentSets;

namespace FraudHotlineLog.Layouts.FraudHotlineLog
{
    public partial class EditCallLog : WebPartPage
    {
        protected Panel pnlInvestigation;
        protected CheckBox chkLaunchInvestigation;

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            SPContext.Current.FormContext.OnSaveHandler += new EventHandler(mySaveHandler);
        }

        protected void mySaveHandler(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                bool investigate = chkLaunchInvestigation.Checked;

                if (investigate)
                {
                    LaunchInvestigation();
                    //Set hidden field to Investigation Launched - done
                    SPListItem callLogItem = SPContext.Current.ListItem;
                    callLogItem["InvestigationStarted"] = true; 
                    callLogItem.Update();
                   
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SPListItem callLogItem = SPContext.Current.ListItem;
                bool investigationStarted = Convert.ToBoolean(callLogItem["InvestigationStarted"]);
                if (investigationStarted == true)
                {
                    pnlInvestigation.Visible = false;
                }
                else
                {
                    pnlInvestigation.Visible = true;
                }
            }
        }

        private void LaunchInvestigation()
        {
            //Get current ListItem
            SPListItem callLogItem = SPContext.Current.ListItem;
            string title = Convert.ToString(callLogItem["Title"]);
            DateTime startDate = Convert.ToDateTime(callLogItem["StartDate"]);

            /// Find the library where Document Set will be created.

            SPWeb currentWeb = SPContext.Current.Web;
            SPDocumentLibrary list = (SPDocumentLibrary)currentWeb.Lists["Investigations"];


            string docSetName = "InvestigationDocumentSet";
            SPContentType newDocumentSetContentType = null;
            DocumentSetTemplate newDocumentSetTemplate = null;


            if (currentWeb.Site.RootWeb.ContentTypes[docSetName] == null)
            {
                // create the new document set content Type
                newDocumentSetContentType = currentWeb.Site.RootWeb.ContentTypes.Add(new SPContentType(currentWeb.Site.RootWeb.ContentTypes["Document Set"], currentWeb.Site.RootWeb.ContentTypes, docSetName));

                // get a document set template for the new document set
                newDocumentSetTemplate = DocumentSetTemplate.GetDocumentSetTemplate(newDocumentSetContentType);

                //add allowable content types
                newDocumentSetTemplate.AllowedContentTypes.Remove(currentWeb.Site.RootWeb.ContentTypes["Document"].Id);


                newDocumentSetTemplate.DefaultDocuments.AddSetName = false;

                newDocumentSetTemplate.Update(true);
                newDocumentSetContentType.Update();

                currentWeb.Site.RootWeb.Update();
            }
            else
            {
                newDocumentSetContentType = currentWeb.Site.RootWeb.ContentTypes["InvestigationDocumentSet"];
            }

            System.Collections.Hashtable properties = new System.Collections.Hashtable();
            properties.Add("DocumentSetDescription", string.Format("Document Set for {0}", title)); //Internal Name
            properties.Add("_Title", title); //Internal Name
            properties.Add("StartDate", startDate);

            Microsoft.Office.DocumentManagement.DocumentSets.DocumentSet documentSet = Microsoft.Office.DocumentManagement.DocumentSets.DocumentSet.Create(list.RootFolder,
                title,
                list.ContentTypes.BestMatch(newDocumentSetContentType.Id),
                properties,
                true);

            //Logic for getting Default Documents
            SPDocumentLibrary defaultDocsLibrary = (SPDocumentLibrary)currentWeb.Lists["DefaultDocuments"];
            SPListItemCollection lic = defaultDocsLibrary.Items;
            foreach (SPListItem defaultDocItem in lic)
            {
                SPFile file = defaultDocItem.File;
                byte[] defaultDocumentBytes = file.OpenBinary();
                //Add the default document
                SPListItem itemForFile = file.Item;
                SPFile addedFile = documentSet.Folder.Files.Add(file.Name,
                    defaultDocumentBytes,
                    true);
            }

            // Create link in call Log list //Not working
            callLogItem["InvestigationDocuments"] = string.Format("{0}, {1}", documentSet.WelcomePageUrl, "Documents");
            callLogItem.Update();

        }

    }
}
