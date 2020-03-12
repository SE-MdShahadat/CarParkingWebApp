using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CPMSDBModel.Admin
{
    public class AdminDBModel
    {
        public int AdminID { get; set; }
        public string Name { get; set; }
        public string Contact { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
    }
    public class DDLCountryDBModel
    {
        public string Code { get; set; }
        public string Value { get; set; }
    }
    public class DDLCityDBModel
    {
        public string Code { get; set; }
        public string Value { get; set; }
        public int CountryID { get; set; }
    }
}
