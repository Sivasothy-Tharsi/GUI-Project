using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Desktop.Model
{
    public class Customer
    {
        public int CustomerId { get; set; }
        public string? CustomerName { get; set; }
        public string? Address { get; set; }
        public string? City { get; set; }
        public string? CompanyName { get; set; }
        public string? Contact { get; set; }
        public string? ImagePath { get; set; }
        public byte[]? Image { get; set; }
    }
}
