using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final
{
    public partial class RectorHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["utyp"] != "Rector")
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    //lblMsg.Text = "Hello Admin" + Session["uid"];
                }
                Label1.Text = Convert.ToString(Session["ufid"]);
            }
        }
    }
}