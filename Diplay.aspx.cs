using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final
{
    public partial class Diplay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("DisplayStudent.aspx");
        }

        protected void btnRector_Click(object sender, EventArgs e)
        {
            Response.Redirect("DisplayRector.aspx");
        }
    }
}