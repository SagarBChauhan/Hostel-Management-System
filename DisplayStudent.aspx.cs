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
using System.Text;

namespace final
{
    public partial class DisplayStudent : System.Web.UI.Page
    {
        String toggalSatus;
        StringBuilder table = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        SqlDataAdapter da;
        DataTable dt;
        int upid;
        protected void Page_Load(object sender, EventArgs e)
        {
            int togid = Convert.ToInt32(Request.QueryString["togid"]);
            int flag = Convert.ToInt32(Request.QueryString["flag"]);
            int uflag = Convert.ToInt32(Request.QueryString["uflag"]);
            upid = Convert.ToInt32(Request.QueryString["upid"]);
            Panel1.Visible = false;
            if (uflag == 1)
            {
                Panel3.Visible = true;
                Panel2.Visible = false;
                fillControls(upid);
                uflag = 0;
            }
            else
            {
                Panel3.Visible = false;
                Panel2.Visible = true;
            }
            
            if(togid!=0)
            {
                changeStatus(togid,flag);
            }
            getStudentInfo();
            fillDropdown();
        }

        private void fillControls(int id)
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select * from tblStudentRegister where sid='" + id + "';", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtFName.Text = Convert.ToString(dr["fName"]);
                txtMName.Text = Convert.ToString(dr["mName"]);
                txtLName.Text = Convert.ToString(dr["lName"]);
                txtAddress.Text = Convert.ToString(dr["Address"]);
                txtCity.Text = Convert.ToString(dr["City"]);
                txtPINCode.Text = Convert.ToString(dr["pincode"]);
                //txtDOB.Text = Convert.ToString(dr["DOB"]);
                if (Convert.ToString(dr["gender"]) == "Male") 
                {
                    rblGender.SelectedIndex = 0;
                }
                else
                {
                    rblGender.SelectedIndex = 1;               
                }
                txtContactNo.Text = Convert.ToString(dr["contact"]);
                txtParentsContactNo.Text = Convert.ToString(dr["perentContact"]);
                txtDepartment.Text = Convert.ToString(dr["department"]);
                txtEmailID.Text = Convert.ToString(dr["email"]);
                txtMotherName.Text = Convert.ToString(dr["motherName"]);
                txtFatherName.Text = Convert.ToString(dr["fatherName"]);
            }
            con.Close();
           // throw new NotImplementedException();
        }

        private void changeStatus(int id,int fl)
        {
            if (fl == 0)
            {
                con.Open();
                cmd = new SqlCommand("update tblLogin Set status='Deactive' where uid=" + id + ";", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("DisplayStudent.aspx");
            }
            else if (fl == 1)
            {
                con.Open();
                cmd = new SqlCommand("update tblLogin Set status='Active' where uid=" + id + ";", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("DisplayStudent.aspx");
            }
            //throw new NotImplementedException();
        }
        private void updateInfo(int id)
        {
            con.Open();
            cmd = new SqlCommand("update tblStudentRegister set fName='"+txtFName.Text+"',mName='"+txtMName.Text+"',lName='"+txtLName.Text+"',Address='"+txtAddress.Text+"',City='"+txtCity.Text+"',pincode='"+txtPINCode.Text+"',gender='"+rblGender.Text+"',contact='"+txtContactNo.Text+"',motherName='"+txtMotherName.Text+"',fatherName='"+txtFatherName .Text+"',perentContact='"+txtParentsContactNo.Text+"',department='"+txtDepartment.Text+"',email='"+txtEmailID.Text+"' where sid=" + id + ";", con);
            cmd.ExecuteNonQuery();
            con.Close();
            

        }
        private void fillDropdown()
        {
            GridView1.DataSource = getRoomData();
            
            GridView1.DataBind();
        }
        private void getStudentInfo()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select fName+' '+ mName+' '+lName as Name,Address +','+City as Address,pincode ,dob,gender,contact,motherName,fatherName,perentContact,department,email,tblLogin.username,status,userId ,sid from tblStudentRegister inner join tblLogin on tblStudentRegister.userId =tblLogin.uid;";
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            table.Append("<table border='1' style='color:Black;'>");
            table.Append("<tr style='background-color: #70AD47;'><th style='color: #FFFFFF;'>Name</th><th style='color: #FFFFFF;'>Address</th><th style='color: #FFFFFF;'>Pincode</th><th style='color: #FFFFFF;'>dob</th><th style='color: #FFFFFF;'>gender</th><th style='color: #FFFFFF;'>contact</th><th style='color: #FFFFFF;'>motherName</th><th style='color: #FFFFFF;'>fatherName</th><th style='color: #FFFFFF;'>perentContact</th><th style='color: #FFFFFF;'>department</th><th style='color: #FFFFFF;'>email</th><th style='color: #FFFFFF;'>username</th><th style='color: #FFFFFF;'>status</th><th style='color: #FFFFFF;'>userId</th><th style='color: #FFFFFF;'>sid</th></tr>");

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    int flag;
                    table.Append("<tr style='background-color: #C5E0B3;'>");
                    table.Append("<td>" + dr[0] + "</td>");
                    table.Append("<td>" + dr[1] + "</td>");
                    table.Append("<td>" + dr[2] + "</td>");
                    table.Append("<td>" + dr[3] + "</td>");
                    table.Append("<td>" + dr[4] + "</td>");
                    table.Append("<td>" + dr[5] + "</td>");
                    table.Append("<td>" + dr[6] + "</td>");
                    table.Append("<td>" + dr[7] + "</td>");
                    table.Append("<td>" + dr[8] + "</td>");
                    table.Append("<td>" + dr[9] + "</td>");
                    table.Append("<td>" + dr[10] + "</td>");
                    table.Append("<td>" + dr[11] + "</td>");
                    table.Append("<td>" + dr[12] + "</td>");
                    
                    if (dr[12].ToString() == "Active")
                    {
                        toggalSatus = "Deactive";
                        flag = 0;
                    }
                    else
                    {
                        toggalSatus = "Active";
                        flag = 1;
                    }
                    table.Append("<td><a href='DisplayStudent.aspx?togid=" + dr[13] + "&flag="+flag+"'>" + toggalSatus + "</a></td>");
                    table.Append("<td><a href='DisplayStudent.aspx?upid=" + dr[14] + "&uflag=1'>Update</a></td>");
                    table.Append("</tr>");
                }
            }
            table.Append("</table>");
            con.Close();
            PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
            //throw new NotImplementedException();
        }
        public DataTable getRoomData()
        {
            cmd = new SqlCommand("select * from tblStudentRegister;", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                updateInfo(upid);
                Response.Redirect("DisplayStudent.aspx?uflag=0");
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text += "Error In Register:" + ex;
            }
            
        }


    }
}