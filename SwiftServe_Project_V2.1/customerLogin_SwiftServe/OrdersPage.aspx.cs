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
        // common - replicate this for both pages when splitting placing order from order history (but remove what you don't need)
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrderGridView(); // order history
                BindMenuGridView("Main Cafeteria"); // placing orders
            }
        }

        // common - replicate this for both pages when splitting placing orders from order history
        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["swiftServeDB"].ConnectionString;
        }

        // placing orders
        // this populates the menu for the selected restaurant
        #region Bind Menu GridView
        private void BindMenuGridView(string restaurant)
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection("Data Source=PRIS;Initial Catalog=SwiftServe;Integrated Security=True");
            try
            {
                connection.Open();
                string sqlStatement = "SELECT RestaurantName, Name, Price FROM Menu_Items WHERE Visible = 1 AND InStock = 1 AND RestaurantName = '" + restaurant + "'";
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                SqlDataAdapter sqlData = new SqlDataAdapter(cmd);

                sqlData.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    MenuGridView.DataSource = dt;
                    MenuGridView.DataBind();
                }
            }
            catch (SqlException ex)
            {
                string msg = "Fetch Error: ";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                connection.Close();
            }
        } // BindMenuGridView
        #endregion

        // order history
        #region Bind Order GridView
        private void BindOrderGridView()
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection("Data Source=PRIS;Initial Catalog=SwiftServe;Integrated Security=True");
            try
            {
                connection.Open();
                string sqlStatement = "SELECT Orders.OrderID, Min(RestaurantName) AS RestaurantName, MIN(CreationTime) AS CreationTime, "
                    + "MIN(Semitotal) AS Subtotal, Min(Taxes) AS Tax, MIN(ServiceCharge) AS ServiceFee, MIN(Total) AS Total, MIN(Orders.Status) AS Status "
                    + "FROM Orders, Order_Items WHERE Orders.CentennialEmail = '" + Session["username"]
                    + "' AND Orders.OrderID = Order_Items.OrderID GROUP BY Orders.OrderID";
                SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                SqlDataAdapter sqlData = new SqlDataAdapter(cmd);

                sqlData.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    OrderGridView.DataSource = dt;
                    OrderGridView.DataBind();
                }
            }
            catch (SqlException ex)
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

        // order history
        // this updates the food list gridview to show the food items that are part of the selected row in the order history
        protected void OnSelectedIndexChanged(Object sender, EventArgs e)
        {
            int orderID = Convert.ToInt32(OrderGridView.SelectedRow.Cells[0].Text);

            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection("Data Source=PRIS;Initial Catalog=SwiftServe;Integrated Security=True");
            try
            {
                connection.Open();
                string sqlStatement = "SELECT MenuItemName, Quantity, Price, Subtotal FROM Order_Items WHERE OrderID = "
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
            catch (SqlException ex)
            {
                string msg = "Fetch Error: ";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                connection.Close();
            }
        } // OnSelectedIndexChanged

        // ??? TODO is this actually used anywhere?
        // I think OnOrderButtonClicked is used instead
        //protected void BtnConfirmOrder_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("OrderConfirm.aspx");
        //}

        // placing orders
        // this updates the restaurant selection
        protected void RadioButton_CheckedChanged(object sender, EventArgs e)
        {
            Response.Write("in RadioButton_CheckedChanged");
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
                restaurant = "Smoke''s Poutinerie";
            }
            else if (RB_Subway.Checked == true)
            {
                restaurant = "Subway";
            }
            else if (RB_Timmies.Checked == true)
            {
                restaurant = "Tim Horton''s";
            }
            else
            {
                restaurant = "Main Cafeteria";
            }

            // update the menu
            BindMenuGridView(restaurant);
        } // RadioButton_CheckedChanged

        // placing orders
        // this submits the order details to the OrderConfirm page
        protected void OnOrderButtonClicked(Object sender, EventArgs e)
        {
            string parameters = ""; // for the request URL
            int paramIndex = 1;

            foreach (GridViewRow row in MenuGridView.Rows)
            {
                // find the selection from the quantity drop-down list
                DropDownList Qty = (DropDownList)row.FindControl("QtyList");
                int qty = Convert.ToInt32(Qty.Items[Qty.SelectedIndex].Value);

                // we want all the items with non-zero quantities
                if (qty > 0)
                {
                    // &food1=fish&qty1=1&food2=chips&qty2=1
                    parameters += "&food" + paramIndex + "=" + row.Cells[1].Text + "&qty" + paramIndex + "=" + qty;
                    paramIndex++;
                }
            }

            // do we have any items to purchase at all?
            if(parameters.Length > 0)
            {
                // first parameters in the list are restaurant name and delay time, followed by our list of ingredient-quantity pairs
                parameters = "?restaurant=" + MenuGridView.Rows[0].Cells[0].Text
                           + "&delay=" + DelayDropDownList.Items[DelayDropDownList.SelectedIndex].Value
                           + parameters;
                string request = "OrderConfirm.aspx" + parameters;
                // go to order confirm page
                Response.Redirect(request);
            }
            else
            {
                // TODO hey front-end people, do we want an error message if there's nothing in the order, or just do nothing?
                // TODO add empty text area thingy to put error message in
                string err = "No menu items selected in order.  Please select quantities to order from the drop-down lists.";
            }
        } // OnOrderButtonClicked
    }
}