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
    public partial class Login : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        String un, pwd, typ, stu;

        int uid,ufid;
        protected void Page_Load(object sender, EventArgs e)
        {            
        }

        private void getStudForeignKeyId()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select sid from tblStudentRegister where userId='" + uid + "';", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                ufid = Convert.ToInt32(dr["sid"]);
            }
            con.Close();

            //throw new NotImplementedException();
        }
        private void getRectorForeignKeyId()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select rid from tblRectorRegister where userId='" + uid + "';", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                ufid = Convert.ToInt32(dr["rid"]);
            }
            con.Close();
            //throw new NotImplementedException();
        }
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select * from tblLogin where username='" + txtUserName.Text + "' and password='" + txtPassword.Text + "';", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                uid = (int)dr["uid"];
                un = (string)dr["username"];
                pwd = (string)dr["password"];
                typ = (string)dr["accountType"];
                stu = (string)dr["status"];
                /*     Session["userName"] = dr["userName"];
                     Session["usrtyp"] = dr["Type"];
                     Response.Redirect("Home.aspx");*/
            }
            con.Close();

            if (un == txtUserName.Text && pwd == txtPassword.Text && stu == "Active")
            {
                
                if (typ == "Admin")
                {
                    lblMessage.Text = "Welcome Admin";
                    Session["uid"] = uid;
                    Session["utyp"] = "Admin";
                    Session["uname"] = un;
                    Response.Redirect("AdminHome.aspx");
                }
                else if (typ == "Student")
                {
                    getStudForeignKeyId();
                    lblMessage.Text = "Welcome Student";
                    Session["uid"] = uid;
                    Session["utyp"] = "Student";
                    Session["uname"] = un;
                    Session["ufid"] = ufid;
                    Response.Redirect("StudentHome.aspx");
                }
                else if (typ == "Rector")
                {
                    getRectorForeignKeyId();
                    lblMessage.Text = "Welcome Rector";
                    Session["uid"] = uid;
                    Session["utyp"] = "Rector";
                    Session["uname"] = un;
                    Session["ufid"] = ufid;
                    Response.Redirect("RectorHome.aspx");
                }
            }
            else
            {
                if (un == txtUserName.Text && pwd == txtPassword.Text && stu == "Pending")
                {
                    
                    getStudForeignKeyId();
                    lblMessage.Text = "Welcome Student";
                    Session["uid"] = uid;
                    Session["utyp"] = "Student";
                    Session["uname"] = un;
                    Session["ufid"] = ufid;
                    Response.Redirect("PayDiposite.aspx");
                }
                lblMessage.Text = "Invalid Username and password";
            }
        }

    }
}