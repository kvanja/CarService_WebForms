using CarRegistration.Models;
using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Web;

namespace CarRegistration {
    public partial class Login1 : System.Web.UI.Page {

        private ApiConnection apiConnection = new ApiConnection();

        protected void Page_Load(object sender, EventArgs e) {
            if (Context.Request.Cookies["CarOwnerData"] != null) {
                LoggedIn.InnerText = "You're already logged in!";
                LoginInfo.Visible = false;
            }
            else {
                LoggedIn.Visible = false;
                LoginInfo.Visible = true;
            }

        }

        protected void login_Click(object sender, EventArgs e) {
            string result = apiConnection.GetResultFromApi("Customer/GetCarOwnerData?Username=" + Username.Text + "&Password=" + Password.Text);
            CarOwnerData registratedUser = JsonConvert.DeserializeObject<CarOwnerData>(result);
            if (registratedUser.FirstName.IsNullOrWhiteSpace()) {
                InvalidParameters.Text = "Incorrect username or password, please check your parameters!";
            }
            else {
                HttpCookieCollection httpCookieCollection = new HttpCookieCollection();
                HttpCookie Cookie = new HttpCookie("CarOwnerData", registratedUser.FirstName + " " + registratedUser.LastName + "&" + registratedUser.CardExpDate + "&" + registratedUser.CardNumber + "&" + registratedUser.Cvv);
                Cookie.Expires = DateTime.Now.AddMinutes(30);
                Cookie.Secure = true;
                Cookie.HttpOnly = true;
                Cookie.SameSite = SameSiteMode.None;
                Response.Cookies.Add(Cookie);
                httpCookieCollection.Add(Cookie);
                Response.Redirect("https://localhost:44358/ServiceSignUp");
            }
        }


    }
}