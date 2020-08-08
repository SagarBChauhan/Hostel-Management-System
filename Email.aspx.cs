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
using System.Net;
using System.Net.Mail;



namespace final
{
    public partial class Email : System.Web.UI.Page
    {
        String usr,pwd;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
                String EmailAddress = (String)Session["Email"];

                cmd = new SqlCommand("select tblLogin.username ,tblLogin.password from tblStudentRegister inner join tblLogin on tblLogin.uid = tblStudentRegister.userId where tblStudentRegister.email='" + EmailAddress + "';", con);
                con.Open();
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                int a = 0;

                if (dr.Read())
                {
                    Response.Write("<script>alert('Invalid cwe')</script>");
                    a = 1;
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("perfecthostel.in@gmail.com");
                    msg.To.Add(EmailAddress);
                    msg.Subject = "Login to Your Account";
                    msg.Body = "Hello <b>'" + Session["Name"] + "'</b>,<br>Congratulations!<br>  you have Registered your account successfully.<br> Thanks for selecting us.<br> To continue further please sign in using given credential,<br> Your UserName is :<b> " + Session["UserName"] + "</b><br>   Password is:<b>" + Session["pwd"] + "</b><br>  For more information contact us on<br> PerfectHostel.in@gmail.com or<br> Visit: www.PerfectHostel.in <br> Thank you <br> Regards <br> <b>Perfect Hostel<\b>";

                    msg.IsBodyHtml = true;

                    SmtpClient smt = new SmtpClient();
                    smt.Host = "smtp.gmail.com";
                    System.Net.NetworkCredential ntwd = new System.Net.NetworkCredential();
                    ntwd.UserName = "perfecthostel.in@gmail.com";
                    ntwd.Password = "besthostel";
                    smt.UseDefaultCredentials = true;
                    smt.Credentials = ntwd;
                    smt.Port = 587;
                    smt.EnableSsl = true;
                    smt.Send(msg);
                    Session["email"] = EmailAddress;
                    Response.Redirect("RegisterSuccess.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid')</script");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Can not Send Mail <br> Check your connection.');</script>");
            }
            }
        }
        


    }
