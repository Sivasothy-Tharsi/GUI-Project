   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5   	   'clr-namespace:Desktop.VM
Desktop.VM  5   	       Desktop.View.AddUserView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   ,localclr-namespace:Desktop.View     5   	   'VMclr-namespace:Desktop.VM     5   	     � Title$  AddUserView��5	   	   $	��500��6   $	��400��6*    � WindowStartupLocation$ CenterScreen=�5
   	    � WindowStyle$
 None=�5   	    � AllowsTransparency$
 True��5   	   
������  � DataContext 5         Desktop.VM.AddUserVM  5   
   .��5      � .+�5   
   �� $��Center=�6   $	��413��61   
���   �$��Center=�6M   $	��400��6h    �� RadiusX$
 39.7��6t    �� RadiusY$
 39.7��6�   ���	#FFF6EFEF6�   �� 5   
   $��Center=�6   $	��412��6-   $��Center=�6:   $	��400��6U   $��/Image/CreateAccount.png��6a    J� Opacity$
 0.25Q�6�   � 5   
    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $��* �6    .+�5      � 	 � Orientation$	 
Horizontal=�6   $
��Left=�61   $��	20 60 0 0q�6L   $��Center=�6_   .+�5      �� $��Register User��6   
���   �$��30(�6D   $
��Bold"�6R   $��Center=�6d   $��10 0 0 0q�6   5      � 5      $��1��6   
 � ColumnDefinitions
 5      �� 5      $��* �6'   �� 5       $��* �6'   .+�5"      � $��1��6   $	 Vertical=�6)   $��Center=�6@   $��0 50 0 0q�6]   .+�5#      �� $��	User Name��6    �� 5$      $��Password��6    $��0 20 0 0q�60   �� 5%      $��Address��6    $��0 20 0 0q�6/   �� 5&      $��Contact��6    $��0 20 0 0q�6/   �� 5'      $
��Role��6    $��0 20 0 0q�6,   �� 5(      $��Image��6    $��0 20 0 0q�6-   5)      � 5*      $��1��6   $	 Vertical=�6,   $
��Left=�6C   $��0 35 0 0q�6^   $	��150��6p   .+�5+      �� $	��150��6   ��6*   �� *NewUser.UserName+�� 5,      $	��150��6   $��0 10 0 0q�6L   ��6*   �� *NewUser.Password+6L   �� 5-      $	��150��6   $��0 10 0 0q�6K   ��6*   �� *NewUser.Address+6K   �� 5.      $	��150��6   $��0 10 0 0q�6K   ��6*   �� *NewUser.Contact+6K   �� 5/      $��0 20 0 0q�6c   ��6   �� *Roles+ �� SelectedItem 6=   �� *SelectedRole+6c   �� 50      $��Upload Image��6   $��0 20 0 0q�6[   ��64   �� *UploadImageCommand+6[   51      52      �� 53         btnLogin#��[  6   $	��Add��67   $��1��6E   $��30��6S   $	��125��6_   $��	0 225 0 0q�6k   ��6~   �� *
AddCommand+54      55      59      