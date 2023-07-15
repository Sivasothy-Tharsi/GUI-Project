using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Printing;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Xps;

namespace Desktop.VM
{
    public partial class BillVM : ObservableObject
    {
        private POSDbContext _context;
        [ObservableProperty]
        public ObservableCollection<Bill> bills;
        [ObservableProperty]
        public decimal balance;
        [ObservableProperty]
        public Bill? bill;
        [ObservableProperty]
        public ObservableCollection<OrderItem> orderItems;

        public BillVM()
        {
            _context = new POSDbContext();
            bills = new ObservableCollection<Bill>();
            orderItems = new ObservableCollection<OrderItem>();
        }
        public BillVM(Bill bill)
        {
            _context = new POSDbContext();
            Bill = bill;
            bills = new ObservableCollection<Bill>();
            OrderItems = Bill.Order.OrderItems;
            LoadBill();
            balance = bill.PaidAmount - bill.TotalAmount;


        }


        private void LoadBill()
        {
            var bills = _context.Bills;
            Bills.Clear();
            foreach (var bill in bills)
            {
                Bills.Add(bill);
            }

        }

     

        [RelayCommand]
        public void PrintBill()
        {
            try
            {
                // Create the document content
                FlowDocument document = new FlowDocument();

                // Add bill details to the document
                Paragraph header = new Paragraph(new Run("Bill Details:"));
                document.Blocks.Add(header);

                Paragraph customer = new Paragraph(new Run($"Customer Name: {Bill.Order.Customer.CustomerName}"));
                document.Blocks.Add(customer);

                Paragraph amount = new Paragraph(new Run($"Total Amount: {Bill.TotalAmount:C}"));
                document.Blocks.Add(amount);

                // Open print dialog
                PrintDialog printDialog = new PrintDialog();
                if (printDialog.ShowDialog() == true)
                {
                    // Print the document
                    printDialog.PrintDocument(((IDocumentPaginatorSource)document).DocumentPaginator, "Bill Printing");
                }

                OrderItems.Clear();

            }
            catch (Exception ex)
            {
                // Handle any exceptions
                Debug.WriteLine($"Error printing bill: {ex.Message}");
                MessageBox.Show("An error occurred while printing the bill.", "Print Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
         
    }
}
