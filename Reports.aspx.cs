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
    public partial class Reports : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            Report.Visible = false;
            if (!IsPostBack)
            {

                if (Session["utyp"] != "Admin")
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    
                }
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

            exportpdf();
        }

        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Report.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel2.RenderControl(hw);
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

        protected void btnFeeReport_Click(object sender, EventArgs e)
        {
            lblReportTitle.Text = "Fee Report";
            BindFeeReportData();
            getFeeReportFormetingData();
        }
        private void BindFeeReportData()
        {
            Report.Visible = true;
            Menu.Visible = false;
            gvReport.DataSource = getPaymentData();
            gvReport.DataBind();
        }
        public DataTable getPaymentData()
        {
            cmd = new SqlCommand("select fName+' '+ mName+' '+lName as Name,bankName,accountNo,date from tblStudentRegister inner join tblPayment on tblPayment.studentId=tblStudentRegister.sid; ", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        private void getFeeReportFormetingData()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select COUNT(*) as count from tblPayment; ", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblTotal.Text = " Student Paid Fees:"+dr["count"].ToString();
            }
            con.Close();
            lblDate.Text = DateTime.Now.ToString();
            lblDataTitle.Text = "Fees paid by below students:";
        }


        protected void btnAllocationReport_Click(object sender, EventArgs e)
        {
            lblReportTitle.Text = "Allocation Report";
            Report.Visible = true;
            Menu.Visible = false;
            BindAllocationReportData();
            getAllocationReportFormetingData();
        }
        private void BindAllocationReportData()
        {
            gvReport.DataSource = getAllocationData();
            gvReport.DataBind();
        }
        public DataTable getAllocationData()
        {
            cmd = new SqlCommand("select fName+''+mName+''+lName as Name,roomName,tblRoomType.roomType,noOfBed,availableBed,status from tblStudentRegister inner join tblRoomAllocation on tblStudentRegister.sid = tblRoomAllocation.studentId inner join tblRoomMaster on tblRoomAllocation.roomId = tblRoomMaster.roomId inner join tblRoomType on tblRoomType.rtId = tblRoomAllocation.roomTypeId;", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        private void getAllocationReportFormetingData()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select COUNT(*) as count,(select COUNT(*) from tblRoomMaster where status='Available') as Available,(select SUM(availableBed) from tblRoomMaster) as AvailableBed,(select COUNT(*) from tblRoomMaster where status='Booked') as Booked from tblStudentRegister inner join tblRoomAllocation on tblStudentRegister.sid = tblRoomAllocation.studentId inner join tblRoomMaster on tblRoomAllocation.roomId = tblRoomMaster.roomId inner join tblRoomType on tblRoomType.rtId = tblRoomAllocation.roomTypeId", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblTotal.Text = " Allocted Room:" + dr["count"].ToString() + "<br/> Total Available Rooms:" + dr["Available"].ToString() + "<br/> Total Booked Rooms:" + dr["Booked"].ToString() + "<br/> Available Beds:" + dr["AvailableBed"].ToString();
            }
            con.Close();
            lblDate.Text = DateTime.Now.ToString();
            lblDataTitle.Text = "Rooms Allocated By student students:";
        }
        protected void btnLeaveReport_Click(object sender, EventArgs e)
        {
            lblReportTitle.Text = "Leave Report";
            Report.Visible = true;
            Menu.Visible = false;
            BindLeaveReportData();
            getLeaveReportFormetingData();
        }
        private void BindLeaveReportData()
        {
            gvReport.DataSource = getLeaveData();
            gvReport.DataBind();
        }
        public DataTable getLeaveData()
        {
            cmd = new SqlCommand("select fName+' '+ mName+' '+lName as Name,leaveFrom as From_,leaveTo as To_,reason,status from tblStudentRegister inner join tblLeave on tblLeave.studentId=tblStudentRegister.sid; ", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        private void getLeaveReportFormetingData()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select COUNT(*) as count,(select COUNT(*) from tblLeave where status='Accepted') as Approved,(select COUNT(*) from tblLeave where status='Rejected') as Rejected,(select COUNT(*) from tblLeave where status='panding') as panding from tblLeave; ", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblTotal.Text = " Applied Leaves:" + dr["count"].ToString() + "<br/>  Approved Leaves:" + dr["Approved"].ToString() + "<br/> Rejected Leaves:" + dr["Rejected"].ToString() + "<br/> panding Leaves:" + dr["panding"].ToString();
            }
            con.Close();
            lblDate.Text = DateTime.Now.ToString();
            lblDataTitle.Text = "Leaves Appiled By Students:";
        }

        protected void btnComplainReport_Click(object sender, EventArgs e)
        {
            lblReportTitle.Text = "Complain Report";
            Report.Visible = true;
            Menu.Visible = false;
            BindComplainReportData();
            getComplainReportFormetingData();
        }
        private void BindComplainReportData()
        {
            gvReport.DataSource = getComplainData();
            gvReport.DataBind();
        }
        public DataTable getComplainData()
        {
            cmd = new SqlCommand("select fName+' '+ mName+' '+lName as Name,complain,complainDate,contact from tblComplain inner join tblStudentRegister on tblComplain.studentId = tblStudentRegister.sid;", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        private void getComplainReportFormetingData()
        {
            SqlDataReader dr;
            cmd = new SqlCommand("select COUNT(*) as count from tblComplain ;", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblTotal.Text = " Reported Complains:" + dr["count"].ToString() ;
            }
            con.Close();
            lblDate.Text = DateTime.Now.ToString();
            lblDataTitle.Text = "Reported Complains:";
        }
    }
}