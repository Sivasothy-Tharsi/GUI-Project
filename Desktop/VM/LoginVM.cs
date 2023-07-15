using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using Desktop.View;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Desktop.VM
{
    public partial class LoginVM : ObservableObject
    {
        public readonly POSDbContext _Context;
        [ObservableProperty]
        public string? _username;
        [ObservableProperty]
        public string? _password;
        [ObservableProperty]
        public User? user;
        [ObservableProperty]
        public ObservableCollection<User> users;



        public LoginVM()
        {
            _Context = new POSDbContext();
            users = new ObservableCollection<User>(_Context.Users);
        }
        [RelayCommand]
        public static void Register()
        {
            Application.Current.MainWindow.Visibility = Visibility.Hidden;
            var window = new RigisterView();
            window.Show();
        }
        [RelayCommand]
        public static void Shutdown()
        {
            Application.Current.Shutdown();
        }
        [RelayCommand]
        public void Login()
        {
            var user = _Context.Users.FirstOrDefault(u => u.UserName == Username && u.Password == Password);

            try
            {
                if (user == null)
                {
                    MessageBox.Show("Invalid Username or Password.");
                    Username = null;
                    Password = null;
                }
                else
                {

                    Application.Current.MainWindow.Visibility = Visibility.Hidden;
                    var vm = new DashboardVM(user);
                    var window = new Dashboard(vm);
                    window.Show();
                    // var window = new Dashboard();
                    //window.Show();

                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur during the login process
                MessageBox.Show($"Login failed: {ex.Message}");
            }
        }
            [RelayCommand]
            public void ForgotPassword()
            {
                var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
                window1?.Visibility.Equals(Visibility.Collapsed);
                var window = new ForgotPassword();
                window.Show();
            }
        }     
}
