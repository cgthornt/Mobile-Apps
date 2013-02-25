using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unit_Converter.Converters {
    
    /**
     * This is the base converter class that other ones will extend.
     *
     */
    public abstract class BaseConverter {

        private Dictionary<String, decimal> _unitDefintions;

        public Dictionary<String,decimal> UnitDefinitions {
            get {
                if (_unitDefintions == null) _unitDefintions = getUnitDefinitions();
                return _unitDefintions;
            }
        }

        private List<String> _unitDefinitionKeys;

        /**
         * Gets a list of keys for unit definitions. Very useful for dropdown lists.
         */
        public List<String> UnitDefinitionKeys {
            get {
                if (_unitDefinitionKeys == null) {
                    _unitDefinitionKeys = new List<String>();
                    foreach (KeyValuePair<String, decimal> pair in UnitDefinitions)
                        _unitDefinitionKeys.Add(pair.Key);
                }
                return _unitDefinitionKeys;
            }
        }

        /**
         * Get a hashtable of unit definitions. This must be in the format of:
         *    "Unit Length" => "Base Unit"
         */
        public abstract Dictionary<String, decimal> getUnitDefinitions();

        /**
         * Defines the name of the conversion, i.e., "Length"
         * <returns>the name of the conversion</returns>
         */
        public abstract String getConversionName();


        /**
         * Take two inputs - the origin unit and target. We use info from the 
         */
        public decimal doConversion(String originConversion, String targetConversion, decimal originValue) {
            if (!UnitDefinitions.ContainsKey(originConversion)) return -1;
            if (!UnitDefinitions.ContainsKey(targetConversion)) return -1;
            decimal oneToOrigin = UnitDefinitions[originConversion];  // This means that "1 origin unit = 231.12 base units"
            decimal baseUnits = originValue * oneToOrigin;            // Convert to base units
            return baseUnits / UnitDefinitions[targetConversion];    // Convert to the target unit
        }
    
    }
}
