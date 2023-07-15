using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Automation;

namespace Desktop.VM
{
    public partial class UserinfoVM:ObservableObject
    {
        private POSDbContext _context;
        [ObservableProperty]
        public User _user;
        [ObservableProperty]
        public bool isuserNameReadOnly;
        [ObservableProperty]
        public bool isAddressReadOnly;
        [ObservableProperty]
        public bool isContactReadOnly;
        [ObservableProperty]
        public bool isPasswordReadOnly;
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


        public UserinfoVM(User u)
        {
            _user = u;

            _context = new POSDbContext();
            isuserNameReadOnly = true;
            isAddressReadOnly = true;
            isContactReadOnly = true;
            isPasswordReadOnly = true;
            EditSaveUserNameCommand = new RelayCommand(EditSaveUserName);
            EditSavePasswordCommand = new RelayCommand(EditSaveAddress);
            EditSaveContactCommand = new RelayCommand(EditSaveContact);
            EditSavePasswordCommand = new RelayCommand(EditSavePassword);
            ProfileChangeCommand=new RelayCommand(Profile);
            imagePath=u.ImagePath;
            image=u.Image;

        }

        public UserinfoVM()
        {
            _user = new User();
            _context = new POSDbContext();
            isuserNameReadOnly = true;
            isAddressReadOnly = true;
            isContactReadOnly = true;
            isPasswordReadOnly = true;
            EditSaveUserNameCommand = new RelayCommand(EditSaveUserName);
            EditSaveAddressCommand= new RelayCommand(EditSaveAddress);
            EditSaveContactCommand = new RelayCommand(EditSaveContact);
            EditSavePasswordCommand = new RelayCommand(EditSavePassword);
            ProfileChangeCommand = new RelayCommand(Profile);

        }


        private string editButtonContent = "Edit";
        public string EditButtonContent
        {
            get { return editButtonContent; }
            set { SetProperty(ref editButtonContent, value); }
        }

        private string saveButtonContent = "Save";
        public string SaveButtonContent
        {
            get { return saveButtonContent; }
            set { SetProperty(ref saveButtonContent, value); }
        }

        public RelayCommand EditSaveUserNameCommand { get; }

        private void EditSaveUserName()
        {
            if (EditButtonContent == "Edit")
            {
                // Perform edit logic here
                // For example, you can enable editing and trigger any other desired actions
                EditButtonContent = "Save";
                IsuserNameReadOnly = false;

            }
            else
            {
                // Perform save logic here
                // For example, you can update the database with the changes
                EditButtonContent = "Edit";
                SaveUserName();
                IsuserNameReadOnly=true;
            }
        }

        private void SaveUserName()
        {
            _context.Users.Update(User);
            _context.SaveChanges();
            IsuserNameReadOnly = true;
            // Implement your save logic here
            // This could involve updating the database with the changes
        }

        private string editButtonAddressContent = "Edit";
        public string EditButtonAddressContent
        {
            get { return editButtonAddressContent; }
            set { SetProperty(ref editButtonAddressContent, value); }
        }

        private string saveButtonAddressContent = "Save";
        public string SaveButtonAddressContent
        {
            get { return saveButtonAddressContent; }
            set { SetProperty(ref saveButtonAddressContent, value); }
        }

        public RelayCommand EditSaveAddressCommand { get; }

        private void EditSaveAddress()
        {
            if (EditButtonAddressContent == "Edit")
            {
                // Perform edit logic here
                // For example, you can enable editing and trigger any other desired actions
                EditButtonAddressContent = "Save";
                IsAddressReadOnly = false;

            }
            else
            {
                // Perform save logic here
                // For example, you can update the database with the changes
                EditButtonAddressContent = "Edit";
                SaveAddress();
                IsAddressReadOnly = true;
            }
        }

        private void SaveAddress()
        {
            _context.Users.Update(User);
            _context.SaveChanges();
            IsAddressReadOnly = true;
            // Implement your save logic here
            // This could involve updating the database with the changes
        }


        private string editButtonContactContent = "Edit";
        public string EditButtonContactContent
        {
            get { return editButtonContactContent; }
            set { SetProperty(ref editButtonContactContent, value); }
        }

        private string saveButtonContactContent = "Save";
        public string SaveButtonContactContent
        {
            get { return saveButtonContactContent; }
            set { SetProperty(ref saveButtonContactContent, value); }
        }


        public RelayCommand EditSaveContactCommand { get; }

        private void EditSaveContact()
        {
            if (EditButtonContactContent == "Edit")
            {
                // Perform edit logic here
                // For example, you can enable editing and trigger any other desired actions
                EditButtonContactContent = "Save";
                IsContactReadOnly = false;

            }
            else
            {
                // Perform save logic here
                // For example, you can update the database with the changes
                EditButtonContactContent = "Edit";
                SaveContact();
                IsContactReadOnly = true;
            }
        }

        private void SaveContact()
        {
            _context.Users.Update(User);
            _context.SaveChanges();
            IsContactReadOnly = true;
            // Implement your save logic here
            // This could involve updating the database with the changes
        }

        private string editButtonPasswordContent = "Edit";
        public string EditButtonPasswordContent
        {
            get { return editButtonPasswordContent; }
            set { SetProperty(ref editButtonPasswordContent, value); }
        }

        private string saveButtonPasswordContent = "Save";
        public string SaveButtonPasswordContent
        {
            get { return saveButtonPasswordContent; }
            set { SetProperty(ref saveButtonPasswordContent, value); }
        }

        public RelayCommand EditSavePasswordCommand { get; }

        private void EditSavePassword()
        {
            if (EditButtonContent == "Edit")
            {
                // Perform edit logic here
                // For example, you can enable editing and trigger any other desired actions
                EditButtonPasswordContent = "Save";
                IsPasswordReadOnly = false;

            }
            else
            {
                // Perform save logic here
                // For example, you can update the database with the changes
                EditButtonPasswordContent = "Edit";
                SavePassword();
                IsPasswordReadOnly = true;
            }
        }

        private void SavePassword()
        {
            _context.Users.Update(User);
            _context.SaveChanges();
            IsPasswordReadOnly = true;
            // Implement your save logic here
            // This could involve updating the database with the changes
        }


        public RelayCommand ProfileChangeCommand { get; }

        private void UploadImage()
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image files (*.jpg, *.jpeg, *.png) | *.jpg; *.jpeg; *.png";

            if (openFileDialog.ShowDialog() == true)
            {
                ImagePath = openFileDialog.FileName;

                // Read the image file as a byte array
                Image = File.ReadAllBytes(User.ImagePath);
                // Update the image property of the NewUser object
                //User.Image = Image;
                //User.ImagePath = ImagePath;

                // Update the image property of the NewUser object

                //_context.SaveChanges();
               // User.Image = Image;
               // User.ImagePath = ImagePath;
                
            }
            //User.ImagePath = ImagePath;
            //User.Image = Image;
           // _context.Users.Update(User);
           // _context.SaveChanges();

        }

        private void Profile()
        {
            UploadImage();
            User.ImagePath = ImagePath;
            User.Image = Image;
            _context.Users.Update(User);
            _context.SaveChanges();
        }

    }
}
