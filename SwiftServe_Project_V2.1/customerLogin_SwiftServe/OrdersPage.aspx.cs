using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrdersPage
{
    public partial class OrdersPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (! IsPostBack)
            {
                BindGridView();
            }
        }

        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["swiftServeDB"].ConnectionString;
        }

        #region Bind GridView
        private void BindGridView()
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(GetConnectionString());
            try
            {
                connection.Open();
                string sqlStatement = "SELECT (OrderID, RestaurantName, Creation_Time, Total, Status) FROM Order, Order_Item, Menu_Items WHERE Order.CentennialEmail = '"
                    + Session["username"] + "' AND Order.OrderID = Order_Item.OrderID AND Order_Item.Menu_Item_Name = Menu_Items.Name GROUP BY Order.OrderID";
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                SqlDataAdapter sqlData = new SqlDataAdapter(cmd);

                sqlData.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    OrderGridView.DataSource = dt;
                    OrderGridView.DataBind();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error: ";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                connection.Close();
            }
        }
        #endregion

        protected void OnSelectedIndexChanged(Object sender, EventArgs e)
        {
            int orderID = Convert.ToInt32(OrderGridView.SelectedRow.Cells[0].Text);

            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(GetConnectionString());
            try
            {
                connection.Open();
                string sqlStatement = "SELECT (Menu_Item_Name, Quantity, Price) FROM Order_Item WHERE OrderID = "
                    + orderID + ")";
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                SqlDataAdapter sqlData = new SqlDataAdapter(cmd);

                sqlData.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    OrderItemDetailsView.DataSource = dt;
                    OrderItemDetailsView.DataBind();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error: ";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                connection.Close();
            }
        }

        protected void BtnConfirmOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderConfirm.aspx");
        }
    }
}