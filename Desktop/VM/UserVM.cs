using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using Desktop.View;
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
    public partial class UserVM:ObservableObject
    {
        [ObservableProperty]
        public ObservableCollection<User> users;
        [ObservableProperty]
        public User? selectedUser = null;
        public POSDbContext _context;
        private User? User { get; set; }
        [ObservableProperty]
        private string? userId;

        [RelayCommand]
        public void Delete()
        {
            if (SelectedUser != null)
            {
                if(SelectedUser.Role=="User")
                {
                    if(SelectedUser.UserName!=null)
                    {
                        string name = SelectedUser.UserName;
                        _context.Users.Remove(SelectedUser);

                        Users.Remove(SelectedUser);
                        _context.SaveChanges();
                        MessageBox.Show($"{name} is Deleted successfully.", "DELETED \a ");
                        SelectedUser = null;
                    }
                    
                }
                else
                {
                    MessageBox.Show("Admin user can not ne deleted");
                }
                   
                
               
            }
            else
            {
                MessageBox.Show("Please User User before Delete.", "Error");
            }

            var AdminUser = _context.Users.FirstOrDefault(u => u.Role == "Admin");

            try
            {
                if (AdminUser == null)
                {
                    var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
                    window1?.Close();
                    LoginView window = new LoginView();
                    window.Show();
                }

            }
            catch (Exception ex)
            {
                // Handle any exceptions that occur during the login process
                MessageBox.Show($"Something failed: {ex.Message}");
            }
        }

    

        [RelayCommand]
        public void EditUser()
        {
            if (SelectedUser != null)
            {
                if(SelectedUser.Role == "User")
                {
                    User user = SelectedUser;

                    var vm = new AddUserVM(user);
                    _context.Users.Remove(SelectedUser);
                    Users.Remove(SelectedUser);
                    _context.SaveChanges();
                    var window = new AddUserView(vm);

                    window.ShowDialog();
                    _context.Users.Add(vm.User);
                    Users.Add(vm.User);
                    _context.SaveChanges();
                }
                else
                {
                    MessageBox.Show("Admin user cannot be edited.");
                }

                
            }
            else
            {
                MessageBox.Show("Please Select the student", "Warning!");
            }
        }


        [RelayCommand]
        public void AddUser()
        {
            var vm = new AddUserVM();

            var window = new AddUserView(vm);
            window.ShowDialog();

            
                Users.Add(vm.User);
                _context.Users.Add(vm.User);
                _context.SaveChanges();

            
            Loaduser();
        }

        [RelayCommand]
        public void Back()
        {
            var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
            window1?.Close();
            var vm = new DashboardVM(User);
            var window = new Dashboard(vm);
            window.ShowDialog();
        }
        private void Loaduser()
        {
            var people = _context.Users.ToList();
            Users.Clear();
            foreach (var person in people)
            {
                Users.Add(person);
            }
        }

        public UserVM()
        {

            users = new ObservableCollection<User>();
            _context = new POSDbContext();
            SearchCommand=new RelayCommand(SearchUsers);
            Loaduser();
           

        }

        private string? searchText;
        public string? SearchText
        {
            get => searchText;
            set
            {
                SetProperty(ref searchText, value);
                SearchUsers();
            }
        }

        public RelayCommand SearchCommand { get; }

        private void SearchUsers()
        {
            using (var db = new POSDbContext())
            {
                if (string.IsNullOrWhiteSpace(SearchText))
                {
                    Users = new ObservableCollection<User>(db.Users.ToList());
                }
                else
                {
                    Users = new ObservableCollection<User>(db.Users.Where(u => u.UserName.Contains(SearchText)).ToList());
                }
            }
        }
        

    }
}
