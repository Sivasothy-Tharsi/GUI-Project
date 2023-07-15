using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using Desktop.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Desktop.VM
{
    public partial class DashboardVM : ObservableObject
    {
        private POSDbContext _dbContext;

        [ObservableProperty]
        public string? userName;
        [ObservableProperty]
        public User? user;

        private object? _currentView;
        public object? CurrentView
        {
            get => _currentView;
            set => SetProperty(ref _currentView, value);
        }

        public RelayCommand? HomeCommand { get; }
        public RelayCommand? UserCommand { get; }
        public RelayCommand? AboutCommand { get; }
        public RelayCommand? CustomerCommand { get; }
        public RelayCommand? CategoryCommand { get; }
        public RelayCommand? ProductCommand { get; }
        public RelayCommand? OrderCommand { get; }
        public RelayCommand? StockCommand { get; }

        public DashboardVM()
        {
            _dbContext = new POSDbContext();
            user = new User();

            // Set the initial view
            CurrentView = new HomeView();

            // Initialize the commands
            HomeCommand = new RelayCommand(Home);
            UserCommand = new RelayCommand(User1);
            CustomerCommand=new RelayCommand(Customer);
            CategoryCommand=new RelayCommand(Category);
            ProductCommand=new RelayCommand(Product);
            OrderCommand=new RelayCommand(Order);
            StockCommand=new RelayCommand(Stock);   
        }
        public DashboardVM(User u)
        {
            user = u;
            _dbContext = new POSDbContext();
            // Set the initial view
            CurrentView = new HomeView();

            // Initialize the commands
            HomeCommand = new RelayCommand(Home);
            UserCommand = new RelayCommand(User1);
            CustomerCommand= new RelayCommand(Customer);    
            CategoryCommand=new RelayCommand(Category);
            ProductCommand=new RelayCommand(Product);
            OrderCommand=new RelayCommand(Order);
            StockCommand=new RelayCommand(Stock);
        }

        private void User1()
        {
            if (User?.Role == "User")
            {
                MessageBox.Show("Cannot access as a user...");
            }
            else
            {
                CurrentView = new UserView();
            }
            // Set the About view as the current view
            
        }
        private void Home()
        {
            CurrentView = new HomeView();
        }
        private void Customer()
        {
            if(User?.Role=="User")
            {
                MessageBox.Show("Cannot access as a user...");
            }
            else
            {
                CurrentView = new CustomerView();
            }
        }
        private void Category()
        {
            CurrentView = new CategoryView();
        }

        private void Product()
        {
            CurrentView = new ProductView();
        }
        private void Order()
        {
            if (User?.Role == "User")
            {
                MessageBox.Show("Cannot access as a user...");
            }
            else
            {
                CurrentView = new OrderView();
            }
           
        }
        private void Stock()
        {
            if (User?.Role == "User")
            {
                MessageBox.Show("Cannot access as a user...");
            }
            else
            {
                CurrentView = new StockView();
            }
            
        }
        [RelayCommand]
        public static void Logout()
        {

            var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
            window1?.Close();
            LoginView window = new LoginView();
            window.Show();
        }
        [RelayCommand]
        public void UserInfo()
        {
            var vm = new UserinfoVM(User);
            CurrentView = new UserInfoView(vm);
        }

    }
}
