using CommunityToolkit.Mvvm.ComponentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using System.Windows;
using System.Collections.ObjectModel;
using Desktop.Model;
using CommunityToolkit.Mvvm.Input;
using Microsoft.EntityFrameworkCore;
using Desktop.View;

namespace Desktop.VM
{
    public partial class ResetPasswordVM:ObservableObject
    {
        private POSDbContext _context;
        [ObservableProperty]
        public string userName;
        [ObservableProperty]
        public string mobileNo;
        [ObservableProperty]
        public ObservableCollection<User>? users;


        public ResetPasswordVM()
        {
            _context = new POSDbContext();
        }


        [RelayCommand]
        public void ResetPassword()
        {
            // Check if the email is provided
            if (string.IsNullOrEmpty(UserName))
            {
                MessageBox.Show("Please enter your email.");
                return;
            }

            // Find the user with the provided email
            var user = _context.Users.FirstOrDefault(u => u.Contact == MobileNo && u.UserName==UserName);
            if (user == null)
            {
                MessageBox.Show("User not found.");
                return;
            }

            // Generate a new password (you can use a library to generate a secure password)
            string newPassword = GenerateNewPassword();

            // Update the user's password
            user.Password = newPassword;
            _context.SaveChanges();

            // Send an email with the new password
            try
            {
               
                MessageBox.Show($"Reset password: {newPassword}");

                var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
                window1?.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Failed to send email: {ex.Message}");
            }
        }


        private string GenerateNewPassword()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()";
            var random = new Random();

            // Generate a password with a length of 8 characters
            string newPassword = new string(Enumerable.Repeat(chars, 8)
                .Select(s => s[random.Next(s.Length)]).ToArray());

            return newPassword;
        }

        [RelayCommand]
        public void close()
        {
            var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
            window1?.Close();
            var loginWindow = new LoginView();
            loginWindow.Show();
        }

    }
}
