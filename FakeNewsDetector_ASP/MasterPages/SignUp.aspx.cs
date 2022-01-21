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
    public partial class SignUp_page : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\arsla\source\repos\FakeNewsDetector_ASP\FakeNewsDetector_ASP\App_Data\FakeNewsDB.mdf;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            connection.Open();
        }
        protected void Signup_click(object sender, EventArgs e)
        {
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Users WHERE CONVERT(VARCHAR,email)='" + email_tbox.Text + "' AND CONVERT(VARCHAR,password)='" + pass_tbox.Text + "'", connection);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                string message = "User Alredy Exists";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
            else
            {
                var command = new SqlCommand("INSERT INTO Users VALUES (@email,@name,@password);", connection);
                command.Parameters.AddWithValue("@email", email_tbox.Text);
                command.Parameters.AddWithValue("@name", name_tbox.Text);
                command.Parameters.AddWithValue("@password", pass_tbox.Text);
                command.ExecuteNonQuery();
                connection.Close();
                string message = "Your details have been saved successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
        }
        protected void LoginPage_click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}