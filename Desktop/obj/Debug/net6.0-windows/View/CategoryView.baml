   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5      'clr-namespace:Desktop.VM
Desktop.VM  5          Desktop.View.CategoryView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5      &localclr-namespace:Desktop.View  5      !VMclr-namespace:Desktop.VM  5      
������   � DataContext  5         Desktop.VM.CategoryVM  5   
   .��5      �  � ColumnDefinitions 5   
   �� 5      $
��599* �6   �� 5      $��* �6   .+�5   
   �� $��Center=�6   $	��500��61   
���   �$��Center=�6M   $	��600��6h    �� RadiusX$ 51.054��6t    �� RadiusY$ 51.054��6�   ���	#FFF7F2F2$	��0.1��6�   � 5   
    � RowDefinitions 5      �� 5      $��90 �6    �� 5      $��* �6    .+�5      �� $
��Left=�6   $��Center=�64   $
��40 0q�6O   .+�5      �� $��Category Detail��6   $��28(�63   $
��Bold"�6A   5      � 5      $��1��6    5      �� 5      $
��Auto �6'   �� 5       $��* �6'   .+�5"      �� $	��200��6   $��Center=�6)   $
��20 0q�6F   .+�5#      ��  �� Orientation$ Vertical=�6!   .+�5$      �� $��Category Name��6$   $	��0 5q�69   �� 5%      $	��0 5q�6@   ��6"   �� *CategoryName+6@   5&      �� 5'      $ Vertical=�6!   .+�5(      �� $��Category Id��6$   $	��0 5q�67   �� 5)      $	��0 5q�6>   ��6"   �� *
CategoryId+6>   5*      �� 5,      $��
Add/Update��6      ButtonStyle#��[  63   $��26��5-   C   $��92��6O   $��0 10 0 0q�6Z   ��6   �� *InsertCategoryCommand+6Z   5.      � 5/      $��1��6   .+�50      �� $ 
Horizontal=�6!   $	��Top=�6:   .+�51      �� $	��100��6b   ��6"   �� *
SearchText+ �� UpdateSourceTrigger$ PropertyChanged=���6n   Z� �� 52      $��20��6!   $
��Auto��6-   
����� ���6:   �� *SearchCommand+��6\   Z� .��53      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Search=�6*   54      55      &   System.Windows.Controls.DataGrid  56        CustomDataGridStyle#��[ 6      AutoGenerateColumns$ False��57   A   	   CanUserAddRows$	 False��6]   $��0,20,10,118q�6t   ��56   L   �� *
Categories+$ PropertyChanged=�
 �� SelectedItem
 57      �� *SelectedCategory+   Columns 58      0  *System.Windows.Controls.DataGridTextColumn  59      ,  &System.Windows.Controls.DataGridColumn   Header$ Category Id��61      Width5  /System.Windows.Controls.DataGridLengthConverter$
 auto 6e   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6F   �� *
CategoryId+6e     5:      $ Category Name��61   $
 auto 6i    6H   �� *CategoryName+6i   4  .System.Windows.Controls.DataGridTemplateColumn  5;      $ Actions��65      CellTemplate 5<   "   �� 5=   &   .R�5>   *   �� $ 
Horizontal=�65   .+�5?   .   �� 
����� ���65   Z� ��6\   �� *!DataContext.EditCategoryCommand+ �� RelativeSource ��  �� AncestorType DataGrid��6�   �� .��5@   2     $
 Edit=�6>   
�������6J   5A   /   �� 5B   .   
����� �$	��2 0q�6�   ��65   Z� ��6\   �� *#!DataContext.DeleteCategoryCommand+ ��  DataGrid��6�   �� .��5C   2     $ Delete=�6>   
�������6L   5D   /   5E   +   5F   '   5H      5J      5K      5M      5N      �� 5O   
   $��/Image/category.png��6   $
��Left=�6-   $	��210��6H   $��
23,293,0,0q�6U   $	��Top=�6i   $	��197��6�    J� Opacity$	 0.5Q�6�   5P      5Q      