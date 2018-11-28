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
            if (!IsPostBack)
            {
                BindOrderGridView();
                BindMenuGridView("Cafe");
            }
        }

        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["swiftServeDB"].ConnectionString;
        }

        #region Bind Menu GridView
        private void BindMenuGridView(String restaurant)
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(GetConnectionString());
            try
            {
                connection.Open();
                string sqlStatement = "SELECT RestaurantName, Name, Price FROM Menu_Items WHERE Visible = TRUE and InStock = TRUE AND RestaurantName = '" + restaurant + "'";
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
                string sqlStatement = "SELECT Orders.OrderID, RestaurantName, MIN(CreationTime) AS CreationTime, 1.13 * SUM(Subtotal) AS Total, MIN(Orders.Status) AS Status "
                    + "FROM Orders, Order_Items, Menu_Items WHERE Orders.CentennialEmail = '" + Session["username"]
                    + "' AND Orders.OrderID = Order_Items.OrderID AND Order_Items.Menu_Item_Name = Menu_Items.Name GROUP BY Orders.OrderID, Menu_Items.RestaurantName";
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
                string sqlStatement = "SELECT Menu_Item_Name, Quantity, Price, Subtotal FROM Order_Items WHERE OrderID = "
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

        protected void RadioButton_CheckedChanged(object sender, EventArgs e)
        {
            string restaurant;

            if (RB_EpicBurger.Checked == true)
            {
                restaurant = "Epic Burger";
            }
            else if (RB_Cafe.Checked == true)
            {
                restaurant = "Main Cafeteria";
            }
            else if (RB_PizzaPizza.Checked == true)
            {
                restaurant = "Pizza Pizza";
            }
            else if (RB_Poutinerie.Checked == true)
            {
                restaurant = "Smoke's Poutinerie";
            }
            else if (RB_Subway.Checked == true)
            {
                restaurant = "Subway";
            }
            else if (RB_Timmies.Checked == true)
            {
                restaurant = "Tim Horton's";
            }
            else
            {
                restaurant = "Main Cafeteria";
            }

            // update the menu
            BindMenuGridView(restaurant);
        }

        protected void OnOrderButtonClicked(Object sender, EventArgs e)
        {
            string parameters = ""; // for the request URL

            foreach (GridViewRow row in MenuGridView.Rows)
            {
                // find the selection from the quantity drop-down list
                int index = ((DropDownList)row.FindControl("QtyList")).SelectedIndex;

                // we want all the items with non-zero quantities
                if (Items[index].Value > 0)
                {
                    parameters += row; // TODO grab information from row cells and generate HTML request parameters for generating order in OrderConfirm.aspx
                }
            }

            //TODO redirect to get the OrderConfirm page, passing along the parameters for the order
        }
    }
}