using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Desktop.Model
{
    public class Bill
    {

        public int Id { get; set; }
        public Order? Order { get; set; }
        public decimal TotalAmount { get; set; }
        public decimal Discount { get; set; }
        public Decimal PaidAmount { get; set; }
        public string BillId { get; set; }

        public Bill() 
        {
            BillId=GenerateBilId();
        }

        private static int _counter = 1;
        private static string GenerateBilId()
        {
            string billId = $"Invoice00{_counter}";
            _counter++;
            return billId;
        }
    }
}
