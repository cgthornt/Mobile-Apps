using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unit_Converter.Converters
{
    class Mass : BaseConverter
    {
        public override String getConversionName() { return "Mass"; }

        public override Dictionary<String, decimal> getUnitDefinitions()
        {
            return new Dictionary<String, decimal>() 
            {
                {"Grams", 1}, // Grams are our base units
                {"Kilograms", 1000},
                {"Milligrams", 0.001m},
                {"Pounds", 453.592m},
                {"Ounces", 28.3495m},
                {"Stones", 6350.29m}

            };
        }
    }
}
