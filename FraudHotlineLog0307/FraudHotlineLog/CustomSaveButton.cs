using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint.WebControls;

namespace FraudHotlineLog
{
    public class CustomSaveButton : SaveButton
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
        }

        protected override bool SaveItem()
        {
            return base.SaveItem();
        }
    }
}
