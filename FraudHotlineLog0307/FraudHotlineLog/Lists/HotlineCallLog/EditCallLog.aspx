﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCallLog.aspx.cs" Inherits="FraudHotlineLog.Layouts.FraudHotlineLog.EditCallLog" MasterPageFile="~masterurl/default.master" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ID="Content1" ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePoint:ListFormPageTitle ID="ListFormPageTitle1" runat="server"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server">
	<span class="die">
	<SharePoint:ListProperty Property="LinkTitle" runat="server" id="ID_LinkTitle"/>: </span>
	<SharePoint:ListItemProperty id="ID_ItemProperty" maxlength="40" runat="server"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="PlaceHolderPageImage" runat="server">
	<img src="/_layouts/images/blank.gif" width='1' height='1' alt="" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderId="PlaceHolderLeftNavBar" runat="server" >
<SharePoint:UIVersionedContent ID="UIVersionedContent1" UIVersion="4" runat="server">
	<ContentTemplate>
				<div class="ms-quicklaunchouter">
				<div class="ms-quickLaunch">
				<Sharepoint:UIVersionedContent ID="UIVersionedContent2" runat="server" UIVersion="4">
					<ContentTemplate>
						<h2 style="display:inline;" class="ms-hidden"><SharePoint:EncodedLiteral ID="EncodedLiteral1" runat="server" text="<%$Resources:wss,quiklnch_pagetitle%>" EncodeMethod="HtmlEncode"/></h2>
					</ContentTemplate>
				</SharePoint:UIVersionedContent>
				<SharePoint:UIVersionedContent ID="UIVersionedContent3" UIVersion="3" runat="server">
					<ContentTemplate>
						<h3 class="ms-standardheader"><label class="ms-hidden"><SharePoint:EncodedLiteral ID="EncodedLiteral2" runat="server" text="<%$Resources:wss,quiklnch_pagetitle%>" EncodeMethod="HtmlEncode"/></label>
						<Sharepoint:SPSecurityTrimmedControl ID="SPSecurityTrimmedControl1" runat="server" PermissionsString="ViewFormPages">
							<div class="ms-quicklaunchheader"><SharePoint:SPLinkButton id="idNavLinkViewAll" runat="server" NavigateUrl="~site/_layouts/viewlsts.aspx" Text="<%$Resources:wss,quiklnch_allcontent%>" accesskey="<%$Resources:wss,quiklnch_allcontent_AK%>"/></div>
						</SharePoint:SPSecurityTrimmedControl>
						</h3>
					</ContentTemplate>
				</SharePoint:UIVersionedContent>
				<Sharepoint:SPNavigationManager
				id="QuickLaunchNavigationManager"
				runat="server"
				QuickLaunchControlId="QuickLaunchMenu"
				ContainedControl="QuickLaunch"
				EnableViewState="false"
				CssClass="ms-quicklaunch-navmgr"
				>
				<div>
					<SharePoint:DelegateControl ID="DelegateControl1" runat="server"
						ControlId="QuickLaunchDataSource">
					 <Template_Controls>
						<asp:SiteMapDataSource
						SiteMapProvider="SPNavigationProvider"
						ShowStartingNode="False"
						id="QuickLaunchSiteMap"
						StartingNodeUrl="sid:1025"
						runat="server"
						/>
					 </Template_Controls>
					</SharePoint:DelegateControl>
			<SharePoint:UIVersionedContent ID="UIVersionedContent4" UIVersion="3" runat="server">
				<ContentTemplate>
					<SharePoint:AspMenu
						id="QuickLaunchMenu"
						runat="server"
						DataSourceId="QuickLaunchSiteMap"
						Orientation="Vertical"
						StaticDisplayLevels="2"
						ItemWrap="true"
						MaximumDynamicDisplayLevels="0"
						StaticSubMenuIndent="0"
						SkipLinkText=""
						CssClass="s4-die"
						>
						<LevelMenuItemStyles>
							<asp:MenuItemStyle CssClass="ms-navheader"/>
							<asp:MenuItemStyle CssClass="ms-navitem"/>
						</LevelMenuItemStyles>
						<LevelSubMenuStyles>
							<asp:SubMenuStyle CssClass="ms-navSubMenu1"/>
							<asp:SubMenuStyle CssClass="ms-navSubMenu2"/>
						</LevelSubMenuStyles>
						<LevelSelectedStyles>
							<asp:MenuItemStyle CssClass="ms-selectednavheader"/>
							<asp:MenuItemStyle CssClass="ms-selectednav"/>
						</LevelSelectedStyles>
					</SharePoint:AspMenu>
				</ContentTemplate>
			</SharePoint:UIVersionedContent>
			<SharePoint:UIVersionedContent ID="UIVersionedContent5" UIVersion="4" runat="server">
				<ContentTemplate>
					<SharePoint:AspMenu
					  id="V4QuickLaunchMenu"
					  runat="server"
					  EnableViewState="false"
					  DataSourceId="QuickLaunchSiteMap"
					  UseSimpleRendering="true"
					  Orientation="Vertical"
					  StaticDisplayLevels="2"
					  MaximumDynamicDisplayLevels="0"
					  SkipLinkText=""
					  CssClass="s4-ql" />
				</ContentTemplate>
			</SharePoint:UIVersionedContent>
				</div>
				</Sharepoint:SPNavigationManager>
			<Sharepoint:UIVersionedContent ID="UIVersionedContent6" runat="server" UIVersion="3">
				<ContentTemplate>
					<Sharepoint:SPNavigationManager
					id="TreeViewNavigationManager"
					runat="server"
					ContainedControl="TreeView"
					>
					  <table class="ms-navSubMenu1" cellpadding="0" cellspacing="0" border="0">
						<tr>
						  <td>
							<table class="ms-navheader" width="100%" cellpadding="0" cellspacing="0" border="0">
							  <tr>
								<td nowrap="nowrap" id="idSiteHierarchy">
								  <SharePoint:SPLinkButton runat="server" NavigateUrl="~site/_layouts/viewlsts.aspx" id="idNavLinkSiteHierarchy" Text="<%$Resources:wss,treeview_header%>" accesskey="<%$Resources:wss,quiklnch_allcontent_AK%>"/>
								</td>
							  </tr>
							</table>
						  </td>
						</tr>
					  </table>
					  <div class="ms-treeviewouter">
						<SharePoint:DelegateControl ID="DelegateControl2" runat="server" ControlId="TreeViewAndDataSource">
						  <Template_Controls>
							<SharePoint:SPHierarchyDataSourceControl
							 runat="server"
							 id="TreeViewDataSource"
							 RootContextObject="Web"
							 IncludeDiscussionFolders="true"
							/>
							<SharePoint:SPRememberScroll runat="server" id="TreeViewRememberScroll" onscroll="javascript:_spRecordScrollPositions(this);" style="overflow: auto;height: 400px;width: 150px; ">
							  <Sharepoint:SPTreeView
								id="WebTreeView"
								runat="server"
								ShowLines="false"
								DataSourceId="TreeViewDataSource"
								ExpandDepth="0"
								SelectedNodeStyle-CssClass="ms-tvselected"
								NodeStyle-CssClass="ms-navitem"
								NodeStyle-HorizontalPadding="2"
								SkipLinkText=""
								NodeIndent="12"
								ExpandImageUrl="/_layouts/images/tvplus.gif"
								CollapseImageUrl="/_layouts/images/tvminus.gif"
								NoExpandImageUrl="/_layouts/images/tvblank.gif"
							  >
							  </Sharepoint:SPTreeView>
							</Sharepoint:SPRememberScroll>
						  </Template_Controls>
						</SharePoint:DelegateControl>
					  </div>
					</Sharepoint:SPNavigationManager>
				</ContentTemplate>
			</SharePoint:UIVersionedContent>
			<Sharepoint:UIVersionedContent ID="UIVersionedContent7" runat="server" UIVersion="4">
				<ContentTemplate>
					<Sharepoint:SPNavigationManager
					id="TreeViewNavigationManagerV4"
					runat="server"
					ContainedControl="TreeView"
					CssClass="s4-treeView"
					>
					  <SharePoint:SPLinkButton runat="server" NavigateUrl="~site/_layouts/viewlsts.aspx" id="idNavLinkSiteHierarchyV4" Text="<%$Resources:wss,treeview_header%>" accesskey="<%$Resources:wss,quiklnch_allcontent_AK%>" CssClass="s4-qlheader" />
						  <div class="ms-treeviewouter">
							<SharePoint:DelegateControl ID="DelegateControl3" runat="server" ControlId="TreeViewAndDataSource">
							  <Template_Controls>
								<SharePoint:SPHierarchyDataSourceControl
								 runat="server"
								 id="TreeViewDataSourceV4"
								 RootContextObject="Web"
								 IncludeDiscussionFolders="true"
								/>
								<SharePoint:SPRememberScroll runat="server" id="TreeViewRememberScrollV4" onscroll="javascript:_spRecordScrollPositions(this);" style="overflow: auto;height: 400px;width: 155px; ">
								  <Sharepoint:SPTreeView
									id="WebTreeViewV4"
									runat="server"
									ShowLines="false"
									DataSourceId="TreeViewDataSourceV4"
									ExpandDepth="0"
									SelectedNodeStyle-CssClass="ms-tvselected"
									NodeStyle-CssClass="ms-navitem"
									SkipLinkText=""
									NodeIndent="12"
									ExpandImageUrl="/_layouts/images/tvclosed.png"
									ExpandImageUrlRtl="/_layouts/images/tvclosedrtl.png"
									CollapseImageUrl="/_layouts/images/tvopen.png"
									CollapseImageUrlRtl="/_layouts/images/tvopenrtl.png"
									NoExpandImageUrl="/_layouts/images/tvblank.gif"
								  >
								  </Sharepoint:SPTreeView>
								</Sharepoint:SPRememberScroll>
							  </Template_Controls>
							</SharePoint:DelegateControl>
						  </div>
					</Sharepoint:SPNavigationManager>
				</ContentTemplate>
			</SharePoint:UIVersionedContent>
				<SharePoint:UIVersionedContent UIVersion="3" runat="server" id="PlaceHolderQuickLaunchBottomV3">
					<ContentTemplate>
						<table width="100%" cellpadding="0" cellspacing="0" border="0" class="s4-die">
						<tbody>
						<tr><td>
						<table class="ms-recyclebin" width="100%" cellpadding="0" cellspacing="0" border="0">
						<tbody>
						<tr><td nowrap="nowrap">
						<SharePoint:SPLinkButton runat="server" NavigateUrl="~site/_layouts/recyclebin.aspx" id="v3idNavLinkRecycleBin" ImageUrl="/_layouts/images/recycbin.gif" Text="<%$Resources:wss,StsDefault_RecycleBin%>" PermissionsString="DeleteListItems" />
						</td></tr>
						</table>
						</td></tr>
						</table>
					</ContentTemplate>
				</SharePoint:UIVersionedContent>
				<SharePoint:UIVersionedContent UIVersion="4" runat="server" id="PlaceHolderQuickLaunchBottomV4">
					<ContentTemplate>
						<ul class="s4-specialNavLinkList">
							<li>
								<SharePoint:ClusteredSPLinkButton
									runat="server"
									NavigateUrl="~site/_layouts/recyclebin.aspx"
									ImageClass="s4-specialNavIcon"
									ImageUrl="/_layouts/images/fgimg.png"
									ImageWidth=16
									ImageHeight=16
									OffsetX=0
									OffsetY=428
									id="idNavLinkRecycleBin"
									Text="<%$Resources:wss,StsDefault_RecycleBin%>"
									CssClass="s4-rcycl"
									PermissionsString="DeleteListItems" />
							</li>
							<li>
								<SharePoint:ClusteredSPLinkButton
									id="idNavLinkViewAllV4"
									runat="server"
									PermissionsString="ViewFormPages"
									NavigateUrl="~site/_layouts/viewlsts.aspx"
									ImageClass="s4-specialNavIcon"
									ImageUrl="/_layouts/images/fgimg.png"
									ImageWidth=16
									ImageHeight=16
									OffsetX=0
									OffsetY=0
									Text="<%$Resources:wss,quiklnch_allcontent_short%>"
									accesskey="<%$Resources:wss,quiklnch_allcontent_AK%>"/>
							</li>
						</ul>
					</ContentTemplate>
				</SharePoint:UIVersionedContent>
				</div>
				</div>
	</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderId="PlaceHolderMain" runat="server">
<SharePoint:UIVersionedContent ID="UIVersionedContent8" UIVersion="4" runat="server">
	<ContentTemplate>
	<div style="padding-left:5px">
	</ContentTemplate>
</SharePoint:UIVersionedContent>
	<table cellpadding="0" cellspacing="0" id="onetIDListForm" style="width:100%">
	 <tr>
	  <td>
	 <WebPartPages:WebPartZone runat="server" FrameType="None" ID="Main" Title="loc:Main">
     <ZoneTemplate>
		
     </ZoneTemplate></WebPartPages:WebPartZone>

     <!-- Customization Start -->
      <table id="SQFormTable"  border="0"  width="100%"> 
                     <tr> 
                         <td  class="ms-toolbar"  nowrap="nowrap"> 
                            <SharePoint:FormToolBar ID="FormToolBar1"  runat="server"  ControlMode="New"  /> 
                         </td> 
                     </tr> 
                     <tr> 
                         <td> 
                             <span  id="part1">  
                             <!-- ikarstein: This line is important for "Attachments" --> 
                                 <table  border="0"  cellspacing="0"  width="100%"> 
                                 <tr> 
                                        <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                            <h3  class="ms-standardheader"> 
                                                <nobr>Title</nobr> 
                                        </h3> 
                                        </td> 
                                        <td  width="400px"  valign="top"  class="ms-formbody"> 
                                            <SharePoint:FormField  runat="server"  ID="Field_Title"  ControlMode="Edit"  FieldName="Title" />
                                            <SharePoint:FieldDescription  runat="server"  ID="Field_Title_Description" FieldName="Title" ControlMode="Edit"  />
                                            
                                        </td> 
                                 </tr>
                                  <tr> 
                                        <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                            <h3  class="ms-standardheader"> 
                                                <nobr>Call #</nobr> 
                                        </h3> 
                                        </td> 
                                        <td  width="400px"  valign="top"  class="ms-formbody"> 
                                            <SharePoint:FormField  runat="server"  ID="Field_HLCallNumber"  ControlMode="Edit"  FieldName="HLCallNumber"  /> 
                                            <SharePoint:FieldDescription  runat="server"  ID="Field_HLCallNumber_Description"  FieldName="HLCallNumber" ControlMode="Edit"  />
                                            
                                        </td> 
                                 </tr>
                                 <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>Topic</nobr> 
                                            </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="Field_CallTopic"  ControlMode="Edit" FieldName="CallTopic"   />
                                             <SharePoint:FieldDescription  runat="server"  ID="Field_CallTopic_Description"  FieldName="CallTopic" ControlMode="Edit"  />
                                         </td> 
                                 </tr>
                                 <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>Received</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="Field_CallReceived"  ControlMode="Edit"  FieldName="CallReceived"  />
                                             <SharePoint:FieldDescription  runat="server"  ID="Field_CallReceived_Description"  FieldName="CallReceived" ControlMode="Edit"  />

                                         </td> 
                                     </tr> 
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>Area of Concern</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="Field_AreaofConcern"  ControlMode="Edit"  FieldName="AreaofConcern"  />
                                             <SharePoint:FieldDescription  runat="server"  ID="Field_AreaofConcern_Description"  FieldName="AreaofConcern" ControlMode="Edit"  />

                                         </td> 
                                     </tr>
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>Caller Name</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="Field_CallerName"  ControlMode="Edit"  FieldName="CallerName"  />
                                             <SharePoint:FieldDescription  runat="server"  ID="Field_CallerName_Description"  FieldName="CallerName" ControlMode="Edit"  />

                                         </td> 
                                     </tr>
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>Caller Phone #</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="Field_CallerPhone"  ControlMode="Edit"  FieldName="CallerPhone"  />
                                             <SharePoint:FieldDescription  runat="server"  ID="Field_CallerPhone_Description"  FieldName="CallerPhone" ControlMode="Edit"  />

                                         </td> 
                                     </tr>
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>Start Date</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="Field_StartDate"  ControlMode="Edit"  FieldName="StartDate"  />
                                             <SharePoint:FieldDescription  runat="server"  ID="Field_StartDate_Description"  FieldName="StartDate" ControlMode="Edit"  />

                                         </td> 
                                     </tr>
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>End Date</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="Field_EndDate"  ControlMode="Edit"  FieldName="_EndDate"  />
                                             <SharePoint:FieldDescription  runat="server"  ID="Field_EndDate_Description"  FieldName="_EndDate" ControlMode="Edit"  />

                                         </td> 
                                     </tr>
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>Comments</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="Field_AuditorComments"  ControlMode="Edit"  FieldName="AuditorComments"  />
                                             <SharePoint:FieldDescription  runat="server"  ID="Field_AuditorComments_Description"  FieldName="AuditorComments" ControlMode="Edit"  />

                                         </td> 
                                     </tr>
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>Investigation Launched</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="Field_InvestigationStarted"  ControlMode="Display"  FieldName="InvestigationStarted"  />
                                             <SharePoint:FieldDescription  runat="server"  ID="Field_InvestigationStarted_Description"  FieldName="InvestigationStarted" ControlMode="Display"  />

                                         </td> 
                                     </tr>
                                     <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>Documents</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                             <SharePoint:FormField  runat="server"  ID="Field_InvestigationDocuments"  ControlMode="Edit"  FieldName="InvestigationDocuments"  />
                                             <SharePoint:FieldDescription  runat="server"  ID="Field_InvestigationDocuments_Description"  FieldName="InvestigationDocuments" ControlMode="Edit"  />

                                         </td> 
                                     </tr>

                                     <asp:Panel ID="pnlInvestigation" runat="server">
                                      <tr> 
                                         <td  width="190px"  valign="top"  class="ms-formlabel"> 
                                             <h3  class="ms-standardheader"> 
                                                 <nobr>Launch Investigation</nobr> 
                                             </h3> 
                                         </td> 
                                         <td  width="400px"  valign="top"  class="ms-formbody"> 
                                            <asp:CheckBox runat="server" ID="chkLaunchInvestigation" />
                                             
                                         </td> 
                                     </tr> 
                                     </asp:Panel>

                                 <tr>
                                     <!-- ikarstein: Add this table for "Save" and "Cancel" buttons / BEGIN --> 
                                     <table  width="100%"  border="0"  cellspacing="0"> 
                                         <tr> 
                                             <td  width="99%"  class="ms-toolbar"  nowrap="nowrap"> 
                                                 <img  src="/_layouts/images/blank.gif"  width="1"  height="18"  /> 
                                             </td> 
                                             <td  class="ms-toolbar"  nowrap="nowrap"> 
                                                 <SharePoint:SaveButton  runat="server"  ControlMode="Edit"  ID="savebutton"  /> 
                                            </td> 
                                             <td  class="ms-separator"> 
                                             </td> 
                                             <td  class="ms-toolbar"  nowrap="nowrap"  align="right"> 
                                                 <SharePoint:GoBackButton  runat="server"  ControlMode="Edit"  ID="gobackbutton"  /> 
                                             </td> 
                                         </tr> 
                                     </table> 
                                     <!-- ikarstein: END --> 
                             </span> 
                             <SharePoint:AttachmentUpload ID="AttachmentUpload1"  runat="server"  ControlMode="Edit"  /> 
                             <SharePoint:ItemHiddenVersion ID="ItemHiddenVersion1"  runat="server"  ControlMode="Edit"  /> 
                         </td> 
                     </tr> 
                     </asp:Panel>
                   </table> 

      <!-- Customization End -->

	 <img src="/_layouts/images/blank.gif" width='590' height='1' alt="" />
	  </td>
	 </tr>
	</table>
<SharePoint:UIVersionedContent ID="UIVersionedContent9" UIVersion="4" runat="server">
	<ContentTemplate>
	</div>
	</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
	<SharePoint:UIVersionedContent ID="UIVersionedContent10" UIVersion="4" runat="server"><ContentTemplate>
		<SharePoint:CssRegistration Name="forms.css" runat="server"/>
	</ContentTemplate></SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderId="PlaceHolderTitleLeftBorder" runat="server">
<table cellpadding="0" height="100%" width="100%" cellspacing="0">
 <tr><td class="ms-areaseparatorleft"><img src="/_layouts/images/blank.gif" width='1' height='1' alt="" /></td></tr>
</table>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderId="PlaceHolderTitleAreaClass" runat="server">
<script type="text/javascript" id="onetidPageTitleAreaFrameScript">
    if (document.getElementById("onetidPageTitleAreaFrame") != null) {
        document.getElementById("onetidPageTitleAreaFrame").className = "ms-areaseparator";
    }
</script>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderId="PlaceHolderBodyAreaClass" runat="server">
<style type="text/css">
.ms-bodyareaframe {
	padding: 8px;
	border: none;
}
</style>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderId="PlaceHolderBodyLeftBorder" runat="server">
<div class='ms-areaseparatorleft'><img src="/_layouts/images/blank.gif" width='8' height='100%' alt="" /></div>
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderId="PlaceHolderTitleRightMargin" runat="server">
<div class='ms-areaseparatorright'><img src="/_layouts/images/blank.gif" width='8' height='100%' alt="" /></div>
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderId="PlaceHolderBodyRightMargin" runat="server">
<div class='ms-areaseparatorright'><img src="/_layouts/images/blank.gif" width='8' height='100%' alt="" /></div>
</asp:Content>
<asp:Content ID="Content13" ContentPlaceHolderId="PlaceHolderTitleAreaSeparator" runat="server"/>
