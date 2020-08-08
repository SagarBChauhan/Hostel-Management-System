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
    public partial class LeaveList : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["utyp"] != "Student")
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
            gvLeaveHistory.DataSource = getLeaveHistory();
            gvLeaveHistory.DataBind();
        }

        public DataTable getLeaveHistory()
        {
            cmd = new SqlCommand("select * from tblLeave where studentId='"+Session["ufid"]+"';", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }


        protected void gvLeaveHistory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Response.Redirect("LeaveApply.aspx");
        }

        protected void gvLeaveHistory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
        }
    }
}