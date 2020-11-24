using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;

namespace CalculDistance
{
    class Class1
    {
        public double Calcul(double lat1, double lat2, double long1, double long2)
        {
            var R = 6371e3;
            var φ1 = lat1 * Math.PI / 180;
            var φ2 = lat2 * Math.PI / 180;
            var Δφ = (lat2 - lat1) * Math.PI / 180;
            var Δλ = (long2 - long1) * Math.PI / 180;

            var a = Math.Sin(Δφ / 2) * Math.Sin(Δφ / 2) +
                      Math.Cos(φ1) * Math.Cos(φ2) *
                      Math.Sin(Δλ / 2) * Math.Sin(Δλ / 2);
            var c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));

            var d = Math.Round(R * c / 1000);

            return d;
        }

        public double ConversionLatitude(double degree, int minute, int seconde, string NS)
        {
            int neg = 1;
            if (NS == "S")
            {
                neg = -1;
            }
            double lati = neg * (degree + 1 / 60 * minute + 1 / 3600 * seconde);
            return lati;
        }

        public double ConversionLongitude(double degree, int minute, int seconde, string OW)
        {
            int neg = 1;
            if (OW == "W")
            {
                neg = -1;
            }
            double longi = neg * (degree + 1 / 60 * minute + 1 / 3600 * seconde);
            return longi;
        }
    }
}

