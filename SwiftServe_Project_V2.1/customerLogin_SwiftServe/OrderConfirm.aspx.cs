using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OrdersPage
{
    public partial class OrderConfirm : System.Web.UI.Page
    {
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
            DataColumn col;
            DataRow row;

            // Menu_Item_Name column
            col = new DataColumn();
            col.DataType = Type.GetType("System.String");
            col.ColumnName = "Menu_Item_Name";
            col.Caption = "Name";
            col.ReadOnly = true;
            col.Unique = true;
            foodTable.Columns.Add(col);

            // Quantity column
            col = new DataColumn();
            col.DataType = Type.GetType("System.Int32");
            col.ColumnName = "Quantity";
            col.Caption = "Quantity";
            col.ReadOnly = true;
            col.Unique = false;
            foodTable.Columns.Add(col);

            // Price column
            col = new DataColumn();
            col.DataType = Type.GetType("System.Double");
            col.ColumnName = "Price";
            col.Caption = "Price";
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
                // TODO

                // populate data table with menu item information and qty
                // TODO

                i++;
            }
        } // Page_Load

        // TODO write method to validate string to guard against SQL injection
        private string validateString(string untrusted)
        {
            string trusted = untrusted;
            
            // not great, better than nothing
            string[] parts = trusted.Split(new char[] {'(',')','[',']',';','*'} );
            trusted = string.Concat(parts);

            return trusted;
        }

    }
}