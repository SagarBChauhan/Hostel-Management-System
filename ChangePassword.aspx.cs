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
    public partial class ChangePassword : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        int uid = 0;
        String un, pwd, typ, stu, flag;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["utyp"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblUser.Text =(string) Session["uname"];
                }
            }

            SqlDataReader dr;
            cmd = new SqlCommand("select * from tblLogin where username='" + (string)Session["uname"] + "' and password='" + txtOldPassword.Text + "' ;", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                uid = (int)dr["uid"];
                pwd = (string)dr["password"];
                typ = (string)dr["accountType"];
                stu = (string)dr["status"];

            }
            con.Close();
        }

        protected void btnChange_Click1(object sender, EventArgs e)
        {
            if (pwd == txtOldPassword.Text && stu == "Active")
            {
                con.Open();

                cmd = new SqlCommand("update tblLogin set password='" + txtNewPassword.Text + "' where uid='" + uid + "';", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblMsg.Text = "Incorrect passwod ";
            }
        }
    }
}