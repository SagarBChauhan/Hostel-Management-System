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
    public partial class PayDiposite : System.Web.UI.Page
    {
        int  paymentCount = 0;
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            hlLogin.Visible = false;
            btnPay.Visible = true;
            txtAmount.Text = "5000";
            Panel1.Visible = true;
            PrintRecipt.Visible = false;
            checkFeeStatus();
            BindData();
            if (!IsPostBack)
            {
                
                if (Session["utyp"] != "Student")
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblUser.Text =(String) Session["uname"];
                }
            }
        }
        private void checkFeeStatus()
        {

            SqlDataReader dr;
            cmd = new SqlCommand("select COUNT(*) as count from tblDipositePayment where studentId='" + Session["ufid"] + "' ;", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                paymentCount = (int)dr["count"];
            }
            con.Close();
            if (paymentCount == 0)
            {
                Response.Write("<script>alert('Pay Diposite to Activate Account..');</script>");
                Panel1.Visible = true;
                PrintRecipt.Visible = false;
            }
            else
            {
                PrintRecipt.Visible = true;
                Panel1.Visible = false;
            }
        }
        protected void btnPay_Click(object sender, EventArgs e)
        {
            
            Payment();
            
            if (txtAmount.Text == "5000")
            {
                txtAmount.ForeColor = System.Drawing.Color.Black;
                ActiveAccount();
            }
            else
            {
                txtAmount.ForeColor =System.Drawing.Color.Red;
            }
        }

        private void Payment()
        {
            con.Open();
            cmd = new SqlCommand("insert into tblDipositePayment values ((select MAX(dPaymentId) from tblDipositePayment)+1," + txtAmount.Text + ",'" + DropDownList1.SelectedValue + "','" + txtBankNo.Text + "',(select adminBankName from tblDipositePayment where dPaymentId=0),(select adminAccountNo from tblDipositePayment where dPaymentId=0),'" + DateTime.Today + "','" + Session["ufid"] + "');", con);
            cmd.ExecuteNonQuery();
            con.Close();
            //throw new NotImplementedException();
        }

        private void ActiveAccount()
        {
            try
            {
                con.Open();
                cmd = new SqlCommand("update tblLogin set status='Active' Where uid='" + Session["uid"] + "';", con);
                cmd.ExecuteNonQuery();
                con.Close();
                lblMsg.Text = "Account Activated Successfully" ;
                btnPay.Visible = false;
                hlLogin.Visible = true;
                Panel1.Visible = false;
                PrintRecipt.Visible = true;
            }
            catch (Exception ex)
            {
                lblMsg.Text += "Error :" + ex;
            }
            //throw new NotImplementedException();
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
            cmd = new SqlCommand("select fName+' '+ mName+' '+lName as Name,department,totalAmont,bankName,accountNo,date,dpaymentId from tblStudentRegister inner join tblDipositePayment on tblDipositePayment.studentId=tblStudentRegister.sid where sid='" + Session["ufid"] + "'; ", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblPymentid2.Text = lblPaymentId.Text = dr["dpaymentId"].ToString();
                lblName.Text = dr["Name"].ToString();
                lblDepartment.Text = dr["department"].ToString();
                lblBankName.Text = dr["bankName"].ToString();
                lblTotal.Text = dr["totalAmont"].ToString();
                lblBankNO.Text = dr["accountNo"].ToString();

                lblDate.Text = dr["date"].ToString();

            }
            con.Close();
        }

        public DataTable getPaymentData()
        {
            cmd = new SqlCommand("select 'Deposite ' as Perticular,totalAmont as Total from tblDipositePayment where studentId='" + Session["ufid"] + "'; ", con);
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
    }
}