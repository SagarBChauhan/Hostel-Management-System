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
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace final
{
    public partial class payFees : System.Web.UI.Page
    {
        int roomType = 0, noOfBed = 0, paymentCount = 0, TotalAmt = 0;
        string duration="";
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            checkFeeStatus();
            //Payment.Visible = false;
            //PrintRecipt.Visible = false;
            //Success.Visible = false;
            Panel1.Visible = true;
            BindData();
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
        }
        private void checkFeeStatus()
        {
            
            SqlDataReader dr;
            cmd = new SqlCommand("select COUNT(*) as count from tblPayment where studentId='" + Session["ufid"] + "' and FeeDuration=(select Duration from tblFeeOrder where oid= (select MAX(oid) from tblFeeOrder));", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                paymentCount = (int)dr["count"];
            }
            con.Close();
            if (paymentCount == 0)
            {
                
                Payment.Visible = true;
                PrintRecipt.Visible = false;
                Success.Visible = false;
                SqlDataReader dr1;
                cmd = new SqlCommand("select roomType,noOfBed from tblRoomMaster inner join tblRoomAllocation on tblRoomAllocation.roomId =tblRoomMaster.roomId where studentId='" + Session["ufid"] + "';", con);
                con.Open();
                dr1 = cmd.ExecuteReader();
                if (dr1.Read())
                {
                    roomType = (int)dr1["roomType"];
                    noOfBed = (int)dr1["noOfBed"];
                }
                con.Close();

                SqlDataReader dr2;
                cmd = new SqlCommand("select * from tblFeeOrder ;", con);
                con.Open();
                dr2 = cmd.ExecuteReader();
                if (dr2.Read())
                {
                    
                    if (noOfBed == 1)
                    {
                        TotalAmt = (int)dr2["person1"];
                    }
                    else if (noOfBed == 2)
                    {
                        TotalAmt = (int)dr2["person2"];
                    }
                    else if (noOfBed == 3)
                    {
                        TotalAmt = (int)dr2["person3"];
                    }
                    else if (noOfBed == 4)
                    {
                        TotalAmt = (int)dr2["person4"];
                    }

                    if (roomType == 1)
                    {
                        TotalAmt = TotalAmt + (int)dr2["facilityAmt"];
                    }
                    lblAmt.Text = TotalAmt.ToString();
                    duration = dr2["Duration"].ToString();
                }
                con.Close();
            }
            else 
            {
                
                Payment.Visible = false;
                Success.Visible = false;
                PrintRecipt.Visible = true;
            }
            SqlDataReader dr4;
            cmd = new SqlCommand("select * from tblPayment where paymentId=0;", con);
            con.Open();
            dr4 = cmd.ExecuteReader();
            if (dr4.Read())
            {
                lblAdBankName.Text = dr4["adminBankName"].ToString();
                lblAdBankNo.Text = dr4["adminAccountNo"].ToString();
            }
            con.Close();
            //throw new NotImplementedException();
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd = new SqlCommand("insert into tblPayment values ((select MAX(paymentId) from tblPayment)+1," + lblAmt.Text + ",'" + DropDownList1.SelectedValue+ "','" + txtACNumber.Text + "',(select adminBankName from tblPayment where paymentId=0),(select adminAccountNo from tblPayment where paymentId=0),'"+DateTime.Today+"','" + duration + "','" +Session["ufid"]+ "');", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Payment.Visible = false;
            Success.Visible = true;
        }

        protected void btnRecipt_Click(object sender, EventArgs e)
        {
            PrintRecipt.Visible = true;
            Success.Visible = false;
        }
        private void BindData()
        {
            GridView1.DataSource = getPaymentData();
            GridView1.DataBind();
            getFormetingData();
        }

        private void getFormetingData()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select fName+' '+ mName+' '+lName as Name,department,totalAmont,bankName,accountNo,FeeDuration,date,paymentId from tblStudentRegister inner join tblPayment on tblPayment.studentId=tblStudentRegister.sid where sid='" + Session["ufid"] + "'; ", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblPymentid2.Text = lblPaymentId.Text = dr["paymentId"].ToString();
                lblName.Text = dr["Name"].ToString();
                lblDepartment.Text = dr["department"].ToString();
                lblBankName.Text = dr["bankName"].ToString();
                lblTotal.Text = dr["totalAmont"].ToString();
                lblBankNO.Text = dr["accountNo"].ToString();
                lblDuration.Text = dr["FeeDuration"].ToString();
                lblDate.Text = dr["date"].ToString();

            }
            con.Close();
        }

        public DataTable getPaymentData()
        {
            cmd = new SqlCommand("select 'Hostel Rent for '+FeeDuration as Perticular,totalAmont as Total from tblPayment where studentId='" + Session["ufid"] + "'; ", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {

            exportpdf();
        }

        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=FeeRecipt.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}