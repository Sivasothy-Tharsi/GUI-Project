using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using Desktop.View;
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
    public partial class RegisterVM : ObservableObject
    {
        private POSDbContext _dbContext;
        private User? newUser;
        public User? NewUser
        {
            get => newUser;
            set => SetProperty(ref newUser, value);
        }

        private List<string>? roles;
        public List<string>? Roles
        {
            get => roles;
            set => SetProperty(ref roles, value);
        }

        private string? selectedRole;
        public string? SelectedRole
        {
            get => selectedRole;
            set => SetProperty(ref selectedRole, value);
        }

        private string? imagePath;
        public string? ImagePath
        {
            get => imagePath;
            set => SetProperty(ref imagePath, value);
        }

        private byte[]? image;
        public byte[]? Image
        {
            get => image;
            set => SetProperty(ref image, value);
        }

        [ObservableProperty]
        public string? error;

        public User? User { get; set; }
        public ObservableCollection<User> Users { get; set; } = new ObservableCollection<User>();

        public RegisterVM()
        {
            NewUser = new User();
            Roles = new List<string> { "Admin", "User" };
            _dbContext = new POSDbContext();
            ImagePath = "/Image/4.png";
            LoadData();

        }

        [RelayCommand]
        public void UploadImage()
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image files (*.jpg, *.jpeg, *.png) | *.jpg; *.jpeg; *.png";

            if (openFileDialog.ShowDialog() == true)
            {
                 ImagePath = openFileDialog.FileName;

                // Read the image file as a byte array
                Image = File.ReadAllBytes(ImagePath);

                // Update the image property of the NewUser object
                NewUser.Image = Image;
                NewUser.ImagePath = ImagePath;
            }
        }
        [RelayCommand]
        public void Add()
        {
            var user = _dbContext.Users.FirstOrDefault(u => u.Id == NewUser.Id);
            if (user != null)
            {
                MessageBox.Show("UserId already Exist..");
                return;
            }

            if (user == null)
            {
                if (NewUser.Password == null)
                {
                    Error = "Password is required.";
                    MessageBox.Show(Error);
                }
                else if (NewUser.Password.Length < 8)
                {
                    Error = "Password must be at least 8 character long.";
                    MessageBox.Show(Error);
                }
                else
                {
                    var hasUppercase = false;
                    var hasLowercase = false;
                    var hasDigit = false;

                    foreach (var c in NewUser.Password)
                    {
                        if (char.IsDigit(c))
                        {
                            hasDigit = true;
                        }
                        else if (char.IsLower(c))
                        {
                            hasLowercase = true;
                        }
                        else if (char.IsUpper(c))
                        {
                            hasUppercase = true;
                        }
                    }
                    if (!hasUppercase)
                    {
                        Error = "Password must contain an uppercase letter.";
                        MessageBox.Show(Error);
                    }
                    else if (!hasLowercase)
                    {
                        Error = "Password must contain a lowercase letter.";
                        MessageBox.Show(Error);
                    }
                    else if (!hasDigit)
                    {
                        Error = "Password must contain a digit.";
                        MessageBox.Show(Error);
                    }
                    else
                    {
                        Error = null;
                    }
                }

                if (Error == null)
                {

                    user = new User()
                    {
                        UserName = NewUser.UserName,
                        Password = NewUser.Password,
                        Address = NewUser.Address,
                        Role = SelectedRole,
                        UserId = NewUser.UserId,
                        Contact = NewUser.Contact,
                        Image = NewUser.Image,
                        ImagePath = NewUser.ImagePath,
                        

                    };
                    _dbContext.Users.Add(user);
                    _dbContext.SaveChanges();
                    Users.Add(user);
                    MessageBox.Show("Registered");
                    var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
                    window1?.Close();
                    LoginView Login = new LoginView();
                    Login.ShowDialog();
                }

            }


        }


        private void LoadData()
        {
            var people = _dbContext.Users.ToList();
            Users.Clear();
            foreach (var person in people)
            {
                Users.Add(person);
            }
        }
        [RelayCommand]
        public static void Cancel()
        {
            var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
            window1?.Close();
            LoginView Login = new LoginView();
            Login.ShowDialog();

        }



    }
}
