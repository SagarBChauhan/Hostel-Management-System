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
    public partial class ViewProfile : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            int id=Convert.ToInt32(Request.QueryString["id"]);
            SqlDataReader dr;
            cmd = new SqlCommand("select * from tblStudentRegister where sid='" + id + "';", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblName.Text = Convert.ToString(dr["fName"]) + " " + Convert.ToString(dr["mName"] + " " + Convert.ToString(dr["lName"]));
                lblAddress.Text = Convert.ToString(dr["Address"]) + ", " + Convert.ToString(dr["City"]) + " - " + Convert.ToString(dr["pincode"]);
                lblDob.Text = Convert.ToString(dr["DOB"]);
                lblGender.Text = Convert.ToString(dr["gender"]);
                lblContact.Text = Convert.ToString(dr["contact"]);
                lblParantsContact.Text = Convert.ToString(dr["perentContact"]);
                lblDepartment.Text = Convert.ToString(dr["department"]);
                lblEmail.Text = Convert.ToString(dr["email"]);
                lblMother.Text = Convert.ToString(dr["motherName"]);
                lblFather.Text = Convert.ToString(dr["fatherName"]);
                lblUserName.Text = (string)Session["uname"];
            }
            con.Close();
        }
    }
}