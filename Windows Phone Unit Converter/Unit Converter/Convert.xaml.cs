using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;

using System.Diagnostics;

using Unit_Converter.Converters;

namespace Unit_Converter
{
    public partial class Convert : PhoneApplicationPage
    {
        public List<String> PossibleUnits
        {
            get { return MainPage.LastConverter.UnitDefinitionKeys; }
        }

        public Convert()
        {
            Debugger.Log(1, "Hello!", "This is le converter!");
            InitializeComponent();
        }

        private void OnLoad(object sender, RoutedEventArgs e)
        {
            BaseConverter converter = MainPage.LastConverter;
            PageTitle.Text = converter.getConversionName();
            OriginUnit.ItemsSource = converter.UnitDefinitionKeys;
            TargetUnit.ItemsSource = converter.UnitDefinitionKeys;
        }

        private void UpdateAmount()
        {
            String originUnit = (String)OriginUnit.SelectedItem;
            String targetUnit = (String)TargetUnit.SelectedItem;
            try
            {
                String inputText = TargetUnitAmount.Text;
                decimal parsedAmount = Decimal.Parse(inputText);

                decimal result = MainPage.LastConverter.doConversion(originUnit, targetUnit, parsedAmount);
                // String resultStr = Math.Round(result, 2) + " " + targetUnit;
                ResultAmount.Text = String.Format("{0:n4}", result) + " " + targetUnit; // Show commas
            }
            catch (FormatException)
            {
                ResultAmount.Text = "0 " + targetUnit;
            }
        }

        private void OriginChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateAmount();
        }

        private void TargetChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateAmount();
        }

        private void OriginAmountChanged(object sender, TextChangedEventArgs e)
        {
            UpdateAmount();
        }

    }

}