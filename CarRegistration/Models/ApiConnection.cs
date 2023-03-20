using Newtonsoft.Json;
using System;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace CarRegistration.Models {
    public class ApiConnection {

        private string Result { get => result; set => result = value; }
        private string result;

        private HttpClient connection = new HttpClient();
        private HttpResponseMessage response = new HttpResponseMessage();

        public ApiConnection() {
            connection.BaseAddress = new Uri("https://localhost:44330/");
        }

        public ApiConnection(string uri) {
            connection.BaseAddress = new Uri("https://localhost:44330/" + uri);
        }

        public string GetResultFromApi(string uri) {
            Task<HttpResponseMessage> consumeApi = SetGetUri(uri);
            var readData = consumeApi.Result;
            if (!readData.IsSuccessStatusCode) {
                throw new Exception("Error while connecting with database!");
            }
            var displayResults = readData.Content.ReadAsStringAsync();
            displayResults.Wait();
            Result = displayResults.Result;

            if (Result.Length < 1) {
                throw new Exception("There is no data!");
            }
            return Result;
        }

        private Task<HttpResponseMessage> SetGetUri(string uri) {
            return connection.GetAsync(uri);
        }

        public async Task<string> PostToApi(string uri, object o) {
            HttpContent stringContent = new StringContent(JsonConvert.SerializeObject(o), Encoding.UTF8, "application/json");
            var response = connection.PostAsync(uri, stringContent);
            response.Wait();
            if (response.Result.StatusCode != HttpStatusCode.OK) {
                return "Invalid parameters, check your inputs!";
            }
            else {
                return "Gj";
            }
        }

        public void DeleteUri() {
            connection.BaseAddress = null;
        }
    }
}