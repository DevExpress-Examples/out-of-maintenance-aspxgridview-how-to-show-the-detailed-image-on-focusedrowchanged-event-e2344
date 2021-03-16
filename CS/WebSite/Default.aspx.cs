using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e) {
        if (!string.IsNullOrEmpty(Request.Params["Photo"])) {
            PostImage(Request.Params["Photo"]);
        }
    }

    void PostImage(string id) {
        byte[] image = FindImage(id);
        WriteBinaryImage(image);
    }
    void WriteBinaryImage(byte[] image)  {
        if (image != null) {
            Response.ContentType = "image/bmp";
            using (MemoryStream ms = new MemoryStream(image, 78, image.Length - 78)) {
                using (Bitmap bmp = (Bitmap)Bitmap.FromStream(ms)) {
                    bmp.Save(Response.OutputStream, ImageFormat.Jpeg);
                }
                Response.BinaryWrite(image);
            }
        }
        else {
            Response.ContentType = "image/gif";
        }
        Response.End();
    }
    byte[] FindImage(string id) {
        string queryString = "SELECT [Photo] FROM [Employees] WHERE [EmployeeID] = " + id;
        DataTable dt = new DataTable();

        using (SqlConnection connection = new SqlConnection("Data Source=(local);Initial Catalog=Northwind;Integrated Security=True")) {
            SqlCommand command = new SqlCommand(queryString, connection);
            connection.Open();
            
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = command;
            da.Fill(dt);
        }
        if (dt.Rows.Count > 0)
            return dt.Rows[0][0] as byte[];
        return null;

     
    }

}
