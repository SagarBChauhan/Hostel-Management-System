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
    public partial class PaymentStatus : System.Web.UI.Page
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
            getPaymentData();
        }

        private void getPaymentData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select fName+' '+mName+' '+lName as Name,bankName,accountNo,date,totalAmont,FeeDuration,sid from tblPayment inner join tblStudentRegister on tblPayment.studentId=tblStudentRegister.sid;";
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            table.Append("<table border='1' style='color:Black;'>");
            table.Append("<tr style='background-color: #70AD47;'><th style='color: #FFFFFF;'>Name</th><th style='color: #FFFFFF;'>Bank Name</th><th style='color: #FFFFFF;'>Bank No</th><th style='color: #FFFFFF;'>date</th><th style='color: #FFFFFF;'>Amount</th><th style='color: #FFFFFF;'>Duration</th><th style='color: #FFFFFF;'>Action</th></tr>");

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
                    table.Append("<td><a href='ViewProfile.aspx?id=" + dr[6] + "'>Display</a></td>");
                    table.Append("</tr>");
                }
            }
            table.Append("</table>");
            con.Close();
            PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
            //throw new NotImplementedException();
        }
    }
}