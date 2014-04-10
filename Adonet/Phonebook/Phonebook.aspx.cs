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
    public partial class Phonebook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //when you want to execute the code only the FIRST time the page is loaded
            if (!IsPostBack)
            {
                FillPersonList();
            }
        }

        private void FillPersonList()
        {
            rptPhonebookTabel.DataSource = PersonsDAL.GetPersons();
            rptPhonebookTabel.DataBind();
        }

        protected void btn_InsertNewPerson_Click(object sender, EventArgs e)
        {
            // when we click the button we will be redirected to new location
            Response.Redirect("InsertPerson.aspx");
        }

        protected void lbtn_Delete_Command(object sender, CommandEventArgs e)
        {
            PersonsDAL.DeletePerson(Convert.ToInt32(e.CommandArgument));
            FillPersonList();
        }
        
    }
}