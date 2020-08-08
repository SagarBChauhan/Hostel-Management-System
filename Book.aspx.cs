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
    public partial class Book : System.Web.UI.Page
    {
        StringBuilder table = new StringBuilder();
        int count;
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(@"Data Source=SAGAR\SAGAR;Initial Catalog=HMS;Integrated Security=True");
        SqlDataAdapter da;
        DataTable dt;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            getBookingStatus();
            getRoomStudentData();
           // Booking.Visible = false;

            
            if (!IsPostBack)
            {
                getRoomateInfo();
                if (Session["utyp"] != "Student")
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    fillDropdownRoomType();
                    fillDropdownRoomName("select * from tblRoomMaster where status='Available';");
                }
            }
            getMaxid();
        }

        private void getRoomateInfo()
        {       
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select tblStudentRegister.fName+' '+ tblStudentRegister.mName+' '+tblStudentRegister.lName as Name,tblStudentRegister.contact,tblStudentRegister.sid from tblStudentRegister inner join tblRoomAllocation on tblStudentRegister.sid =tblRoomAllocation.studentId where roomId= (select roomId from tblRoomAllocation where studentId='"+Session["ufid"]+"');";
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            table.Append("<table border='1' style='color:Black;'>");
            table.Append("<tr style='background-color: #70AD47;'><th style='color: #FFFFFF;'>Name</th><th style='color: #FFFFFF;'>Contact</th><th style='color: #FFFFFF;'>Action</th></tr>");
            
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    table.Append("<tr style='background-color: #C5E0B3;'>");
                    table.Append("<td>" + dr[0] + "</td>");
                    table.Append("<td>" + dr[1] + "</td>");
                    table.Append("<td><a href='ViewProfile.aspx?id=" + dr[2] + "'>Display</a></td>");
                    table.Append("</tr>");
                }
            }
            table.Append("</table>");
            con.Close();
            PlaceHolder1.Controls.Add(new Literal {Text = table.ToString()});
            //throw new NotImplementedException();
        }

        private void getRoomStudentData()
        {
            try
            {
                SqlDataReader dr;
                cmd = new SqlCommand("select tblRoomType.* ,tblRoomAllocation.* from tblRoomType inner join tblRoomAllocation on tblRoomType.rtId=tblRoomAllocation.roomTypeId where studentId='" + Session["ufid"] + "';", con);
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblType.Text = (string)dr["roomType"];
                }
                con.Close();
                SqlDataReader dr1;
                cmd = new SqlCommand("select tblRoomMaster.* , tblRoomAllocation.* ,tblStudentRegister.* from tblStudentRegister inner join tblRoomAllocation inner join tblRoomMaster on tblRoomAllocation.roomId = tblRoomMaster.roomId on tblStudentRegister.sid =tblRoomAllocation.studentId where studentId='" + Session["ufid"] + "';", con);
                con.Open();
                dr1 = cmd.ExecuteReader();
                if (dr1.Read())
                {
                    lblRoomNo.Text = (string)dr1["roomName"];
                    lblNoOfBed.Text = dr1["noOfBed"].ToString();
                    lblAvailBed.Text = dr1["availableBed"].ToString();
                    lblName.Text = (string)dr1["fName"] + " " + dr1["mName"] + " " + dr1["lName"];
                }
                con.Close();
            }
            catch (Exception ex)
            { 
            
            }
            //throw new NotImplementedException();
        }
        private void getBookingStatus()
        {

            SqlDataReader dr;
            cmd = new SqlCommand("select count(*) as count from tblRoomAllocation where studentId='" + Session["ufid"] + "';", con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                count = (int)dr["count"];
            }
            con.Close();
            Label1.Text = count.ToString();
            if (count >= 1)
            {
                Booking.Visible = false;
                success.Visible = true;
            }
            else if (count==0)
            {
                Booking.Visible = true;
                success.Visible = false;
            }
            // throw new NotImplementedException();
        }

        private void getMaxid()
        {
            int maxid=0;
            SqlDataReader dr;
            cmd = new SqlCommand("Select max(id) as maxid from tblRoomAllocation;",con);
            con.Open();
            dr=cmd.ExecuteReader();
            if (dr.Read())
            {
                maxid =(Int32) dr["maxid"];
            }
            con.Close();
            id = maxid + 1;
            //throw new NotImplementedException();
        }

        private void fillDropdownRoomName(String q)
        {
            dlRoomName.DataSource = getRoomName(q);
            dlRoomName.DataTextField = "roomName";
            dlRoomName.DataValueField = "roomId";
            dlRoomName.DataBind();
        }

        private void fillDropdownRoomType()
        {
            dlRoomType.DataSource = getRoomType();
            dlRoomType.DataTextField = "roomType";
            dlRoomType.DataValueField = "rtId";
            dlRoomType.DataBind();
        }

        public DataTable getRoomType()
        {
            cmd = new SqlCommand("select * from tblRoomType;", con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
            //throw new NotImplementedException();
        }

        public DataTable getRoomName(string q)
        {
            cmd = new SqlCommand(q,con);
            da = new SqlDataAdapter(cmd);
            dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        protected void dlNoOfBed_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dlNoOfBed.SelectedValue == "1")
            {

                fillDropdownRoomName("select * from tblRoomMaster where noOfBed=1 and status='Available';");
            }
            else if (dlNoOfBed.SelectedValue == "2")
            {
                
                fillDropdownRoomName("select * from tblRoomMaster where noOfBed=2 and status='Available';");
            }
            else if (dlNoOfBed.SelectedValue == "3")
            {
                
                fillDropdownRoomName("select * from tblRoomMaster where noOfBed=3 and status='Available';");
            }
            else if (dlNoOfBed.SelectedValue == "4")
            {
                
                fillDropdownRoomName("select * from tblRoomMaster where noOfBed=4 and status='Available';");
            }
        }

        protected void dlRoomType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dlRoomType.SelectedIndex == 0)
            {
                fillDropdownRoomName("select * from tblRoomMaster where noOfBed='" + dlNoOfBed.SelectedValue + "' and roomType=1 and status='Available';");
            }
            else if (dlRoomType.SelectedIndex == 1)
            {
                fillDropdownRoomName("select * from tblRoomMaster where noOfBed='" + dlNoOfBed.SelectedValue + "' and roomType=2 and status='Available';");
            }
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (count >= 1)
            {
                Booking.Visible = false;
                success.Visible = true;
            }
            else if (count == 0)
            {
                try
                {
                    int available = 0;
                    Label1.Text = "id:" + id + " room type id:" + dlRoomType.SelectedValue + " room id:" + dlRoomName.SelectedValue + " student id:" + Session["ufid"];
                    con.Open();
                    cmd = new SqlCommand("insert into tblRoomAllocation values('" + id + "','" + dlRoomType.SelectedValue + "','" + dlRoomName.SelectedValue + "','" + Session["ufid"] + "');", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    con.Open();
                    cmd = new SqlCommand("update tblRoomMaster set availableBed=availableBed-1 where roomId='" + dlRoomName.SelectedValue + "';", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    lblRoomNo.Text = dlRoomName.Text;
                    SqlDataReader dr;
                    cmd = new SqlCommand("select max(availableBed) as available from tblRoomMaster where roomId='" + dlRoomName.SelectedValue + "';", con);
                    con.Open();
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        available = (Int32)dr["available"];
                    }
                    con.Close();
                    if (available <= 0)
                    {
                        String b = "Booked";
                        con.Open();
                        cmd = new SqlCommand("update tblRoomMaster set status='" + b + "' where roomId='" + dlRoomName.SelectedValue + "';", con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    getRoomStudentData();
                    getRoomateInfo();
                    btnBook.Visible = false;
                    Booking.Visible = false;
                    success.Visible = true;
                }
                catch (Exception ex)
                {

                }
            }

        }
    }
}