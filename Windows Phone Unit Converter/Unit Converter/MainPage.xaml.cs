using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using Unit_Converter.Resources;

using Unit_Converter.Converters;

namespace Unit_Converter
{
    public partial class MainPage : PhoneApplicationPage
    {
        // public static BaseConverter _lastConverter;

        /**
         * Get the last selected converter
         */
        public static BaseConverter LastConverter
        {
            get;
            set;
        }

        // Constructor
        public MainPage()
        {
            InitializeComponent();

            // Sample code to localize the ApplicationBar
            //BuildLocalizedApplicationBar();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            handleUnitClick(new Length());
        }

        private void handleUnitClick(BaseConverter converter)
        {
            LastConverter = converter;
            NavigationService.Navigate(new Uri("/Convert.xaml", UriKind.Relative));
        }

        private void VolumeButton_Click(object sender, RoutedEventArgs e)
        {
            handleUnitClick(new Volume());
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            handleUnitClick(new Mass());
        }

    }
}