using CommunityToolkit.Mvvm.ComponentModel;
using Desktop.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Desktop.VM
{
    public partial class StockVM:ObservableObject
    {
        private POSDbContext _context;
        [ObservableProperty]
        public ObservableCollection<Product> products;
        [ObservableProperty]
        public ObservableCollection<Category> categories;
        [ObservableProperty]
        public ObservableCollection<Bill> bills;
        [ObservableProperty]
        public ObservableCollection<Order> orders;
        [ObservableProperty]
        public ObservableCollection<Customer> customers;
        [ObservableProperty]
        public ObservableCollection<OrderItem> items;
        [ObservableProperty]
        public int proCount = 0;
        [ObservableProperty]
        public int catCount = 0;
        [ObservableProperty]
        public int billCount = 0;

        private void LoadProduct()
        {
            var pro=_context.Products.ToList();
            foreach(var product in pro)
            {
                ProCount++;
                Products.Add(product);
            }
        }

        private void LoadCategories()
        {
            var cat = _context.Categories.ToList();
            foreach (var category in cat)
            {
                CatCount++;
                Categories.Add(category);
            }
        }
        private void LoadBills()
        {
            var bill = _context.Bills.ToList();
            foreach (var bill1 in bill)
            {
                BillCount++;
                Bills.Add(bill1);
            }
        }
        private void LoadCustomer()
        {
            var customer = _context.Customers.ToList();
            foreach (var cus in customer)
            {
                
                Customers.Add(cus);
            }
        }
        private void LoadOrder()
        {
            var order = _context.Orders.ToList();
            foreach (var order1 in order)
            {

                Orders.Add(order1);
            }
        }

        public StockVM()
        {
            _context = new POSDbContext();
            Products = new ObservableCollection<Product>();
            Categories = new ObservableCollection<Category>();
            Bills = new ObservableCollection<Bill>();
            Orders = new ObservableCollection<Order>();
            Customers= new ObservableCollection<Customer>();
            items = new ObservableCollection<OrderItem>();
            LoadCategories();
            LoadProduct();
            LoadBills();
            LoadOrder();
            LoadCustomer();
        }
    }
}
