using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unit_Converter.Converters {
    class Length : BaseConverter {

        public override String getConversionName() { return "Length"; }

        public override Dictionary<String, double> getUnitDefinitions() {
            return new Dictionary<String, double>() 
            {
                {"Meters", 1},
                {"Kilometers", 1000},
                {"Centimeters", 0.01},
                {"Feet", 0.3048},
                {"Inches", 0.0254},
                {"Yard", 0.9144},
                {"Mile", 1609.34},
                {"Nautical Mile", 1852}
            };
        }
    }
}
