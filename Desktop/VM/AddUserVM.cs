using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using Desktop.View;
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
    public partial class AddUserVM : ObservableObject
    {
        private POSDbContext _dbContext;
        [ObservableProperty]
        public ObservableCollection<User> users; 
        private User newUser;
        public User NewUser
        {
            get => newUser;
            set => SetProperty(ref newUser, value);
        }

        private List<string> roles;
        public List<string> Roles
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
        private string imagePath;
        public string ImagePath
        {
            get => imagePath;
            set => SetProperty(ref imagePath, value);
        }

        private byte[] image;
        public byte[] Image
        {
            get => image;
            set => SetProperty(ref image, value);
        }

        [ObservableProperty]
        public string error;

        public User User { get; private set; }

        public AddUserVM(User u)
        {
            Roles = new List<string> { "Admin", "User" };
            _dbContext = new POSDbContext();
            users=new ObservableCollection<User>(_dbContext.Users.ToList());
            User = u;
            newUser = u;

            newUser.UserName = u.UserName;
            newUser.UserId = u.UserId;
            newUser.Role = u.Role;
            SelectedRole = u.Role;
            newUser.Address = u.Address;
            newUser.Contact = u.Contact;
            newUser.Password = u.Password;
            newUser.ImagePath = u.ImagePath;
            newUser.Image = u.Image;
        }

        public AddUserVM()
        {
            NewUser = new User();
            Roles = new List<string> { "Admin", "User" };
            _dbContext = new POSDbContext();
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
                NewUser.Image = imageBytes;
                NewUser.ImagePath = imagePath;
            }
        }

        [RelayCommand]
        public void Add()
        {
            var existingAdminUser = _dbContext.Users.FirstOrDefault(u => u.Role == "Admin");
            if (existingAdminUser != null)
            {
                if(SelectedRole!="Admin")
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

                        User = new User()
                        {
                            Id = NewUser.Id,
                            UserName = NewUser.UserName,
                            Password = NewUser.Password,
                            Address = NewUser.Address,
                            Role = SelectedRole,
                            UserId = NewUser.UserId,
                            Contact = NewUser.Contact,
                            Image = NewUser.Image,
                            ImagePath = NewUser.ImagePath,

                        };
                        if (User.UserName != null)
                        {
                            var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
                            window1?.Close();
                        }

                    }
                }
                else
                {
                    MessageBox.Show("An admin user already exists.Cannot add another admin user.");
                }
            }

        }

        [RelayCommand]
        public void RegisterCancel()
        {
            var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
            window1?.Close();


        }
    }
}
