using System;
using System.Web.UI;
using Microsoft.SharePoint;
using Microsoft.SharePoint.WebControls;
using Microsoft.SharePoint.WebPartPages;
using System.Web.UI.WebControls;
using Microsoft.Office.DocumentManagement.DocumentSets;
using System.Collections;

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

            //string documentSetName = 
            //SPContentType docSetCT = list.ContentTypes["InvestigationDocumentSet"];
            //System.Collections.Hashtable properties = new System.Collections.Hashtable();
            //properties.Add("DocumentSetDescription", string.Format("Document Set for {0}", title)); //Internal Name
            //properties.Add("_Title", title); //Internal Name
            //properties.Add("StartDate", startDate);

            //SPFolder parentFolder = list.RootFolder;
            //DocumentSet docSet = DocumentSet.Create(parentFolder, documentSetName, docSetCT.Id, properties, true);
            
            

            //Kawal's Workaround
            string docSetName = "Document Set";
            SPContentType newDocumentSetContentType = null;
            DocumentSetTemplate newDocumentSetTemplate = null;

            //if (currentWeb.Site.RootWeb.ContentTypes[docSetName] == null)
            //{
            //    // create the new document set content Type
            //    newDocumentSetContentType = currentWeb.Site.RootWeb.ContentTypes.Add(new SPContentType(currentWeb.Site.RootWeb.ContentTypes["Document Set"], currentWeb.Site.RootWeb.ContentTypes, docSetName));

            //    // get a document set template for the new document set
            //    newDocumentSetTemplate = DocumentSetTemplate.GetDocumentSetTemplate(newDocumentSetContentType);

            //    //add allowable content types
            //    newDocumentSetTemplate.AllowedContentTypes.Remove(currentWeb.Site.RootWeb.ContentTypes["Document"].Id);


            //    newDocumentSetTemplate.DefaultDocuments.AddSetName = false;

            //    newDocumentSetTemplate.Update(true);
            //    newDocumentSetContentType.Update();

            //    currentWeb.Site.RootWeb.Update();
            //}
            //else
            //{
            //    newDocumentSetContentType = currentWeb.Site.RootWeb.ContentTypes[docSetName];
            //}
            

            //InvestigationDocSet is a content type created through SharePoint UI
            //InvestigationDocumentSet is our programatically created content type
            //SPContentType InvestigationDocumentSetContentType = currentWeb.Site.RootWeb.ContentTypes["InvestigationDocSet"];

            //Hashtable properties = new System.Collections.Hashtable();
            //properties.Add("DocumentSetDescription", string.Format("Document Set for {0}", title)); //Internal Name
            //properties.Add("_Title", title); //Internal Name
            ////properties.Add("StartDate", startDate);

            //Microsoft.Office.DocumentManagement.DocumentSets.DocumentSet documentSet = Microsoft.Office.DocumentManagement.DocumentSets.DocumentSet.Create(
            //    list.RootFolder,
            //    title,
            //    list.ContentTypes[docSetName].Id,
            //    properties,
            //    true);


            //if (applicationNumber == null) throw new ArgumentNullException("applicationNumber");
            if (list == null) throw new ArgumentNullException("list");
            if (list.ContentTypes[docSetName] == null) throw new ArgumentNullException("Content type not found on library");

            if (list.ContentTypes[docSetName] != null)
            {
                try
                {
                    //You can use a hashtable to populate properties of the document set
                    var docsetProperties = new Hashtable { { "DocumentDesciption", string.Format("Document Set for {0}", title) }, { "Name", title } };
                    var documentSetContentType = list.ContentTypes[docSetName];
                    DocumentSet documentSet = DocumentSet.Create(
                        list.RootFolder,
                        title,
                        documentSetContentType.Id,
                        docsetProperties,
                        true);
                    System.Threading.Thread.Sleep(1000 * 5);
                    documentSet.Item.ProgId = "SharePoint.DocumentSet";
                    documentSet.Item.Update();
                }
                catch (Exception ex)
                {
                    throw new ArgumentNullException("Something went wrong");
                }
            }
            //int listItemID = documentSet.Item.ID;
            //SPListItem item = list.GetItemById(listItemID);
            //item["HTML_x0020_File_x0020_Type"] = "SharePoint.DocumentSet";
            //item.ProgId = "SharePoint.DocumentSet";
            //item.Update();

          
            //Logic for getting Default Documents
            //Commented this out while testing InvestigationDocSet because it should create it's own default documents
            //SPDocumentLibrary defaultDocsLibrary = (SPDocumentLibrary)currentWeb.Lists["DefaultDocuments"];
            //SPListItemCollection lic = defaultDocsLibrary.Items;
            //foreach (SPListItem defaultDocItem in lic)
            //{
            //    SPFile file = defaultDocItem.File;
            //    byte[] defaultDocumentBytes = file.OpenBinary();
            //    //Add the default document
            //    SPListItem itemForFile = file.Item;
            //    SPFile addedFile = documentSet.Folder.Files.Add(file.Name,
            //        defaultDocumentBytes,
            //        true);
            //}

            // Create link in call Log list //Not working - in any version of the above code
            //callLogItem["InvestigationDocuments"] = string.Format("{0}, {1}", documentSet.WelcomePageUrl, "Documents");
            //callLogItem.Update();

        }

    }
}
