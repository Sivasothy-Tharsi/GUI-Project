   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5      'clr-namespace:Desktop.VM
Desktop.VM  5          Desktop.View.OrderView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      &localclr-namespace:Desktop.View  5      !vmclr-namespace:Desktop.VM  5      
������   � DataContext  5         Desktop.VM.OrderVM  5   
   .��5      � .+�5   
   �� 
�������
������  �� CornerRadius$ 20��6>   � 5   
    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $
��Auto �6    �� 5      $��* �6    .+�5      ��  �� Orientation$ 
Horizontal=�6   $��10q�62   .+�5      �� )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Select Customer��6g    &  "MaterialDesignFloatingHintComboBox#��[  6�    �� DisplayMemberPath$ CustomerName��6�   ��6   �� *	Customers+ �� SelectedItem 6=   �� *SelectedCustomer+6�   5      �� 5      $��1��6   $ 
Horizontal=�6&   $��10q�6?   .+�5      �� $ Select a product��6   #��[  6A   $ ProductName��6�   $	��200��6�   $��0 0 10 0q�6�   ��6}   �� *
Products+ 6�   �� *SelectedProduct+6�   �� 5      $ Quantity��6    % !MaterialDesignFloatingHintTextBox#��[ 68   $	��100��6�   $��0 0 10 0q�6�   ��6s   �� *
Quantity+6�   �� 5      $��Add to Order��6   $
��Auto��6V   ��60   �� *AddToOrderCommand+6V   5      �� 5      $��2��6   $ Vertical=�6&   .+�5       &   System.Windows.Controls.DataGrid  $��1��6      AutoGenerateColumns$ False��6v   $��10q�6�      CanUserAddRows$ False��6�   	   CanUserDeleteRows$	 False��6�   ��6(   �� *
OrderItems+ 6K   �� *SelectedOrderItem+
   Columns
 5!      0  *System.Windows.Controls.DataGridTextColumn  5"      ,  &System.Windows.Controls.DataGridColumn   Header$ Product��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6f   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6>   �� *Product.ProductName+6f     5#      $ Quantity��6-   $ * 6\    6?   �� *
Quantity+6\     5$      $ Subtotal��6-   $ * 6t    6?   �� *
TotalPrice+ �� StringFormat$ {0:C}��6t   4  .System.Windows.Controls.DataGridTemplateColumn  5%      $ Actions��61      CellTemplate 5&      �� 5'   "   .R�5(   &   �� $ 
Horizontal=�61   .+�5)   *   �� 
����� ���6G   Z� ��6X   �� *" DataContext.EditOrderItemCommand+ �� RelativeSource ��  �� AncestorType DataGrid��6�   �� .��5*   .   '	  !MaterialDesignThemes.Wpf.PackIcon	   	  Kind$
 Edit=�6:   
�������6F   5+   +   �� 5,   *   
����� �$	��2 0q�6�   ��6G   Z� ��6X   �� *$"DataContext.DeleteOrderItemCommand+ ��  DataGrid��6�   �� .��5-   .   	  $ Delete=�6:   
�������6H   5.   +   5/   '   50   #   52      54      �� 55      $ 
Horizontal=�6   $��Right=�66   .+�56      �� $ Total amonut��6Q   #��[ 6s   $��20(�6�   $��Center=�6�    �� 
IsReadOnly$
 True��6�   ��6   �� *TotalAmount+$ {0:f}��6�   �� 57      $��Right=�6   $ Discount��6t   #��[ 6�   $��20(�6�   $
��30 0q�6�   ��6:   �� *DiscountPercentage+$ {0:f2}��6�   58      �� 59      $��Place Order��6   ��5:      �� *PlaceOrderCommand+5;      5=      5>      5?      