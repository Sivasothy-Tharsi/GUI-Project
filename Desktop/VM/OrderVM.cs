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
using System.Printing;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Media;

namespace Desktop.VM
{
    public partial class OrderVM : ObservableObject
    {
        private readonly POSDbContext _context;

        private ObservableCollection<Customer> _customers;
        public ObservableCollection<Customer> Customers
        {
            get => _customers;
            set => SetProperty(ref _customers, value);
        }

        private Customer _selectedCustomer;
        public Customer SelectedCustomer
        {
            get => _selectedCustomer;
            set => SetProperty(ref _selectedCustomer, value);
        }
        private ObservableCollection<Product> _products;
        public ObservableCollection<Product> Products
        {
            get => _products;
            set => SetProperty(ref _products, value);
        }

        private Order _order;
        public Order Order
        {
            get => _order;
            set => SetProperty(ref _order, value);
        }

        private ObservableCollection<OrderItem> _orderItems;
        public ObservableCollection<OrderItem> OrderItems
        {
            get => _orderItems;
            set => SetProperty(ref _orderItems, value);
        }

        private ObservableCollection<OrderItem> _orders;
        public ObservableCollection<OrderItem> Orders
        {
            get => _orders;
            set => SetProperty(ref _orders, value);
        }

        private OrderItem _selectedOrderItem;
        public OrderItem SelectedOrderItem
        {
            get => _selectedOrderItem;
            set => SetProperty(ref _selectedOrderItem, value);
        }

        private Product _selectedProduct;
        public Product SelectedProduct
        {
            get => _selectedProduct;
            set => SetProperty(ref _selectedProduct, value);
        }

        private decimal _totalAmount;
        public decimal TotalAmount
        {
            get => _totalAmount;
            set => SetProperty(ref _totalAmount, value);
        }

        private decimal _discountPercentage;
        public decimal DiscountPercentage
        {
            get => _discountPercentage;
            set => SetProperty(ref _discountPercentage, value);
        }

        private int _quantity;
        public int Quantity
        {
            get => _quantity;
            set => SetProperty(ref _quantity, value);
        }

        private RelayCommand _addToOrderCommand;
        public RelayCommand AddToOrderCommand => _addToOrderCommand ??= new RelayCommand(AddToOrder);

        private RelayCommand _editOrderItemCommand;
        public RelayCommand EditOrderItemCommand => _editOrderItemCommand ??= new RelayCommand(EditOrderItem);

        private RelayCommand _deleteOrderItemCommand;
        public RelayCommand DeleteOrderItemCommand => _deleteOrderItemCommand ??= new RelayCommand(DeleteOrderItem);


        private RelayCommand _placeOrderCommand;
        public RelayCommand PlaceOrderCommand => _placeOrderCommand ??= new RelayCommand(PlaceOrder);

        public OrderVM()
        {
            _context = new POSDbContext();
            Customers = new ObservableCollection<Customer>(_context.Customers.ToList());
            Products = new ObservableCollection<Product>(_context.Products.ToList());
          //  Order = new Order();
            OrderItems = new ObservableCollection<OrderItem>();
            Orders= new ObservableCollection<OrderItem>();
        }


        private void AddToOrder()
        {
            if (SelectedProduct != null && Quantity > 0)
            {
                // Check if the quantity is available in stock
                if (SelectedProduct.QuantityInStock >= Quantity)
                {
                    var searchOrderItem = OrderItems.FirstOrDefault(p => p.Product == SelectedProduct);
                    if (searchOrderItem == null)
                    {
                        OrderItem orderItem = new OrderItem
                        {
                            Product = SelectedProduct,
                            Quantity = Quantity,
                            TotalPrice = SelectedProduct.UnitPrice ?? 0 * Quantity,
                        };
                        // Reduce the stock quantity
                        SelectedProduct.QuantityInStock -= Quantity;

                        OrderItems.Add(orderItem);
                        TotalAmount= CalculateTotalAmount();
                        SelectedProduct = null;
                        Quantity = 0;
                    }
                    else
                    {
                        SelectedProduct.QuantityInStock -= Quantity;

                        OrderItem orderItem = new OrderItem
                        {
                            Product = SelectedProduct,
                            Quantity = searchOrderItem.Quantity + Quantity,
                            TotalPrice = SelectedProduct.UnitPrice ?? 0 * Quantity,
                        };
                        int index=OrderItems.IndexOf(searchOrderItem);
                        OrderItems.RemoveAt(index);
                        OrderItems.Insert(index, orderItem);
                        TotalAmount= CalculateTotalAmount();
                        
                        
                    }
                   

                  
                }
                else
                {
                    MessageBox.Show("Insufficent stock quantity");
                    SelectedProduct = null;
                    Quantity = 0;
                }

            }
            else
            {
                // Show an error message or perform necessary actions when the quantity is not available in stock
                MessageBox.Show(" quantity is zero");
                SelectedProduct = null;
                Quantity = 0;
            }
        }

        private void EditOrderItem()
        {
            // Create and initialize the OrderItemEditViewModel with the selected order item details


            // Show the OrderItemEditView and pass the OrderItemEditViewModel to it
            if (SelectedOrderItem != null && SelectedOrderItem.Product != null)
            {
                OrderItem OrderItem1 = SelectedOrderItem;

                var vm = new edit_orderVM(OrderItem1);
                SelectedOrderItem.Product.QuantityInStock += SelectedOrderItem.Quantity;
                OrderItems.Remove(SelectedOrderItem);
                var window = new EditOrderItemView(vm);

                window.ShowDialog();
                if (vm.NewItem != null && vm.NewItem.Product != null)
                {
                    OrderItems.Add(vm.NewItem);
                    vm.NewItem.Product.QuantityInStock -= vm.NewItem.Quantity;
                }


                 TotalAmount = CalculateTotalAmount();
            }
            else
            {
                MessageBox.Show("Please Select the order item", "Warning!");
            }
        }


        private void DeleteOrderItem()
        {
            if (SelectedOrderItem != null && SelectedOrderItem.Product != null)
            {
                SelectedOrderItem.Product.QuantityInStock += SelectedOrderItem.Quantity;

                OrderItems.Remove(SelectedOrderItem);

                // Increase the product quantity in stock

                // Update the total amount
                TotalAmount = CalculateTotalAmount();
            }
        }


        private decimal CalculateTotalAmount()
        {
            decimal total = 0;

            foreach (var orderItem in OrderItems)
            {
                decimal itemPrice = orderItem.Product?.UnitPrice ?? 0;
                int quantity = orderItem.Quantity;
                decimal subtotal = itemPrice * quantity;

                orderItem.TotalPrice = subtotal;

                total += subtotal;
            }

            return total;
        }

        private void PlaceOrder()
        {
            if (SelectedCustomer != null)
            {
                
                    Order order = new Order()
                    {
                        Customer = SelectedCustomer,
                        OrderItems = OrderItems,
                    };
                

                    decimal totalAmount = CalculateTotalAmount();
                    decimal discountAmount = totalAmount * (DiscountPercentage / 100);
                    decimal discountedTotal = totalAmount - discountAmount;


                    Bill bill = new Bill
                    {
                        Order = order,
                        TotalAmount = totalAmount,
                        Discount = DiscountPercentage,
                        PaidAmount = discountedTotal // Set the amount to be paid after discount
                    };

                   

                    TotalAmount = 0;

                    // Print the bill
                    PrintBill(bill);

                    // Clear the order details
                    _context.Bills.Add(bill);
                    _context.SaveChanges();

                    

            }
            else
            {
                MessageBox.Show("Select a customer");
            }
        }

        

        private void PrintBill(Bill bill)
        {

            // Create a StringBuilder to build the bill content
            StringBuilder billBuilder = new StringBuilder();

            // Header
            billBuilder.AppendLine("------------------------------------");
            billBuilder.AppendLine("            ORDER BILL              ");
            billBuilder.AppendLine("------------------------------------");
            billBuilder.AppendLine();

            // Customer Name
            billBuilder.AppendLine($"Customer Name: {bill.Order?.Customer?.CustomerName}");
            billBuilder.AppendLine();

            // Order Items
            billBuilder.AppendLine("Order Items:");
            billBuilder.AppendLine();
            foreach (var orderItem in OrderItems)
            {
                billBuilder.AppendLine($"{orderItem.Product?.ProductName} x {orderItem.Quantity} - {orderItem.TotalPrice:C}");
            }
            billBuilder.AppendLine();

            // Total Amount
            billBuilder.AppendLine($"Total Amount: {bill.TotalAmount:C}");

            // Discount
            billBuilder.AppendLine($"Discount: {bill.Discount}%");

            // Amount need to pay
            billBuilder.AppendLine($"Discount: {bill.PaidAmount}%");
            // Footer
            billBuilder.AppendLine();
            billBuilder.AppendLine("------------------------------------");

            string formattedBill = billBuilder.ToString();

            MessageBoxResult boxResult = MessageBox.Show(formattedBill, "Order Bill", MessageBoxButton.OKCancel);
            if ( boxResult == MessageBoxResult.OK )
            {
                //    // Display the bill in a message box
                // MessageBox.Show(formattedBill, "Order Bill");

                // Ask the user if they want to save the bill
                MessageBoxResult result = MessageBox.Show("Do you want to save the bill?", "Save Bill", MessageBoxButton.YesNo, MessageBoxImage.Question);
                // Create a PrintDialog for printing the bill
                if (result == MessageBoxResult.Yes)
                {
                    PrintDialog printDialog = new PrintDialog();

                    // Set the page settings
                    printDialog.PrintTicket.PageMediaSize = new PageMediaSize(PageMediaSizeName.ISOA4);
                    printDialog.PrintTicket.PageOrientation = PageOrientation.Portrait;

                    // Specify the bill size (e.g., 10cm x 15cm)
                    double billWidth = 10; // in centimeters
                    double billHeight = 15; // in centimeters

                    // Convert the bill size from centimeters to pixels
                    double billWidthInPixels = billWidth / 2.54 * 96; // assuming 96 dpi
                    double billHeightInPixels = billHeight / 2.54 * 96; // assuming 96 dpi

                    // Create a FlowDocument to host the bill content
                    FlowDocument flowDocument = new FlowDocument();
                    flowDocument.Background = Brushes.White;
                    flowDocument.FontSize = 12;
                    flowDocument.PageWidth = billWidthInPixels;
                    flowDocument.PageHeight = billHeightInPixels;

                    // Create a Paragraph to hold the bill text
                    Paragraph paragraph = new Paragraph();
                    paragraph.Margin = new Thickness(0);
                    paragraph.Inlines.Add(new Run(formattedBill));

                    // Add the Paragraph to the FlowDocument
                    flowDocument.Blocks.Add(paragraph);

                    // Set the FlowDocument as the document to be printed
                    printDialog.PrintDocument(((IDocumentPaginatorSource)flowDocument).DocumentPaginator, "Order Bill");

                    // Save the bill to a specific folder using SaveFileDialog
                    SaveFileDialog saveFileDialog = new SaveFileDialog();
                    saveFileDialog.Title = "Save Bill";
                    saveFileDialog.FileName = "OrderBill";
                    saveFileDialog.DefaultExt = ".txt";
                    saveFileDialog.Filter = "Text files (*.txt)|*.txt";

                    // Set the initial directory
                    saveFileDialog.InitialDirectory = "C:\\Users\\tharsi\\Desktop\\data_mine\\Desktop\\Desktop\\Bills"; // Replace with your desired folder path

                    // Show the SaveFileDialog and save the bill if the user chooses a file
                    if (saveFileDialog.ShowDialog() == true)
                    {
                        string filePath = saveFileDialog.FileName;

                        // Save the bill to the selected file path
                        File.WriteAllText(filePath, formattedBill);

                    }
                    OrderItems.Clear();
                    Orders.Clear();

                    Order = new Order();
                    OrderItems = new ObservableCollection<OrderItem>();



                }
                else
                {
                    return;
                }
            }
            else if(boxResult==MessageBoxResult.Cancel)
            {
                TotalAmount = CalculateTotalAmount();
                return;
            }

        }

    }


}



