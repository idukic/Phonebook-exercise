using Phonebook.DAL;
using Phonebook.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Phonebook
{
    public partial class EditNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PhoneNumber pn = PhoneNumbersDAL.GetNumber(Convert.ToInt32(Request.QueryString["id"]));
                tb_PhoneNumber.Text = pn.PNumber;
            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            PhoneNumber pn = PhoneNumbersDAL.GetNumber(Convert.ToInt32(Request.QueryString["id"]));
            pn.PNumber = tb_PhoneNumber.Text;

            PhoneNumbersDAL.UpdateNumber(pn);

            Response.Redirect("PhoneNumbers.aspx?id=" + pn.PersonID);
        }
    }
}