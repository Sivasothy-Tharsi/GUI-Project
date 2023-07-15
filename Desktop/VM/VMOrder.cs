using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Desktop.VM
{
    partial class VMOrder:ObservableObject
    {
        private POSDbContext _context;
        [ObservableProperty]
        public decimal paidAmount; 
        [ObservableProperty]
        public string? id;
        [ObservableProperty]
        public decimal totalCost;
        [ObservableProperty]
        public decimal discountRate;
        [ObservableProperty]
        public decimal discount;
        private int quantity;
        public int Quantity
        {
            get { return quantity; }
            set
            {
                SetProperty(ref quantity, value);
            }
        }
        private ObservableCollection<OrderItem> orderItems;
        public ObservableCollection<OrderItem> OrderItems
        {
            get => orderItems;
            set => SetProperty(ref orderItems, value);
        }

        private ObservableCollection<Product> products;
        public ObservableCollection<Product> Products
        {
            get => products;
            set => SetProperty(ref products, value);
        }
        private ObservableCollection<Product> filteredProducts;
        public ObservableCollection<Product> FilteredProducts
        {
            get => filteredProducts;
            set => SetProperty(ref filteredProducts, value);
        }
        [ObservableProperty]
        public Product? selectedProduct;
        [ObservableProperty]
        public Category? selectedCategory;
        [ObservableProperty]
        public OrderItem? selectedOrderItem;
        [ObservableProperty]
        public Customer? selectedCustomer = null;

        private ObservableCollection<Customer> customers;
        public ObservableCollection<Customer> Customers
        {
            get => customers;
            set => SetProperty(ref customers, value);
        }

        private ObservableCollection<Order> orders;
        public ObservableCollection<Order> Orders
        {
            get => orders;
            set => SetProperty(ref orders, value);
        }
        [ObservableProperty]
        public ObservableCollection<Bill> bills;
        [ObservableProperty]
        public ObservableCollection<Category> categories;

        [RelayCommand]
        public void DeleteOrderItem()
        {
            MessageBoxResult result = MessageBox.Show("Are you surely want to delete?", "Title", MessageBoxButton.OKCancel);

            if (SelectedOrderItem != null)
            {

                if (result == MessageBoxResult.OK)
                {
                    SelectedOrderItem.Product.QuantityInStock += SelectedOrderItem.Quantity;
                    _context.SaveChanges();
                    OrderItems.Remove(SelectedOrderItem);

                    TotalCost = 0;
                    Discount = 0;
                    PaidAmount = 0;
                }
                else if (result == MessageBoxResult.Cancel)
                {
                }
            }
        }
        [RelayCommand]
        public void EditOrderItem()
        {


            if (SelectedOrderItem != null)
            {


                var Item = SelectedOrderItem;
                MessageBoxResult result = MessageBox.Show("Are you surely want to edit?", "Title", MessageBoxButton.OKCancel);
                if (result == MessageBoxResult.OK)
                {

                    SelectedProduct = Item.Product;
                    Quantity = Item.Quantity;

                }
            }
        }

        private void FilteredProductByCategory()
        {
            if(SelectedCategory != null)
            {
                FilteredProducts = new ObservableCollection<Product>(Products.Where(p => p.CategoryID == SelectedCategory.CategoryId));
            }
            else
            {
                FilteredProducts= new ObservableCollection<Product>(Products);
            }
        }
        public VMOrder()
        {
            _context = new POSDbContext();

            Products = new ObservableCollection<Product>(_context.Products.Include(p=>p.Category).ToList());
            FilteredProducts = new ObservableCollection<Product>(Products);
            orderItems = new ObservableCollection<OrderItem>(_context.Items);
            customers = new ObservableCollection<Customer>(_context.Customers);
            Bills = new ObservableCollection<Bill>(_context.Bills);
            Orders = new ObservableCollection<Order>(_context.Orders);
            Categories = new ObservableCollection<Category>(_context.Categories);



           
           
            
            SelectedCustomer = null;
            FilteredProductByCategory();
            TotalCost = CalTotalCost();
            Discount = CalDiscount();
           
            SelectedOrderItem = null;

        }

     
      
        [RelayCommand]
        public void IcreaseQuantity()
        {
            Quantity += 1;
        }

        [RelayCommand]
        public void DecreaseQuantity()
        {
            if (Quantity > 0)
            {
                Quantity -= 1;
            }
            else
            {
                Quantity = 0;
            }

        }

        [RelayCommand]
        public void Select()
        {
            if (SelectedOrderItem == null)
            {
                // Check if any products are selected
                if (SelectedProduct != null && SelectedProduct.QuantityInStock > 0)
                {
                    if (Quantity <= 0)
                    {
                        MessageBox.Show("Enter Valid Quantity", "Warning");
                    }
                    else if (Quantity > SelectedProduct.QuantityInStock)
                    {
                        MessageBox.Show("Your need is more than availability", "Sorry");
                    }
                    else
                    {
                      
                        
                        OrderItem orderItem = new OrderItem
                        {
                            Product = SelectedProduct,
                            Quantity = Quantity,
                            TotalPrice = SubTotal()
                        };

                       
                        OrderItems.Add(orderItem);
                        TotalCost = CalTotalCost();
                        Discount= CalDiscount();
                        var pro = _context.Products.FirstOrDefault(x => x.ProductId == SelectedProduct.ProductId);
                        if (pro != null)
                        {
                            SelectedProduct.QuantityInStock -= Quantity;
                            _context.SaveChanges();
                        }

                    }

                }
                else
                {
                    MessageBox.Show("Out of Stock", "Sorry");
                }
                Quantity = 0;
            }
            else
            {

                OrderItem orderItem = new OrderItem
                {
                    Product = SelectedProduct,
                    Quantity = Quantity,
                    TotalPrice = (decimal)(SelectedProduct.UnitPrice * Quantity)
                };

                OrderItems.Add(orderItem);

                SelectedProduct.QuantityInStock -= Quantity;
                SelectedOrderItem.Product.QuantityInStock += SelectedOrderItem.Quantity;
                OrderItems.Remove(SelectedOrderItem);
                TotalCost = CalTotalCost();


            }

        }

        private decimal CalTotalCost()
        {
            decimal sum = 0;
            foreach (var item in OrderItems)
            {
                sum = (decimal)(sum + item.TotalPrice);
            }
            return sum;
        }

        private decimal SubTotal()
        {

            decimal sum = (decimal)(SelectedProduct.UnitPrice * Quantity);
            return (decimal)sum;
        }

        private decimal CalDiscount()
        {

            decimal DiscountCost = TotalCost * (DiscountRate / 100);
            PaidAmount = TotalCost - DiscountCost;
            return DiscountCost;
        }




    }
}
