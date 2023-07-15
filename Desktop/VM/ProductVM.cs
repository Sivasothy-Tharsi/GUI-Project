using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Desktop.VM
{
    public partial class ProductVM:ObservableObject
    {
        private POSDbContext _dbContext;
        [ObservableProperty]
        public string? productName;
        [ObservableProperty]
        public int productId;
        [ObservableProperty]
        public decimal price;
        [ObservableProperty]
        public int quantity;
        [ObservableProperty]
        public string? id;
        [ObservableProperty]
        public int categoryId;
        [ObservableProperty]
        public string? imagePath;

        private byte[]? image;
        public byte[]? Image
        {
            get => image;
            set => SetProperty(ref image, value);
        }
     
        [ObservableProperty]
        public ObservableCollection<Category> categories;
        [ObservableProperty]
        public ObservableCollection<Product> products;
        [ObservableProperty]
        public Product? selectedProduct=null;
        [ObservableProperty]
        public Category? selectedCategory=null;


        public ProductVM()
        {
            _dbContext = new POSDbContext();
            categories = new ObservableCollection<Category>();
            products = new ObservableCollection<Product>();
            
            SearchCommand = new RelayCommand(SearchCustomer);
            LoadData();
        }

        private void LoadData()
        {
            var cat = _dbContext.Categories.ToList();
            Categories.Clear();
            foreach (var person in cat)
            {
                Categories.Add(person);
            }
            var products = _dbContext.Products.ToList();
            Products.Clear();
            foreach(var product in products)
            {
                Products.Add(product);
            }
        }
        [RelayCommand]
        public void AddProduct()
        {

            var pro = _dbContext.Products.FirstOrDefault(u => u.ProductId == ProductId );
            if (pro != null)
            {
                MessageBox.Show("CustomerId already exist.", "Warning");
            }


            if (pro == null)
            {
               
                pro = new Product()
                {
                    ProductId = ProductId,
                    ProductName = ProductName,
                    QuantityInStock = Quantity,
                    UnitPrice = Price,
                    ImagePath = ImagePath,
                    Image = Image,
                    CategoryID = SelectedCategory.CategoryId,
                    //Id= Id
                };

            }

            else
            {

                pro.ProductName = ProductName;
                pro.ProductId = ProductId;
                pro.QuantityInStock = Quantity;
                pro.UnitPrice = Price;
                pro.ImagePath = ImagePath;
                pro.Image = Image;
                pro.CategoryID = SelectedCategory.CategoryId;
                pro.Id = SelectedProduct.Id;

            }

            _dbContext.Products.Add(pro);
            _dbContext.SaveChanges();
            ProductName = "";
            ProductId = 0;
            Quantity = 0;
            Price = 0;
            SelectedCategory = null;


            LoadData();
        }
        [RelayCommand]
        public void DeleteProduct()
        {
            if (SelectedProduct != null)
            {
                _dbContext.Products.Remove(SelectedProduct);
                _dbContext.SaveChanges();
                Products.Remove(SelectedProduct);
            }
            else
            {
                MessageBox.Show("Select a customer.", "Warning");
            }

        }
        [RelayCommand]
        public void EditProduct()
        {
            if (SelectedProduct != null)
            {

                Product product = SelectedProduct;
                ProductName = SelectedProduct.ProductName;
                ProductId = SelectedProduct.ProductId;
                Price = SelectedProduct.UnitPrice??0;
                Quantity = SelectedProduct.QuantityInStock;
                SelectedCategory = SelectedProduct.Category;
                ImagePath = SelectedProduct.ImagePath;
                Image = SelectedProduct.Image;
                Id = SelectedProduct.Id;
                SelectedProduct.Id = SelectedProduct.Id;
              
                _dbContext.Remove(product);
                _dbContext.SaveChanges();
            }
            else
            {
                MessageBox.Show("please select the Product", "Warning");
            }
        }
        [RelayCommand]
        public void UploadImage()
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image files (*.jpg, *.jpeg, *.png) | *.jpg; *.jpeg; *.png";

            if (openFileDialog.ShowDialog() == true)
            {
                string imagePath = openFileDialog.FileName;

                // Read the image file as a byte array
                byte[] imageBytes = File.ReadAllBytes(imagePath);

                // Update the image property of the NewUser object
                Image = imageBytes;
                ImagePath = imagePath;
            }
        }

        private string? searchText;
        public string? SearchText
        {
            get => searchText;
            set
            {
                SetProperty(ref searchText, value);
                SearchCustomer();
            }
        }

        public RelayCommand SearchCommand { get; }

        private void SearchCustomer()
        {
            using (var db = new POSDbContext())
            {
                if (string.IsNullOrWhiteSpace(SearchText))
                {
                    Products = new ObservableCollection<Product>(db.Products.ToList());
                }
                else
                {
                    Products = new ObservableCollection<Product>(db.Products.Where(u => u.ProductName.Contains(SearchText)).ToList());
                }
            }
        }
    }
}
