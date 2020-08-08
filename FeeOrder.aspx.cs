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
    public partial class FeeOrder : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["utyp"] != "Admin")
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {

                }
                Menu.Visible = true;
                Order.Visible = false;
                Status.Visible = false;
                Report.Visible = false;
            }

        }

        protected void btnFeeOrder_Click(object sender, EventArgs e)
        {
            Menu.Visible = false;
            Order.Visible = true;
            getPreFees();
        }

        private void getPreFees()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select * from tblFeeOrder where oid=(Select MAX(oId) from tblFeeOrder);", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtP1Amt.Text =dr["person1"].ToString();
                txtP2Amt.Text =dr["person2"].ToString();
                txtP3Amt.Text =dr["person3"].ToString();
                txtP4Amt.Text =dr["person4"].ToString();
                txtAcAmt.Text =dr["facilityAmt"].ToString();
                txtLastDate.Text =Convert.ToString(dr["endDate"]);
            }
            con.Close();
           // throw new NotImplementedException();
        }

        protected void btnPaymentStatus_Click(object sender, EventArgs e)
        {
            Menu.Visible = false;
            Status.Visible = true;
            Response.Redirect("PaymentStatus.aspx");
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            Menu.Visible = false;
            Report.Visible = true;
            Response.Redirect("Reports.aspx");
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            orderFee();
        }

        private void orderFee()
        {
            con.Open();
            cmd = new SqlCommand("insert into tblFeeOrder values((select MAX(oId) from tblFeeOrder)+1," + txtP1Amt.Text + "," + txtP2Amt.Text + "," + txtP3Amt.Text + "," + txtP4Amt.Text + "," + txtAcAmt.Text + ",'" + txtLastDate.Text + "','"+txtDuration.Text+"' );", con);
            cmd.ExecuteNonQuery();
            con.Close();
            //fillTable();
            //throw new NotImplementedException();
        }

  /*      private void fillTable()
        {
            int[] sArry = new int[1000];
            int i=0;
            SqlDataReader dr;
            cmd = new SqlCommand("select sid from tblStudentRegister inner join tblLogin on tblStudentRegister.userId=tblLogin.uid  where status='Active'; ", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                sArry[i] =Convert.ToInt32( dr["sid"]);
                i=i+1;
            }
            con.Close();
            
            //throw new NotImplementedException();
            foreach (int sid in sArry)
            {
                con.Open();
                cmd = new SqlCommand("insert into tblPaymentMaster values('" + sid + "',0,'Pending');", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }*/
    }
}