using System;
using System.Collections.Generic;
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

            int i = 1;
            
            while (true)
            {
                string food = Request.QueryString["food" + i];
                if (food == null) break; // end of query params
                int qty = Convert.ToInt32(Request.QueryString["qty" + i]);

                // query database for menu item information
                // TODO

                // populate data table with menu item information and qty
                // TODO

                i++;
            }
        }
    }
}