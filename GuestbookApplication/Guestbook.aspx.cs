using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GuestbookApplication
{
    public partial class Guestbook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Submit Button adds a new guestbook entry to the database,
        // clears the form and displays the updated list of guestbook entries
        protected void submitButton_Click(object sender, EventArgs e)
        {
            // use Guestbook Entities DbContext to add a new message
            using ( GuestbookEntities dbcontext = new GuestbookEntities() )
            {
                // create a new Message to add to the database; Message is
                // the entity data model class representing a table row
                Message message = new Message();

                //set new Message's properties
                message.Date = DateTime.Now.ToShortDateString();
                message.Name = nameTextBox.Text;
                message.Email = emailTextBox.Text;
                message.Message1 = messageTextBox.Text;

                // add new Message to GuestbookEntities DbContext
                dbcontext.Messages.Add(message);
                dbcontext.SaveChanges(); // save changes to the database

                outputLabel.Visible = true;
                outputLabel.Text = "Thank you for your submission";
                outputLabel.Text += "<br />We received the folowing information";
                outputLabel.Text += "<br />Name: " + message.Name;
                outputLabel.Text += "<br />Email: " + message.Email;
                outputLabel.Text += "<br />Your Feedback: " + message.Message1;
            }

            //update the gridView with the new database table contents
            messagesGridView.DataBind();
        }

        // Clear button clears the Web Form's TextBoxes
        protected void clearButton_Click(object sender, EventArgs e)
        {
            nameTextBox.Text = String.Empty;
            emailTextBox.Text = String.Empty;
            messageTextBox.Text = String.Empty;
        }
    }
}