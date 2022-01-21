using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FakeNewsDetector_ASP.MasterPages
{
    public partial class Login_Page : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\arsla\source\repos\FakeNewsDetector_ASP\FakeNewsDetector_ASP\App_Data\FakeNewsDB.mdf;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Login_click(object sender, EventArgs e)
        {
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Users WHERE CONVERT(VARCHAR,email)='" + email_tbox.Text + "' AND CONVERT(VARCHAR,password)='" + pass_tbox.Text + "'", connection);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                Response.Redirect("Detection.aspx");
            }
            else
            {
                string message = "Wrong credentials";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
        }
        protected void SignUpPage_click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

    }
}