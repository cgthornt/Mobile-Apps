using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unit_Converter.Converters
{
    class Volume : BaseConverter {
        public override String getConversionName() { return "Volume"; }

        public override Dictionary<String, decimal> getUnitDefinitions()
        {
            return new Dictionary<String, decimal>() 
            {
                {"Liters", 1}, // Liters are our base units
                {"Milliliters", 0.001m},
                {"Gallons", 3.78541m},
                {"Quarts", 0.946353m},
                {"Pints", 0.473176m},
                {"Cups", 0.236588m},
                {"Ounces", 0.0295735m},
                {"Tablespoons", 0.0147868m},
                {"Teaspoons", 0.00492892m},
                {"Cubic Meter", 1000},
                {"Cubic Feet", 28.3168m},
                {"Cubic Inches", 0.0163871m},
                {"Barrels (Oil)", 158.9873m}

            };
        }
    }
}
