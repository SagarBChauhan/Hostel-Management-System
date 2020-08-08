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
    public partial class RegisterStudent : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        int maxid, id=0, pid=0;
        String pwd, UserName;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GetMaxidStudent();
                GetMaxidLogin();
            }
            catch (Exception ex)
            {
                if (pid == 0 )
                {
                    pid = 1;
                }
                lblId.Text = "Your Register id: " + id + " Login Id: " + pid;
                lblErrorMsg.Text = "Registration Warning: " + ex;
            }
        }

        private void GetMaxidLogin()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select MAX(uid) as maxid from tblLogin;", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                maxid = (int)dr["maxid"];
            }
            con.Close();
            pid = maxid + 1;
            maxid = 0;
            lblId.Text = "Your Register id: " + id + " Login Id: " + pid;
            //throw new NotImplementedException();
        }

        private void GetMaxidStudent()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select MAX(sid)as maxid from tblStudentRegister;", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                maxid = (int)dr["maxid"];
            }
            con.Close();
            id = maxid + 1;
            maxid = 0;
            
            //throw new NotImplementedException();
        }
        protected void StudentWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (e.NextStepIndex == 5)
            {
                GenerateUserName();
                lblName.Text = txtFName.Text +" "+ txtMName.Text + " "+ txtLName.Text;
                lblGender.Text = rblGender.SelectedValue;
                lblDOB.Text = txtDOB.Text;
                lblMotherName.Text = txtMotherName.Text;
                lblFatherName.Text = txtFatherName.Text;
                lblAddress.Text = txtAddress.Text;
                lblCity.Text = txtCity.Text;
                lblPin.Text = txtPINCode.Text;
                lblEmailID.Text = txtEmailID.Text;
                lblContactNo.Text = txtContactNo.Text;
                lblPerentContactNo.Text = txtParentsContactNo.Text;
                lblDepartment.Text = txtDepartment.Text;
            }
        }

        protected void StudentWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            Register();
            Session["Email"] = txtEmailID.Text;
            Session["UserName"] = UserName;
            Session["pwd"] = pwd;
            Session["Name"] = lblName.Text;
            Response.Redirect("Email.aspx");
        }

        private void Register()
        {
            try
            {
                GenerateUserName();
                GenerateRandomPassword();

                con.Open();
                // txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
                cmd = new SqlCommand("insert into tblLogin values ('" + pid + "','" + UserName + "','" + pwd + "','Student','Pending');", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text += "Error in Login:" + ex;
            }
           
            try
            {

                con.Open();
               // txtDOB.Text = Calendar1.SelectedDate.ToShortDateString();
                cmd = new SqlCommand("insert into tblStudentRegister values ('" + id + "','" + txtFName.Text + "','" + txtMName.Text + "','" + txtLName.Text + "','" + txtAddress.Text + "','" + txtCity.Text + "','" + txtPINCode.Text + "','" + txtDOB.Text + "','" + rblGender.Text + "','" + txtContactNo.Text + "','" + txtMotherName.Text + "','" + txtFatherName.Text + "','" + txtParentsContactNo.Text + "','" + txtDepartment.Text + "','" + txtEmailID.Text + "','"+pid+"');", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
               lblErrorMsg.Text += "Error In Register:" + ex;
            }
        }

        private void GenerateUserName()
        {
            UserName = txtFName.Text + (txtMName.Text).ElementAt(0) + txtLName.Text + pid;
            lblPass.Text = UserName;
            //throw new NotImplementedException();
        }

        private void GenerateRandomPassword()
        {
            string allowedChars = "";
            allowedChars = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";
            allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";
            allowedChars += "1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,&,?";
            char[] sep = { ',' };
            string[] arr = allowedChars.Split(sep);
            string passwordString = "";
            string temp = "";
            Random rand = new Random();
            for (int i = 0; i < Convert.ToInt32(8); i++)
            {
                temp = arr[rand.Next(0, arr.Length)];
                passwordString += temp;
            }
            pwd= Convert.ToString(passwordString);
            //throw new NotImplementedException();
        }
    }
}