   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5      'clr-namespace:Desktop.VM
Desktop.VM  5          Desktop.View.CustomerView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5      &localclr-namespace:Desktop.View  5      !VMclr-namespace:Desktop.VM  5      
������   � DataContext  5         Desktop.VM.CustomerVM  5   
   .��5      � .+�5   
   �� $��Center=�6   $	��500��61   ���	#FF260753$��Center=�6Q   $	��600��6l    �� RadiusX$ 55.15��6x    �� RadiusY$ 55.15��6�   
�������$	��0.1��6�   �� 5   
   $��/Image/Customer.png��6   $
��Left=�6-   $	��105��6H   $��449,395,0,0q�6U   $	��Top=�6j   $	��105��6�   � 5   
    � RowDefinitions 5      �� 5      $��90 �6    �� 5      $��* �6    .+�5      �� $
��Left=�6   $��Center=�64   $
��40 0q�6O   .+�5      �� $��Customer Detail��6   $��28(�63   $
��Bold"�6A   5      � 5      $��1��6    � ColumnDefinitions 5      �� 5      $
��Auto �6'   �� 5      $��* �6'   .+�5      �� $	��200��6   $��Center=�6)   $��20 20q�6F   .+�5       ��  �� Orientation$ Vertical=�6!   .+�5!      �� $��Customer Name��6$   $	��0 0q�69   �� 5"      $	��0 0q�6@   ��6"   �� *CustomerName+6@   5#      �� 5$      $ Vertical=�6!   .+�5%      �� $��Company Name��6$   $	��0 2q�68   �� 5&      $	��0 0q�6?   ��6"   �� *CompanyName+6?   5'      �� 5(      $ Vertical=�6!   .+�5)      �� $��Address��6$   $	��0 2q�63   �� 5*      $	��0 0q�6;   ��6"   �� *	Address+6;   5+      �� 5,      $ Vertical=�6!   .+�5-      �� $
��City��6$   $	��0 2q�60   �� 5.      $	��0 0q�68   ��6"   �� *City+68   5/      �� 50      $ Vertical=�6!   .+�51      �� $��Contact��6$   $	��0 2q�63   �� 52      $	��0 0q�6;   ��6"   �� *	Contact+6;   53      �� 54      $��Upload Picture��6   $	��0 5q�6]   ��66   �� *UploadImageCommand+6]   �� 55      $��40��6   $��40��6)   $	��Top=�64   $��0 10 0 0q�6L   ��6^   �� *	ImagePath+ �� UpdateSourceTrigger$ PropertyChanged=��� 56      $��
Add/Update��6      ButtonStyle#��[  63   $
��0 20q�6X   $��26��57   @   $��92��6L   ��6   �� *AddCustomerCommand+6L   58      � 59      $��1��6   .+�5:      �� $ 
Horizontal=�62   $	��Top=�6K   ��6!   Z� .+�5;      �� $	��100��6s   ��6"   Z� ��63   �� *
SearchText+$ PropertyChanged=�6s   �� 5<      $��20��6!   $
��Auto��6-   ��6:   �� *SearchCommand+.��5=      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Search=�6*   5>      5?      &   System.Windows.Controls.DataGrid  5@        CustomDataGridStyle#��[ 6   
����� �   AutoGenerateColumns$ False��5A   A   	   CanUserAddRows$	 False��6]   $��0,20,10,118q�6t   ��5@   L   �� *	Customers+$ PropertyChanged=�
 �� SelectedItem
 5A      �� *SelectedCustomer+   Columns 5B      0  *System.Windows.Controls.DataGridTextColumn  5C      ,  &System.Windows.Controls.DataGridColumn   Header$ Id��61      Width5  /System.Windows.Controls.DataGridLengthConverter$
 Auto 6\   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6=   �� *
CustomerId+6\     5D      $ Customer Name��61   $
 Auto 6i    6H   �� *CustomerName+6i     5E      $ Company��61    6B   �� *CompanyName+  5F      $ Contact��61    6B   �� *	Contact+  5G      $ Address��61    6B   �� *	Address+4  .System.Windows.Controls.DataGridTemplateColumn  5I      $ Image��65      CellTemplate 5J   "   �� 5K   &   .R�5L   *   �� $��30��6M   $��30��6X   ��60   �� *	ImagePath+6X   5M   '   5O        5P      $ Actions��65    5Q   "   �� 5R   &   .R�5S   *   �� $ 
Horizontal=�65   .+�5T   .   �� 
����� ���6K   Z� ��6\   �� *!DataContext.EditCustomerCommand+ �� RelativeSource ��  �� AncestorType DataGrid��6�   �� .��5U   2     $
 Edit=�6>   
�������6J   5V   /   �� 5W   .   
����� �$	��2 0q�6�   ��6K   Z� ��6\   �� *#!DataContext.DeleteCustomerCommand+ ��  DataGrid��6�   �� .��5X   2     $ Delete=�6>   
�������6L   5Y   /   5Z   +   5[   '   5]      5_      5`      5b      5c      5d      5e      