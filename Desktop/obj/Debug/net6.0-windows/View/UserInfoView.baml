   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5      'clr-namespace:Desktop.VM
Desktop.VM  5          Desktop.View.UserInfoView   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      &localclr-namespace:Desktop.View  5      !VMclr-namespace:Desktop.VM  5      
������   � DataContext  5         Desktop.VM.UserinfoVM  5   
   .��5      � .+�5   
   �� 
������� �� CornerRadius$ 20��6$   � 5   
    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $��* �6    .+�5      ��  �� Orientation$ Vertical=�6   .+�5      �� $��	User Info��6   $��Center=�6-   $��10q�6J   $��30(�6V    J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5         Color$ DarkCyan��6+      ShadowDepth$ 3Q�6<      
BlurRadius$ 2Q�6L      Opacity$	 0.7Q�6[   	   	Direction$	 0Q�6i   ��5      �� 5      
 �� 
StartPoint$	
 0,0&�6.    �� EndPoint$	 1,0&�6?   .��5      �  � Offset$ 0Q�6+    � Color$ DarkCyan��66   � 5      $ 1Q�6+   $ DarkCyan��66   5       5#      �� 5$      
����� �$��1q�60   $��80��6D   $��80��6O   $ 10��6[   ._�5%      �� ��6   �� *	ImagePath+5&      �� 5)      $��Center=�6;   $��18(�6X   ��6   �� *User.UserName+6X   �� 5*      $��Center=�67   $��18)�6T   ��6   �� *	User.Role+6T   �� 5+      $��Profile��6   $��75��6+   
����� �
���������66   �� *ProfileChangeCommand+��6_   Z� 6�   5,      � 5-      $��1��6    � ColumnDefinitions 5.      �� 5/      $��2* �6'   �� 50      $��2* �6'   �� 51      $��* �6'   .+�53      � $��0��6   .+�54      �� 
�������$ 	20 0 0 20��66   $	��285��6O   �� 55      .+�56      �  � Points �    �� �� ;X��
����� �$	��Top=�6O   $��Center=�6g    J� Opacity$
 0.08Q�6�   A� 57      $��60��6"   $��60��6-   
����� �$
 0.09Q�6I   $��	150 0 0 0q�6X   58      �� 59      $ Vertical=�6!   $��Center=�68   $��Center=�6U   .+�5:      �� $��	User name��6$   �� 5;      $��Address��6$   $
��0 20q�63   �� 5<      $��Contact��6$   �� 5=      $��Password��6$   $
��0 20q�64   5>      5?      � 5@      $��1��6   .+�5A      �� 
�������$ 0 0 20 0��66   $	��285��6N   �� 5B      .+�5C      �  �    �� �� ;X��
����� �$	��Top=�6O   $��Center=�6g   $
 0.08Q�6�   A� 5D      $��60��6"   $��60��6-   
����� �$
 0.09Q�6I   $��	150 0 0 0q�6X   5E      �� 5G      $ Vertical=�6!   $��Center=�68   $��Center=�6U   .+�5H      �� $	��100��6A   ��6"   �� *User.UserName+ �� 
IsReadOnly 6M   �� *IsuserNameReadOnly+�� 5I      $
��0 10q�6@   ��6"   �� *User.Address+ 6N   �� *IsAddressReadOnly+�� 5J      ��6"   �� *User.Contact+ 6@   �� *IsContactReadOnly+�� 5K      $
��0 10q�6A   ��6"   �� *User.Password+ 6O   �� *IsPasswordReadOnly+5L      5M      � 5N      $��2��6   .+�5O      �� 
�������$ 0 0 20 0��66   $	��285��6N   �� 5P      .+�5Q      �  �    �� �� ;X��
����� �$	��Top=�6O   $��Center=�6g   $
 0.08Q�6�   A� 5R      $��60��6"   $��60��6-   
����� �$
 0.09Q�6I   $��50 0 0 0q�6X   5S      �� 5U      $ Vertical=�6!   $��Center=�68   $��Center=�6U   .+�5V      �� $��50��6�   $��20��6�   
����� �
�������$
��0 10q�6�   ��6!   �� *EditButtonContent+��6G   �� *EditSaveUserNameCommand+��6s   Z� 6�   �� 5W      $��50��6�   $��20��6�   
����� �
�������$	��0 5q�6�   ��6!   �� *EditButtonAddressContent+��6N   �� *EditSaveAddressCommand+��6y   Z� 6�   �� 5X      $��50��6�   $��20��6�   
����� �
�������$
��0 10q�6�   ��6!   �� *EditButtonContactContent+��6N   �� *EditSaveContactCommand+��6y   Z� 6�   �� 5Y      $��50��6�   $��20��6�   
����� �
�������$	��0 5q�6�   ��6!   �� *EditButtonPasswordContent+��6O   �� *EditSavePasswordCommand+��6{   Z� 6�   5[      5\      5]      5^      5_      5`      