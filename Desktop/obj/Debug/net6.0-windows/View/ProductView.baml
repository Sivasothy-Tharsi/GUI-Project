   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5      'clr-namespace:Desktop.VM
Desktop.VM  5          Desktop.View.ProductView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5      &localclr-namespace:Desktop.View  5      !VMclr-namespace:Desktop.VM  5        � DataContext  5         Desktop.VM.ProductVM  5   
   .��5      � .+�5   
   �� $��Center=�6   $	��500��61   
���   �$��Center=�6M   $	��600��6h    �� RadiusX$ 30.934��6t    �� RadiusY$ 30.934��6�   ���	#FFF4ECEC$	��0.1��6�   � 5   
    � RowDefinitions 5      �� 5      $��90 �6    �� 5      $��* �6    .+�5      �� $
��Left=�6   $��Center=�64   $
��40 0q�6O   .+�5      �� $��Product Detail��6   $��28(�62   $
��Bold"�6@   5      � 5      $��1��6    � ColumnDefinitions 5      �� 5      $
��Auto �6'   �� 5      $��* �6'   .+�5      �� $
��Auto��6   $��Center=�6*   $
��20 0q�6G   .+�5      ��  �� Orientation$ Vertical=�6!   .+�5      �� $��Product Name��6$   $	��0 5q�68   �� 5       $	��0 5q�6r   ��6"   �� *ProductName+ �� UpdateSourceTrigger$ PropertyChanged=� �� Mode$ TwoWay=�6r   5!      �� 5"      $ Vertical=�6!   .+�5#      �� $��Price��6$   $	��0 5q�61   �� 5$      $	��0 5q�6�   ��6"   �� *Price+$ PropertyChanged=� �� StringFormat$ {0:C}��$ TwoWay=�6�   5%      �� 5&      $ Vertical=�6!   .+�5'      �� $��Quantity��6$   $	��0 5q�64   �� 5(      $	��0 5q�6n   ��6"   �� *
Quantity+$ PropertyChanged=�$ TwoWay=�6n   5)      �� 5*      $ 
Horizontal=�6!   .+�5+      �� $��6��6$   $��Category��61   �� 5,      $��6��6#   $��15��60   	 �� DisplayMemberPath$	 CategoryName��5-   �   ��6   �� *
Categories+$ PropertyChanged=�
 �� SelectedItem
 6_   �� *SelectedCategory+6�   5.      �� 5/      $��Upload Picture��6   ��66   �� *UploadImageCommand+�� 50      $��40��6   $��40��6)   $	��Top=�64   $��0 10 0 0q�6L   ��6^   �� *	ImagePath+$ PropertyChanged=��� 51      $��
Add/Update��6      ButtonStyle#��[  63   $��26��52   ?   $��92��6K   $��0 10 0 0q�6V   ��6   �� *AddProductCommand+6V   53      � 54      $��1��6   .+�55      �� $ 
Horizontal=�6!   $	��Top=�6:   .+�56      �� $	��100��6s   ��6"   Z� ��63   �� *
SearchText+$ PropertyChanged=�6s   �� 57      
����� �
�������$��20��6[   $
��Auto��6g   ��6!   Z� ��6t   �� *SearchCommand+.��58      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Search=�6*   59      5:      &   System.Windows.Controls.DataGrid  5;        CustomDataGridStyle#��[ 6      AutoGenerateColumns$ False��5<   @      CanUserAddRows$ False��6\   $��0,20,10,118q�6s   ��5;   L   �� *
Products+$ PropertyChanged=�
 5<      �� *SelectedProduct+   Columns 5=      0  *System.Windows.Controls.DataGridTextColumn  5>      ,  &System.Windows.Controls.DataGridColumn   Header$ Id��61      Width5  /System.Windows.Controls.DataGridLengthConverter$
 auto 6[   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6=   �� *	ProductId+6[     5?      $
 Name��61   $
 Auto 6_    6?   �� *ProductName+6_     5@      $ Price��61   $
 auto 6^    6@   �� *	UnitPrice+6^     5A      $ Quantity��61   $
 auto 6g    6C   �� *QuantityInStock+6g   4  .System.Windows.Controls.DataGridTemplateColumn  5B      $ Image��65      CellTemplate 5C   "   �� 5D   &   .R�5E   *   �� $��30��6M   $��30��6X   ��60   �� *	ImagePath+6X   5F   '   5H        5I      $ Actions��65    5J   "   �� 5K   &   .R�5L   *   �� $ 
Horizontal=�65   .+�5M   .   �� 
����� �
���������65   Z� ��6p   �� * DataContext.EditProductCommand+ �� RelativeSource ��  �� AncestorType DataGrid��6�   �� .��5N   2     $
 Edit=�6>   
�������6J   5O   /   �� 5P   .   
����� �
�������$	��2 0q�6�   ��65   Z� ��6o   �� *" DataContext.DeleteProductCommand+ ��  DataGrid��6�   �� .��5Q   2     $ Delete=�6>   
�������6L   5R   /   5S   +   5T   '   5V      5X      5Y      5[      5\      5]      5^      