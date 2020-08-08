using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

namespace final
{
    public partial class ViewComplain : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["utyp"] != "Admin")
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {

                }
            }
            BindData();
        }
        private void BindData()
        {
            gvComplain.DataSource = getComplainHistory();
            gvComplain.DataBind();
        }

        public DataTable getComplainHistory()
        {
            cmd = new SqlCommand("select tblStudentRegister.fName , tblComplain.* from tblComplain inner join tblStudentRegister on tblStudentRegister.sid = tblComplain.studentId;", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

    }
}