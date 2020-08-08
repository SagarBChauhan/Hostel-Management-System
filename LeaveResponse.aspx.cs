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
    public partial class LeaveResponse : System.Web.UI.Page
    {
        String toggalSatus;
        int cid;
        StringBuilder table = new StringBuilder();
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            int lid = Convert.ToInt32(Request.QueryString["lid"]);
            int flag = Convert.ToInt32(Request.QueryString["flag"]);
            int ulid = Convert.ToInt32(Request.QueryString["ulid"]);
            changeStatus(flag,lid);
            if (ulid != 0)
            {
                Panel2.Visible = false;
                update.Visible = true;
                fillControls(ulid);
            }
            else 
            {
                Panel2.Visible = true;
                update.Visible = false;
            }
            getLeaveRequests();
        }

        private void fillControls(int ulid)
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select fName+' '+mName+' '+lName as Name,reason,leaveFrom,leaveTo,status,feedback,leaveId from tblLeave inner join tblStudentRegister on tblLeave.studentId =tblStudentRegister.sid  where leaveId='" + ulid + "';", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblName.Text = Convert.ToString(dr["Name"]);
                lblReason.Text = Convert.ToString(dr["reason"]);
                lblFrom.Text = Convert.ToString(dr["leaveFrom"]);
                lblTo.Text = Convert.ToString(dr["leaveTo"]);
                ddlSatatus.SelectedValue = Convert.ToString(dr["status"]);
                txtFeedback.Text = Convert.ToString(dr["feedback"]);
                id.Text = Convert.ToString(dr["leaveId"]);
            }
            con.Close();
            //throw new NotImplementedException();
        }

        private void changeStatus(int fl,int id)
        {
            if (fl == 0)
            {
                con.Open();
                cmd = new SqlCommand("update tblLeave set status='Rejected' where leaveId=" + id + ";", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //Response.Redirect("LeaveResponse.aspx");
            }
            else if (fl == 1)
            {
                con.Open();
                cmd = new SqlCommand("update tblLeave set status='Accepted' where leaveId=" + id + ";", con);
                cmd.ExecuteNonQuery();
                con.Close();
                //Response.Redirect("LeaveResponse.aspx");
            }
            //throw new NotImplementedException();
        }
        private void getLeaveRequests()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select fName+' '+mName+' '+lName as Name,reason,leaveFrom,leaveTo,status,feedback,leaveId from tblLeave inner join tblStudentRegister on tblLeave.studentId =tblStudentRegister.sid;";
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            table.Append("<table border='1' style='color:Black;'>");
            table.Append("<tr style='background-color: #70AD47;'><th style='color: #FFFFFF;'>Name</th><th style='color: #FFFFFF;'>Reason</th><th style='color: #FFFFFF;'>From</th><th style='color: #FFFFFF;'>To</th><th style='color: #FFFFFF;'>Status</th><th style='color: #FFFFFF;'>Feedback</th><th style='color: #FFFFFF;'>Accept</th><th style='color: #FFFFFF;'>Reject</th><th style='color: #FFFFFF;'>Action</th></tr>");

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    
                    table.Append("<tr style='background-color: #C5E0B3;'>");
                    table.Append("<td>" + dr[0] + "</td>");
                    table.Append("<td>" + dr[1] + "</td>");
                    table.Append("<td>" + dr[2] + "</td>");
                    table.Append("<td>" + dr[3] + "</td>");
                    table.Append("<td>" + dr[4] + "</td>");
                    table.Append("<td>" + dr[5] + "</td>");

                    table.Append("<td><a href='LeaveResponse.aspx?lid=" + dr[6] + "&flag=1'>Accept</a></td>");
                    table.Append("<td><a href='LeaveResponse.aspx?lid=" + dr[6] + "&flag=0'>Reject</a></td>");
                    table.Append("<td><a href='LeaveResponse.aspx?ulid=" + dr[6] + "'>Feedback</a></td>");
                    table.Append("</tr>");
                }
            }
            table.Append("</table>");
            con.Close();
            PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
            //throw new NotImplementedException();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd = new SqlCommand("update tblLeave set status='" + ddlSatatus.SelectedValue + "' , feedback='" + txtFeedback.Text + "' where leaveId='" + id.Text + "';", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("LeaveResponse.aspx");
        }

    }
}