   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5      'clr-namespace:Desktop.VM
Desktop.VM  5          Desktop.View.Or   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      &localclr-namespace:Desktop.View  5      !VMclr-namespace:Desktop.VM  5      
������   � DataContext  5        Desktop.VM.VMOrder  5   
   .��5      � .+�5   
   �� 
�������
������  �� CornerRadius$ 20��6>   � 5   
    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $��* �6    .+�5      �� $��Order��6   $��50(�6%   $��Center=�63   � 5      $��1��6    � ColumnDefinitions 5      �� 5      $
��Auto �6'   �� 5      $
��Auto �6'   .+�5      � $��0��6    5      �� 5      $
��Auto �6(   �� 5      $
��Auto �6(   .+�5!      ��  �� Orientation$ Vertical=�6!   .+�5"      �� $ 
Horizontal=�6%   $��50 20q�6>   .+�5#      �� $��Category��6(   $��Center=�68   �� 5$      
����� �$ 15��6<   $��1q�6O   $
��10 0q�6c   ._�5%   "   �� $
��Auto��6<   $
��10 0q�5&   '   
������ 
������  �� DisplayMemberPath$ CategoryName��5'   '   ��5%   +   Z� ��6I   �� *
Categories+ �� UpdateSourceTrigger$ PropertyChanged=� �� SelectedItem 6�   �� *SelectedCategory+5'   '   5(      �� 5)      $��Basket��6%   $
��20 0q�66   ��6D   �� *SelectCommand+5*      �� 5+      $ 
Horizontal=�6%   $��50 20q�6>   .+�5,      �� $��Product��6(   $��Center=�67   �� 5-      
����� �$ 15��6<   $��1q�6O   $
��10 0q�6c   ._�5.   "   �� $
��Auto��6<   $
��10 0q�5/   '   
������ 
������ $ ProductName��50   '   ��5.   +   Z� ��6I   �� *FilteredProducts+$ PropertyChanged=� 6�   �� *SelectedProduct+50   '   51      �� 52      $	��Qnt��6(   $��Center=�63   $
��10 0q�6N   �� 53      
����� �$��1q�6<   $ 10��6P   ._�54   "   �� 
������ 
������ $��50��6�   $��Center=�6�   $	��0 0q�6�   $��Center=�6�   ��6]   Z� ��6n   �� *
Quantity+6�   55      57      �� 58      $ 
Horizontal=�6%   $��50 20q�6>   .+�59      �� $��Discount rate��6(   $��Center=�6=   $	��0 0q�6X   �� 5:      
����� �$��1q�6<   $ 10��6P   $
��10 0q�6b   ._�5;   "   �� 
������ 
������ $��50��6�   $��Center=�6�   $	��0 0q�6�   $��Center=�6�   ��6]   Z� ��6n   �� *DiscountRate+6�   5<      5=      5?      &   System.Windows.Controls.DataGrid  5@         CustomDataGridStyle#��[  6      CanUserAddRows$ False��6L   	   AutoGenerateColumns$	 False��6c   $��1��5B   B   $	��300��6O   ��5A      �� *
OrderItems+$ PropertyChanged=� 5B      �� *SelectedOrderItem+
   Columns
 5C      4  .System.Windows.Controls.DataGridTemplateColumn  5D      ,  &System.Windows.Controls.DataGridColumn   Header$ Image��65      CellTemplate 5E   "   �� 5F   &   .R�5G   *   �� ��60   �� *Product.ImagePath+5H   '   5J      0  *System.Windows.Controls.DataGridTextColumn  5K      $ Quantity��61   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6C   �� *
Quantity+  5L      $ Total price��61    6F   �� *
TotalPrice+  5M      $ Actions��65    5N   "   �� 5O   &   .R�5P   *   �� $ 
Horizontal=�65   .+�5Q   .   �� 
����� �
���������65   Z� ��6o   �� *" DataContext.EditOrderItemCommand+ �� RelativeSource ��  �� AncestorType DataGrid��6�   �� .��5R   2   '  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 Edit=�6>   5S   /   �� 5T   .   
����� �
�������$	��2 0q�6�   ��65   Z� ��6o   �� *$"DataContext.DeleteOrderItemCommand+ ��  DataGrid��6�   �� .��5U   2     $ Delete=�6>   5V   /   5W   +   5X   '   5Z      5\      5]      � 5^      $��1��6   $	��Top=�6'   $
��5 50q�6?   .+�5_      �� .+�5`      �� $ 
Horizontal=�6%   .+�5a      �� $��Total :��6$   $��18(�66   $��Center=�6D   $��Bottom=�6h   �� 5b      $��Center=�6A   $��18(�6e   $��50��6s   $
��20 0q�6~   ��6&   �� *	TotalCost+6~   5c      �� 5d      $ 
Horizontal=�6%   .+�5e      �� $��
Discount :��6$   $��18(�69   $��Center=�6G   $��Bottom=�6k   �� 5f      $��Center=�6@   $��18(�6d   $��50��6r   $
��20 0q�6}   ��6&   �� *
Discount+6}   5g      �� 5h      $ 
Horizontal=�6%   .+�5i      �� $��Total��6$   $��18(�64   $��Center=�6B   $��Bottom=�6f   �� 5j      $��Center=�6B   $��18(�6f   $��50��6t   $
��20 0q�6   ��6&   �� *
PaidAmount+6   5k      5l      5m      5n      5p      5q      5r      