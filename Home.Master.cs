using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["utyp"] == null)
                {
                    hlLog.NavigateUrl = "~/Login.aspx";
                    hlLog.Text = "Login";
                }
                else
                {
                    hlLog.NavigateUrl = "~/LogOut.aspx";
                    hlLog.Text = "LogOut";
                }
            }
        }
    }
}
