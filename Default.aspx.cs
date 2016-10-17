using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;


public partial class Admin_Products_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Util.GetConnection());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetProducts();
        }
    }

    void GetProducts()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Products.ProductID, Products.Name, Categories.Category, " +
            " Products.Code, Products.Description, Products.Image, Products.Price, " +
            " Products.IsFeatured, Products.DateAdded, Products.DateModified, Products.Status " +
            " FROM Products INNER JOIN Categories ON Products.CatID = Categories.CatID ";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Products");
        lvProducts.DataSource = ds;
        lvProducts.DataBind();
        con.Close();
    }

    void GetProducts(string keyword)
    {
        con.Open();
        string SQL = "SELECT Products.ProductID, Products.Name, Categories.Category, " +
            "Products.Code, Products.Description, Products.Image, Products.Price, " +
            "Products.IsFeatured, Products.DateAdded, Products.DateModified, Products.Status " +
            "FROM Products INNER JOIN Categories ON Products.CatID = Categories.CatID " +
            "WHERE Products.ProductID LIKE '%" + keyword + "%' OR Products.Name LIKE '%" + keyword + "%' OR" +
            "Categories.Category LIKE '%" + keyword + "%' OR Products.Code LIKE '%" + keyword + "%' OR " +
            "Products.Description LIKE '%" + keyword + "%' OR Products.Price LIKE '%" + keyword + "%'";


        using (SqlCommand cmd = new SqlCommand(SQL, con))
        {
            cmd.Parameters.AddWithValue("@keyword", "%" + keyword + "%");
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataSet ds = new DataSet();
                da.Fill(ds, "Products");

                lvProducts.DataSource = ds;
                lvProducts.DataBind();
            }
        }
    }

    protected void lvProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpProducts.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (txtKeyword.Text == "")
        {
            GetProducts();
        }
        else
        {
            GetProducts(txtKeyword.Text);
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        {
            if (txtKeyword.Text == "")
            {
                GetProducts();
            }
            else
            {
                GetProducts(txtKeyword.Text);
            }
        }

    }

}