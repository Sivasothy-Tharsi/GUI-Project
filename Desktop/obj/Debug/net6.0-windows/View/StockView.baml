   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5      'clr-namespace:Desktop.VM
Desktop.VM  5          Desktop.View.StockView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:Desktop.View     5      'vmclr-namespace:Desktop.VM     5        � DataContext  5
         Desktop.VM.StockVM  5   
   .��5      � .+�5   
   �� $��Center=�6   $	��500��61   
������ $	��600��6S    �� RadiusX$
 35.9��6_    �� RadiusY$
 35.9��6n   $��0��6}   
�������6�   � 5   
    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    .+�5      �� $��0��6    �� Orientation$ 
Horizontal=�6&   $��10q�6?   $��Center=�6K   .+�5      �� 
���   �$��2q�6-   $	��Top=�6A   $	��100��6Y   $��10 50q�6f   $	��100��6u    �� CornerRadius$ 20,10,20,10��6�   ��5      �� 5       �� 
StartPoint$ 0.1,0.8&�6.    �� EndPoint$ 0.1,0.2&�6C   .��5      �  � Color$ DarkCyan��6+   	 � Offset$		 0.9Q�6=   � 5      $ 
WhiteSmoke��6+   $		 0.1Q�6>   5      ._�5      �� $ Vertical=�6!   
������ $��0 10 0 0q�6Q   $��Center=�6c   .+�5      �� $��Product��6$   $��Center=�63   $��20(�6P   $��Amiri)�6^   $
��Bold"�6q   �� 5      $��Center=�6>   $��20(�6[   $��Amiri)�6i   $
��Bold"�6|   ��6$   �� *
ProCount+6|   5      5       �� 5"      
���   �$��2q�6-   $	��Top=�6A   $	��100��6Y   $��10 50q�6f   $	��100��6u   $ 20,10,20,10��6�   ��5#      �� 5$      $ 0.1,0.8&�6.   $ 0.1,0.2&�6C   .��5%      � $ DarkCyan��6+   $		 0.9Q�6<   � 5&      $ 
WhiteSmoke��6+   $		 0.1Q�6>   5'      ._�5)      �� $ Vertical=�6!   
������ $��0 10 0 0q�6Q   $��Center=�6c   .+�5*      �� $��Category��6$   $��Center=�64   $��20(�6Q   $��Amiri)�6_   $
��Bold"�6r   �� 5+      $��Center=�6>   $��20(�6[   $��Amiri)�6i   $
��Bold"�6|   ��6$   �� *
CatCount+6|   5,      5-      �� 5/      
���   �$��2q�6-   $	��Top=�6A   $	��100��6Y   $��10 50q�6f   $	��100��6u   $ 20,10,20,10��6�   ��50      �� 51      $ 0.1,0.8&�6.   $ 0.1,0.2&�6C   .��52      � $ DarkCyan��6+   $		 0.9Q�6<   � 53      $ 
WhiteSmoke��6+   $		 0.1Q�6>   54      ._�56      �� $ Vertical=�6!   
������ $��0 10 0 0q�6Q   $��Center=�6c   .+�57      �� $��Purchase��6$   $��Center=�64   $��20(�6Q   $��Amiri)�6_   $
��Bold"�6r   �� 58      $��Center=�6?   $��20(�6\   $��Amiri)�6j   $
��Bold"�6}   ��6$   �� *	BillCount+6}   59      5:      5;      �� 5=      $��1��6   $ 
Horizontal=�6&   $
��20 0q�6?   $��Center=�6M   .+�5>      �� 
���   �$��1q�6-   ._�5?      �� $ Vertical=�6!   .+�5@      �� $��Product detail��6$   $��Center=�6:   &   System.Windows.Controls.DataGrid  5A         CustomDataGridStyle#��[  6#   
   CanUserAddRows$
 False��6P      AutoGenerateColumns$ False��6g      CanUserDeleteRows$ False��6�   $��20q�6�   ��5B      �� *
Products+ �� UpdateSourceTrigger$ PropertyChanged=�   Columns 5C      0  *System.Windows.Controls.DataGridTextColumn  5D   "   ,  &System.Windows.Controls.DataGridColumn   Header$ Product��65   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6F   �� *ProductName+  5E   "   $ Quantity��65    6G   �� *QuantityInStock+5G      5H      5I      �� 5K      
���   �$��1q�6-   ._�5L      �� $ Vertical=�6!   .+�5M      �� $��Category detail��6$   $��Center=�6;     5N      #��[  6#   $
 False��6P   $ False��6g   $��20q�5O   `   ��6   �� *
Categories+$ PropertyChanged=� 5P        5Q   "   $ Category��65    6G   �� *CategoryName+5S      5T      5U      �� 5W      
���   �$��1q�6-   ._�5X      �� $ Vertical=�6!   .+�5Y      �� $��Invoice detail��6$   $��Center=�6:     5Z      #��[  6#   $
 False��6P   $ False��6g   $��20q�5[   [   ��6   �� *Bills+$ PropertyChanged=� 5\        5]   "   $ Id��65    6A   �� *BillId+  5^   "   $ Customer��65    6G   �� *Order.Customer.CustomerName+  5_   "   $ 
Total cost��65    6I   �� *TotalAmount+5b      5c      5e      5g      5h      5j      5k      