using System;

namespace CarRegistration.Models {
    public class CarService {

        public CarService() { }
        public int CarYearOfMake { get; set; }
        public string EngineType { get; set; }
        public long CardNumber { get; set; }
        public DateTime DateOfService { get; set; }
        public CarData CarData { get; set; }
    }
}