using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace final
{
    public partial class PdfGenerator : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label3.Text = Request.QueryString["orderid"];
            Panel1.Visible = true;
            BindData();
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
                lblPymentid2.Text=lblPaymentId.Text = dr["paymentId"].ToString();
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