using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Desktop.Model
{
    public class User
    {
        public int Id { get; set; }
        public string? UserId { get; set; }   
        public string? UserName { get; set; }
        public string? Password { get; set; }
        public string? Contact { get; set; }
        public string? Address { get; set; }
        public string? Role { get; set; }
        public string? ImagePath { get; set; }
        public byte[]? Image { get; set; }
    }
}
