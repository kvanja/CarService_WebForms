using CarRegistration.Models;
using System;
using System.Web;
using System.Web.UI;

namespace CarRegistration {
    public partial class Login : Page {

        private ApiConnection apiConnection = new ApiConnection();

        protected void Page_Load(object sender, EventArgs e) {
        }

        protected void login_Click(object sender, EventArgs e) {
            Response.Redirect("~/Login.aspx");
        }

        protected void register_Click(object sender, EventArgs e) {
            string[] cardExpDate = CardExpDate.Text.Split('/');
            int[] cardExpDateInt = { Convert.ToInt32(cardExpDate[0]), Convert.ToInt32(cardExpDate[1]) };
            int yearNow2Dig = Convert.ToInt32(DateTime.Now.Year.ToString().Remove(0, 2));

            if (cardExpDateInt[0] > 12 || cardExpDateInt[0] < 1) {
                RequiredCardExpDate.Text = "Months have to be between 01 i 12";
                RequiredCardExpDate.IsValid = false;
                return;
            }

            if (cardExpDateInt[1] <= yearNow2Dig && cardExpDateInt[0] < DateTime.Now.Month) {
                RequiredCardExpDate.Text = "Card expired!";
                RequiredCardExpDate.IsValid = false;
                return;
            }

            CarOwnerData carOwner = new CarOwnerData() { FirstName = FirstName.Text, LastName = LastName.Text, CardNumber = Convert.ToInt64(CardNumber.Text), CardExpDate = CardExpDate.Text, Cvv = Convert.ToInt16(CVV.Text), Email = Email.Text, Username = Username.Text, Password = Password.Text };
            bool isRegistrated = RegisterUser(carOwner);
            if (isRegistrated) {
                HttpCookieCollection httpCookieCollection = new HttpCookieCollection();
                HttpCookie Cookie = new HttpCookie("CarOwnerData", FirstName.Text + " " + LastName.Text + "&" + CardExpDate.Text + "&" + CardNumber.Text + "&" + CVV.Text);
                Cookie.Expires = DateTime.Now.AddMinutes(30);
                Cookie.Secure = true;
                Cookie.HttpOnly = true;
                Cookie.SameSite = SameSiteMode.None;
                Response.Cookies.Add(Cookie);
                httpCookieCollection.Add(Cookie);
                Response.Redirect("https://localhost:44358/ServiceSignUp");
            }
            else {
                InvalidParameters.Text = "Invalid inputs, please check them then try again!";
            }
        }

        public bool RegisterUser(CarOwnerData customer) {
            var result = apiConnection.PostToApi("Customer/NewCustomer", customer);
            result.ConfigureAwait(true);
            if (result.Result.Contains("Invalid") || result.Result.Contains("constraint")) {
                return false;
            }
            else {
                return true;
            }
        }
    }
}