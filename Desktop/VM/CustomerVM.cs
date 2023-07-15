using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
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
    public partial class CustomerVM:ObservableObject
    {

        private POSDbContext _dbContext;
        [ObservableProperty]
        public string? customerName;
        [ObservableProperty]
        public int customerId;
        [ObservableProperty]
        public string? companyName;
        [ObservableProperty]
        public string? address;
        [ObservableProperty]
        public string? city;
        [ObservableProperty]
        public string? contact;
        [ObservableProperty]
        public string? imagePath;

        private byte[]? image;
        public byte[]? Image
        {
            get => image;
            set => SetProperty(ref image, value);
        }
        [ObservableProperty]
        public User? user;
        [ObservableProperty]
        public ObservableCollection<Customer> customers;

        public Customer? SelectedCustomer { get; set; }
        public Customer? Customer;

        public CustomerVM()
        {
            _dbContext = new POSDbContext();
            Customers = new ObservableCollection<Customer>();
            SearchCommand = new RelayCommand(SearchCustomer);
            LoadData();
        }

        private void LoadData()
        {
            var people = _dbContext.Customers.ToList();
            Customers.Clear();
            foreach (var person in people)
            {
                Customers.Add(person);
            }
        }
        [RelayCommand]
        public void AddCustomer()
        {

            var cus = _dbContext.Customers.FirstOrDefault(u => u.CustomerId == CustomerId);
            if (cus != null)
            {
                MessageBox.Show("CustomerId already exist.", "Warning");
            }


            if (cus == null)
            {
                //UploadPicture();
                cus = new Customer()
                {
                    CustomerName = CustomerName,
                    CustomerId = CustomerId,
                    CompanyName = CompanyName,
                    Address = Address,
                    City = City,
                    Contact = Contact,
                    ImagePath = ImagePath,
                    Image = Image,
                };

            }
            else
            {

                cus.CustomerName = CustomerName;
                cus.CustomerId = CustomerId;
                cus.CompanyName = CompanyName;
                cus.Address = Address;
                cus.City = City;
                cus.Contact = Contact;
                cus.ImagePath = ImagePath;
                cus.Image = Image;
            }


            _dbContext.Customers.Add(cus);
            _dbContext.SaveChanges();
            CustomerName = "";
            CustomerId = 0;
            CompanyName = "";
            Address = "";
            City = "";
            Contact = "";


            LoadData();
        }
        [RelayCommand]
        public void DeleteCustomer()
        {
            if (SelectedCustomer != null)
            {
                _dbContext.Customers.Remove(SelectedCustomer);
                _dbContext.SaveChanges();
                Customers.Remove(SelectedCustomer);
            }
            else
            {
                MessageBox.Show("Select a customer.", "Warning");
            }

        }
        [RelayCommand]
        public void EditCustomer()
        {
            if (SelectedCustomer != null)
            {
               

                Customer customer = SelectedCustomer;
                CustomerName = SelectedCustomer.CustomerName;
                CustomerId = SelectedCustomer.CustomerId;
                CompanyName = SelectedCustomer.CompanyName;
                Address = SelectedCustomer.Address;
                City = SelectedCustomer.City;
                Contact = SelectedCustomer.Contact;
                ImagePath = SelectedCustomer.ImagePath;
                Image = SelectedCustomer.Image;
                _dbContext.Remove(customer);
                _dbContext.SaveChanges();

            }
            else
            {
                MessageBox.Show("please select the Customer", "Warning");
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
                    Customers = new ObservableCollection<Customer>(db.Customers.ToList());
                }
                else
                {
                    Customers = new ObservableCollection<Customer>(db.Customers.Where(u => u.CustomerName.Contains(SearchText)).ToList());
                }
            }
        }

    }
}
