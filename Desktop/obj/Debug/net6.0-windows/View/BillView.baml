   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5   	   'clr-namespace:Desktop.VM
Desktop.VM  5   	       Desktop.View.BillView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   &localclr-namespace:Desktop.View  5   	   !VMclr-namespace:Desktop.VM  5   	     � Title$  BillView��5
   	   $	��500��6   $	��400��6'    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    � 
ResizeMode$ NoResize=�5   	    � AllowsTransparency$
 True��5   	   
������  � DataContext 5         Desktop.VM.BillVM  5   
   .��5      � .+�5   
   �� $��Center=�6   $	��500��61   
���   �$��Center=�6M   $	��400��6h   
������� �� RadiusX$ 29.693��6�    �� RadiusY$ 29.693��6�   � 5   
    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $
��Auto �6    .+�5      � $��0��6   	 � ColumnDefinitions	 5      �� 5      $
��Auto �6'   �� 5       $
��Auto �6'   .+�5"      � $��0��6   	 5#      �� 5$      $
��Auto �6+   �� 5%      $
��Auto �6+   .+�5'      �� 
 �� Orientation$
 Vertical=�6!   $��20q�68   .+�5(      �� $
 Vertical=�6%   .+�5)      �� $��Invoice��6(   $��30(�67   �� 5*      $��Invoice detail��6(   5+      �� 5,      $
 
Horizontal=�6%   $
��0 20q�6>   .+�5-      �� $��	BillId : ��6(   �� 5.      ��6(   �� *Bill.BillId+5/      �� 51      $
 
Horizontal=�6%   .+�52      �� $��Date : ��6(   �� 53      ��6(   �� *Bill.Order.OrderDate+54      55      �� 56      $
 Vertical=�6!   $��20 50q�68   $��1��6G   .+�57      �� $
 Vertical=�6%   $��20 20q�6<   .+�58      �� $
 
Horizontal=�6)   .+�59   "   �� $��Customer name : ��6,   �� 5:   "   $	��150��6^   ��6,   �� *" Bill.Order.Customer.CustomerName+6^   5;      5<      5>      5@      5B      &   System.Windows.Controls.DataGrid  5C      $��1��6      CustomDataGridStyle#��[  6$      CanUserAddRows$ False��6Q      AutoGenerateColumns$ False��6h   $��Center=�5D   `   ��6   �� *
OrderItems+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5E      4  .System.Windows.Controls.DataGridTemplateColumn  5F      ,  &System.Windows.Controls.DataGridColumn   Header$ Image��6-      CellTemplate 5G      �� 5H      .R�5I   "   �� ��6(   �� *Product.ImagePath+5J      5L      0  *System.Windows.Controls.DataGridTextColumn  5M      $ Quantity��6)   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   �� *
Quantity+  5N      $ Total price��6)    6>   �� *
TotalPrice+5P      � 5Q      $��2��6   $��20 50q�6    	 5R      �� 5S      $
��Auto �6'   �� 5T      $
��Auto �6'   .+�5V      �� $
 Vertical=�6   $��10q�64   .+�5W      �� $��Total cost : ��6    �� 5X      $��Paid amount : ��6    �� 5Y      $��
Balance : ��6    5Z      �� 5[      $
 Vertical=�6   $��1��64   $
��20 0q�6D   .+�5\      �� ��6    �� *Bill.TotalAmount+�� 5]      ��6    �� *Bill.PaidAmount+�� 5^      ��6    �� *	Balance+5_      5`      �� 5a      $��3��6   $#��Thank you for your purchasing��6%   $��Center=�6J   $��Ink Free)�6g   $
��Bold"�6}   �� 5b      $��3��6   $��Right=�6"   $��20 20q�6>   $��40��6M   $��40��6Y   
������ ��6}   �� *PrintBillCommand+.��5c      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Printer=�6   $��35��6-   $��35��69   5d      5e      5f      5g      