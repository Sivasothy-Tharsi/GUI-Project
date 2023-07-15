using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Desktop.Model
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        public string? ProductName { get; set; }
        public int QuantityInStock { get; set; }
        public string? ImagePath { get; set; }
        public byte[]? Image { get; set; }
        public int CategoryID { get; set; }
        public decimal? UnitPrice { get; set; }
        // [ForeignKey("CategoryId")]
        public virtual Category? Category { get; set; }
        public string? Id { get; set; }

        public Product()
        {
            
        }


    }
}
