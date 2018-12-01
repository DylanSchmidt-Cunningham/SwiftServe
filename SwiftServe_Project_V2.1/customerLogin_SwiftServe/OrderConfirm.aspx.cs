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
            // validate restaurant name against SQL injection - TODO
            // validate delay
            delay = Math.Max(delay, 20); // at least 20
            delay = Math.Min(delay, 60); // at most 60

            // create table to hold query results for our GridView
            DataTable foodTable = new DataTable("FoodTable");
            // add columns TODO

            int i = 1;
            while (true)
            {
                string food = Request.QueryString["food" + i];
                if (food == null) break; // end of query params
                int qty = Convert.ToInt32(Request.QueryString["qty" + i]);
                // validate params
                // validate food name against SQL injection - TODO
                qty = Math.Max(qty, 1); // minimum 1

                // query database for menu item information
                // TODO

                // populate data table with menu item information and qty
                // TODO

                i++;
            }
        }
    }
}