   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5      'clr-namespace:Desktop.VM
Desktop.VM  5          Desktop.View.UserView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5      &localclr-namespace:Desktop.View  5      !VMclr-namespace:Desktop.VM  5      
������   � DataContext  5         Desktop.VM.UserVM  5   
   .��5      � .+�5   
   �� $��Center=�6   $	��500��61   ���	#FF260753$��Center=�6Q   $	��600��6l    �� RadiusX$ 29.783��6x    �� RadiusY$ 29.783��6�   
�������$	��0.1��6�   � 5   
    � RowDefinitions 5      �� 5      $��90 �6    �� 5      $��* �6    .+�5      �� $
��Left=�6   $��Center=�64   $
��40 0q�6O   .+�5      �� $��User Detail��6   $��28(�6/   $
��Bold"�6=   5      � 55      $��1��6    56      �� 57      $��* �6$   .+�59      �� $��/Image/AddUser.png��6   $��-48,102,399,-100q�64    J� Opacity$	 0.7Q�6N   �� 5:       �� Orientation$ Vertical=�6   $��Right=�64   .+�5;      �� $ 
Horizontal=�6!   $��Center=�6:   .+�5<      ��    UserButtonStyle#��[  6!   $��1��6J   $��50��6W   $
��Left=�6�   $��0 0 0 0q�6�   ��6b   �� *AddUserCommand+.��5=      �� $ Vertical=�6)   $��Center=�6@   .+�5>   "   '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ AccountMultipleAdd=�6.   $��Center=�6H   5?      5@      �� 5B      $ 
Horizontal=�6%   $��Right=�6>   $��
160 0 10 0q�6Z   .+�5C      �� $	��100��6w   $��20��6�   $	��Top=�6�   ��6&   Z� ��67   �� *
SearchText+ �� UpdateSourceTrigger$ PropertyChanged=�6�   �� 5D      
����� ���6%   Z� ��6L   �� *SearchCommand+.��5E   "     $ Search=�6.   
���**��6<   5F      5H      5I      &   System.Windows.Controls.DataGrid  5K      $��10q�6   $��0��6+      GridLinesVisibility$
 None=�68   	   HorizontalGridLinesBrush
	 �   �$��Center=�6u   
   AutoGenerateColumns$
 False��5M   =      CanUserAddRows$ False��6Y   
����� �  CustomDataGridStyle#��[ 5N      
������ $��5,1,1,1q�6]    �� AlternationCount$ 2��6w      AreRowDetailsFrozen$
 True��6�   ��5L      �� *Users+$ PropertyChanged=� �� SelectedItem 5M      �� *SelectedUser+   Columns 5O      0  *System.Windows.Controls.DataGridTextColumn  5P      ,  &System.Windows.Controls.DataGridColumn   Header$ User Id��61   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6B   �� *Id+  5Q      $ 	User Name��61    6D   �� *
UserName+  5R      $ Address��61    6B   �� *	Address+  5S      $ Contact��61    6B   �� *	Contact+  5T      $
 Role��61    6?   �� *Role+4  .System.Windows.Controls.DataGridTemplateColumn  5U      $ Actions��65      CellTemplate 5V   "   �� 5W   &   .R�5X   *   �� $ 
Horizontal=�65   .+�5Y   .   �� 
����� �$��23��6�   ��65   Z� ��6\   �� *DataContext.EditUserCommand+ �� RelativeSource ��  �� AncestorType DataGrid��6�   �� .��5Z   2     $
 Edit=�6>   
�������6J   5[   /   �� 5\   .   
����� �$	��2 0q�6�   $��23��6�   ��65   Z� ��6\   �� *DataContext.DeleteCommand+ ��  DataGrid��6�   �� y�6�   �� *	IsAdmin+   BooleanToVisibilityConverter �� 	Converter# [ .��5]   2     $ Delete=�6>   
�������6L   5^   /   5_   +   5`   '   5b      5d      5e      5g      5i      5l      5m      