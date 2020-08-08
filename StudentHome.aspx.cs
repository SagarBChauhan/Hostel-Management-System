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
    public partial class StudentHome : System.Web.UI.Page
    {
        int count,paymentCount,TotalAmt;
        string lastDate = "";
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            FeesAlert.Visible = false;
            getBookingStatus();
            checkFeeStatus();
            if (!IsPostBack)
            {
                if (Session["utyp"] != "Student")
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblUser.Text =(string) Session["uname"];
                }
            }
            SqlDataReader dr;
            cmd = new SqlCommand("select * from tblStudentRegister where sid='" + Session["ufid"] + "';", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblName.Text = Convert.ToString(dr["fName"]) + " " + Convert.ToString(dr["mName"] + " " + Convert.ToString(dr["lName"]));
                lblAddress.Text = Convert.ToString(dr["Address"]) + ", " + Convert.ToString(dr["City"]) + " - " + Convert.ToString(dr["pincode"]);
                lblDob.Text = Convert.ToString(dr["DOB"]);
                lblGender.Text = Convert.ToString(dr["gender"]);
                lblContact.Text = Convert.ToString(dr["contact"]);
                lblParantsContact.Text = Convert.ToString(dr["perentContact"]);
                lblDepartment.Text = Convert.ToString(dr["department"]);
                lblEmail.Text = Convert.ToString(dr["email"]);
                lblMother.Text = Convert.ToString(dr["motherName"]);
                lblFather.Text = Convert.ToString(dr["fatherName"]);
                lblUserName.Text = (string)Session["uname"];
            }
            con.Close();
        }

        private void checkFeeStatus()
        {
            int roomType=0, noOfBed=0;
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
                Response.Write("<script>alert('Your fee payment is Pending..');</script>");
                FeesAlert.Visible = true;
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
                    lblLastDate.Text = dr2["endDate"].ToString();
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
                    lblTotalAmt.Text = TotalAmt.ToString();
                }
                con.Close();
            }

            //throw new NotImplementedException();
        }

        private void getBookingStatus()
        {

            SqlDataReader dr;
            cmd = new SqlCommand("select count(*) as count from tblRoomAllocation where studentId='"+Session["ufid"]+"';", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                count = (int)dr["count"];
            }
            con.Close();
            if (count == 0)
            {
                RoomBook.Visible = true;
            }
            else {
                RoomBook.Visible = false;
            }
           // throw new NotImplementedException();
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx");
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            Response.Redirect("payFees.aspx");
        }
       
    }
}