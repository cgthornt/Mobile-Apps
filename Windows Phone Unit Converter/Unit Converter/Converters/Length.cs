using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unit_Converter.Converters {
    class Length : BaseConverter {

        public override String getConversionName() { return "Length"; }

        public override Dictionary<String, decimal> getUnitDefinitions() {
            return new Dictionary<String, decimal>() 
            {
                {"Meters", 1},
                {"Kilometers", 1000},
                {"Centimeters", 0.01m},
                {"Feet", 0.3048m},
                {"Inches", 0.0254m},
                {"Yard", 0.9144m},
                {"Mile", 1609.34m},
                {"Nautical Mile", 1852}
            };
        }
    }
}
