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
    public partial class AddComplain : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        int maxid, cid;
        protected void Page_Load(object sender, EventArgs e)
        {
            Success.Visible = false;
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
            getMaxidComplain();
        }

        private void getMaxidComplain()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select MAX(complainId) as maxid from tblComplain;", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                maxid = (int)dr["maxid"];
            }
            con.Close();
            cid = maxid + 1;
            maxid = 0;
            //throw new NotImplementedException();
        }

        protected void btnAddComplain_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                cmd = new SqlCommand("insert into tblComplain values('" + cid + "','" + Session["ufid"] + "','" + txtComplain.Text + "', '" + DateTime.Today + "' );", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Success.Visible = true;
                Add.Visible = false;
            }
            catch (Exception ex)
            { 
                
            }
        }
    }
}