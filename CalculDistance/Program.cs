using System;

namespace CalculDistance
{
    class Program
    {
        static void Main(string[] args)
        {
            Class1 a = new Class1();
            double lat1 = a.ConversionLatitude(59, 23, 23, "N");
            double lat2 = a.ConversionLatitude(39, 22, 12, "N");
            double long1 = a.ConversionLatitude(49, 12, 57, "W");
            double long2 = a.ConversionLatitude(69, 34, 15, "W");

            Console.WriteLine(a.Calcul(lat1, lat2, long1, long2));
        }
    }
}
