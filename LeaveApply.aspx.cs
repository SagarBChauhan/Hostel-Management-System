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
    public partial class LeaveApply : System.Web.UI.Page
    {
        int maxid, id,uid,sid;
        String fromDate, toDate;
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            txtSid.Enabled=false;
            if (!IsPostBack)
            {
                if (Session["utyp"] != "Student")
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                     uid= (int) Session["uid"];
                }
            }
            txtSid.Text = Convert.ToString(Session["ufid"]);
            GetMaxid();
        }

        private void GetMaxid()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select MAX(leaveId) as maxid from tblLeave;", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                maxid = (int)dr["maxid"];
            }
            con.Close();
            id = maxid + 1;
            //throw new NotImplementedException();
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            if (calFrom.SelectedDate < calTo.SelectedDate)
            {
                int flag = 0;
                getDateTime();

                try
                {

                    con.Open();
                    cmd = new SqlCommand("insert into tblLeave values ('" + id + "','" + txtSid.Text + "','" + fromDate + "','" + toDate + "','" + txtReason.Text + "','panding','');", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "Error:" + ex;
                    flag = 1;
                }
                if (flag != 1)
                {
                    Response.Redirect("LeaveHistory.aspx?flag=1");
                }
                else if (flag == 1)
                {
                    Response.Write("Failed To apply");
                }
            }
            else {
                lblMsg.Text = "You selected past date as ToDate";
            }
        }

        private void getDateTime()
        {      
            fromDate = calFrom.SelectedDate.ToShortDateString() + " " + fromTime.Text;
            toDate = calTo.SelectedDate.ToShortDateString()+" " + toTime.Text;
            
            //throw new NotImplementedException();
        }


    }
}