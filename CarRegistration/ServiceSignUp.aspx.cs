using CarRegistration.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRegistration {
    public partial class Registration : Page {

        private ApiConnection apiConnection = new ApiConnection();

        protected void Page_Load(object sender, EventArgs e) {
            HttpCookie authCookie = Context.Request.Cookies["CarOwnerData"];
            if (authCookie != null) {
                string[] cookieVals = authCookie.Value.Split('&');
                txbImePrezime.Text = cookieVals[0];
                txbExpire.Text = cookieVals[1];
                txbBrojKred.Text = cookieVals[2];
                txbCvv.Text = cookieVals[3];
            }
            if (!IsPostBack) {
                DDLgodine();
                GetCarManufacturers();
            }
        }

        protected void DDLgodine() {
            for (int i = 1900; i <= DateTime.Now.Year; i++) {
                ddlGodina.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        protected void button_registerCar(object sender, EventArgs e) {
            Login login = new Login();
            string[] imePrezime = txbImePrezime.Text.Split(' ');
            CarOwnerData carOwnerData = new CarOwnerData { FirstName = imePrezime[0], LastName = imePrezime[1], CardExpDate = txbExpire.Text, CardNumber = Convert.ToInt64(txbBrojKred.Text), Cvv = Convert.ToInt32(txbCvv.Text) };
            if (Context.Request.Cookies["CarOwnerData"] == null) {
                login.RegisterUser(carOwnerData);
            }

            ServiceSignUp();
            Response.Redirect("https://localhost:44316/");
        }

        protected void GetCarManufacturers() {
            string result = apiConnection.GetResultFromApi("RegisterCar/GetCarManufacturers");
            List<CarData> listOfCd = JsonConvert.DeserializeObject<List<CarData>>(result);
            foreach (CarData cd in listOfCd) {
                int i = ddlSelectProizvođac.Items.Count;
                ListItem listItem = new ListItem(cd.Manufacturer, cd.Id.ToString());
                ddlSelectProizvođac.Items.Insert(i++, listItem);
            }
        }

        protected void GetCarManufacturerModels(string Manufacturer) {
            string result = apiConnection.GetResultFromApi("RegisterCar/GetCarModels?Manufacturer=" + Manufacturer);
            List<CarData> listOfModels = JsonConvert.DeserializeObject<List<CarData>>(result);
            ddlCarModel.Items.Clear();
            ddlCarModel.Items.Insert(0, "Select car model");
            foreach (CarData cd in listOfModels) {
                int i = ddlCarModel.Items.Count;
                ListItem model = new ListItem(cd.Model, cd.Id.ToString());
                ddlCarModel.Items.Insert(i++, model);
            }
        }

        protected void ServiceSignUp() {
            CarData carData = new CarData { Manufacturer = ddlSelectProizvođac.SelectedValue, Model = ddlCarModel.SelectedValue };
            CarService carService = new CarService { CarData = carData, CardNumber = Convert.ToInt64(txbBrojKred.Text), CarYearOfMake = Convert.ToInt32(ddlGodina.Text), DateOfService = Convert.ToDateTime(dateOfService.Text), EngineType = ddlVrstaMotora.SelectedItem.Text };
            var result = apiConnection.PostToApi("RegisterCar/AddCarService", carService);
        }
    }
}