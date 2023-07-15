using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using Desktop.View;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.WebSockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Desktop.VM
{
    public partial class edit_orderVM : ObservableObject
    {

        [ObservableProperty]
        public int originalQuantity;
        [ObservableProperty]
        public OrderItem item;
        [ObservableProperty]
        public OrderItem newItem;

        public edit_orderVM(OrderItem items)
        {
            item = items;
            newItem = items;
            SaveCommand = new RelayCommand(Save);

        }

        public RelayCommand SaveCommand { get; }

        public edit_orderVM()
        {
            item = new OrderItem();
            SaveCommand = new RelayCommand(Save);
        }

        private void Save()
        {


            if (NewItem != null)
            {
                if (NewItem.Quantity > 0 && NewItem.Quantity <= NewItem.Product.QuantityInStock)
                {
                    var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
                    window1?.Close();
                }
                else
                {
                    if (NewItem.Quantity <= 0)
                    {
                        MessageBox.Show("Quantity should be greater than zero.");
                    }
                    else if (NewItem.Quantity <= NewItem.Product.QuantityInStock)
                    {
                        MessageBox.Show("Available product quantity is less");
                    }
                }

            }

        }

        [RelayCommand]
        public void Cancel()
        {
            var window1 = Application.Current.Windows.OfType<Window>().SingleOrDefault(x => x.IsActive);
            window1?.Close();
        }
    }
}
