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
    public partial class OrderConfirm : System.Web.UI.Page
    {
        // this should probably be in app.config or something
        // TODO migrate TAX_RATE to app.config or something
        private const double TAX_RATE = 0.13;

        protected void Page_Load(object sender, EventArgs e)
        {
            // parse that query string!
            // ?restaurant=foo&delay=bar&food1=fish&qty1=1&food2=chips&qty2=1
            string restaurant = Request.QueryString["restaurant"];
            int delay = Convert.ToInt32(Request.QueryString["delay"]);
            // validate params
            restaurant = validateString(restaurant);
            delay = Math.Max(delay, 20); // at least 20
            delay = Math.Min(delay, 60); // at most 60

            // create table to hold query results for our GridView
            DataTable foodTable = new DataTable("FoodTable");
            DataTable orderTable = new DataTable("OrderTable");
            DataColumn col;
            DataRow row;

            // build foodTable's columns

            // Menu_Item_Name column
            col = new DataColumn();
            col.DataType = Type.GetType("System.String");
            col.ColumnName = "Menu_Item_Name";
            col.Caption = "Name";
            col.ReadOnly = true;
            col.Unique = true;
            foodTable.Columns.Add(col);

            // Price column
            col = new DataColumn();
            col.DataType = Type.GetType("System.Double");
            col.ColumnName = "Price";
            col.Caption = "Price";
            col.ReadOnly = true;
            col.Unique = false;
            foodTable.Columns.Add(col);

            // Quantity column
            col = new DataColumn();
            col.DataType = Type.GetType("System.Int32");
            col.ColumnName = "Quantity";
            col.Caption = "Quantity";
            col.ReadOnly = true;
            col.Unique = false;
            foodTable.Columns.Add(col);

            // Subtotal column
            col = new DataColumn();
            col.DataType = Type.GetType("System.Double");
            col.ColumnName = "Subtotal";
            col.Caption = "Subtotal";
            col.ReadOnly = true;
            col.Unique = false;
            foodTable.Columns.Add(col);

            // build orderTable's columns

            // RestaurantName column
            col = new DataColumn();
            col.DataType = Type.GetType("System.String");
            col.ColumnName = "RestaurantName";
            col.Caption = "Restaurant";
            col.ReadOnly = true;
            col.Unique = false;
            orderTable.Columns.Add(col);

            // DelayTime column
            col = new DataColumn();
            col.DataType = Type.GetType("System.Int32");
            col.ColumnName = "DelayTime";
            col.Caption = "Delivery Time";
            col.ReadOnly = true;
            col.Unique = false;
            orderTable.Columns.Add(col);

            // Semitotal column
            col = new DataColumn();
            col.DataType = Type.GetType("System.Double");
            col.ColumnName = "Semitotal";
            col.Caption = "Subtotal";
            col.ReadOnly = true;
            col.Unique = false;
            orderTable.Columns.Add(col);

            // Taxes column
            col = new DataColumn();
            col.DataType = Type.GetType("System.Double");
            col.ColumnName = "Taxes";
            col.Caption = "Tax";
            col.ReadOnly = true;
            col.Unique = false;
            orderTable.Columns.Add(col);

            // ServiceCharge column
            col = new DataColumn();
            col.DataType = Type.GetType("System.Double");
            col.ColumnName = "ServiceCharge";
            col.Caption = "Service Fee";
            col.ReadOnly = true;
            col.Unique = false;
            orderTable.Columns.Add(col);

            // Total column
            col = new DataColumn();
            col.DataType = Type.GetType("System.Double");
            col.ColumnName = "Total";
            col.Caption = "Total Cost";
            col.ReadOnly = true;
            col.Unique = false;
            orderTable.Columns.Add(col);

            // keep track of price total
            double semiTotal = 0.0;

            // now the databasey stuff
            SqlConnection connection = new SqlConnection(GetConnectionString());

            try
            {
                connection.Open();

                // loop through all the food and qty pairs in query string, query the database for price
                // and insert the information into our foodTable
                // (we don't trust the query string to contain price as well because a user could hand-craft a string for free lunch)
                int i = 1;
                while (true)
                {
                    string food = Request.QueryString["food" + i];
                    if (food == null) break; // end of query params
                    int qty = Convert.ToInt32(Request.QueryString["qty" + i]);
                    // validate params
                    food = validateString(food);
                    qty = Math.Max(qty, 1); // minimum 1

                    // query database for menu item information
                    string sqlStatement = "SELECT Price FROM Menu_Items WHERE RestaurantName = '" + restaurant + "' AND Name = '" + food + "'";
                    SqlCommand cmd = new SqlCommand(sqlStatement, connection);
                    SqlDataAdapter sqlData = new SqlDataAdapter(cmd);
                    DataTable temp = new DataTable();

                    sqlData.Fill(temp); // should only be one row due to RestaurantName + Name uniqueness
                    if (temp.Rows.Count > 0)
                    {
                        double price = Convert.ToDouble(temp.Rows[0].ItemArray[0]);

                        // populate data table with menu item information and qty
                        row = foodTable.NewRow();
                        row["Name"] = food;
                        row["Price"] = price;
                        row["Quantity"] = qty;
                        row["Subtotal"] = price * qty;

                        foodTable.Rows.Add(row);

                        // update running total for order
                        semiTotal += price * qty;
                    }
                    else
                    {
                        // no such menu_item, no such code
                        // I sincerely hope it wasn't peanut-butter and banana sandwiches
                        // TODO hey front-end people!  Do you want to display an error message?
                    }

                    // advance to check next parameter pair in query string
                    i++;
                }

                // foodTable is full, now bind it to the OrderItemsView
                if (foodTable.Rows.Count > 0)
                {
                    OrderItemsView.DataSource = foodTable;
                    OrderItemsView.DataBind();
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

            // pre-calculate values for orderTable
            double tax = semiTotal * TAX_RATE;
            double fee = calculateServiceCharge(semiTotal);
            double total = semiTotal + tax + fee;

            // order information
            row = orderTable.NewRow();
            row["RestaurantName"] = restaurant;
            row["DelayTime"] = delay;
            row["Semitotal"] = semiTotal;
            row["Taxes"] = tax;
            row["ServiceCharge"] = fee;
            row["Total"] = total;
            orderTable.Rows.Add(row);

            // bind order information to the GridView
            OrderSummaryGridView.DataSource = orderTable;
            OrderSummaryGridView.DataBind();

        } // Page_Load

        // validate string to guard against SQL injection
        private string validateString(string untrusted)
        {
            string trusted = untrusted;
            
            // not great, better than nothing
            string[] parts = trusted.Split(new char[] {'(',')','[',']',';','*'} );
            trusted = string.Concat(parts).Replace("'", "''");

            return trusted;
        }

        // get our database connection string from Web.config
        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["swiftServeDB"].ConnectionString;
        }

        // calculate how much we charge for use of our service
        private double calculateServiceCharge(double baseCost)
        {
            // I was told we're charging 13%, please correct if this is wrong
            // TODO final service charge formula
            return 0.13 * baseCost;
        }

    }
}