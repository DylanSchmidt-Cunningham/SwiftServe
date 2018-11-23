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
                BindOrderGridView();
                BindMenuGridView();
            }
        }

        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["swiftServeDB"].ConnectionString;
        }

        #region Bind Menu GridView
        private void BindMenuGridView()
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(GetConnectionString());
            try
            {
                connection.Open();
                string sqlStatement = "SELECT RestaurantName, Name, Price FROM Menu_Items WHERE Visible = TRUE and InStock = TRUE"; // AND RestaurantName = '" + Request["restaurantName"] + "'"
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                SqlDataAdapter sqlData = new SqlDataAdapter(cmd);

                sqlData.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    MenuGridView.DataSource = dt;
                    MenuGridView.DataBind();
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

        #region Bind Order GridView
        private void BindOrderGridView()
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(GetConnectionString());
            try
            {
                connection.Open();
                string sqlStatement = "SELECT (OrderID, RestaurantName, Creation_Time, SUM(Subtotal) AS Total, Status) FROM Orders, Order_Items, Menu_Items WHERE Orders.CentennialEmail = '"
                    + Session["username"] + "' AND Orders.OrderID = Order_Items.OrderID AND Order_Items.Menu_Item_Name = Menu_Items.Name GROUP BY Orders.OrderID";
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
                string sqlStatement = "SELECT (Menu_Item_Name, Quantity, Price, Subtotal) FROM Order_Items WHERE OrderID = "
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