   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5	   	   'clr-namespace:Desktop.VM
Desktop.VM  5
   	       Desktop.View.Dashboard   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   0hc'https://handyorg.github.io/handycontrol  5   	   Z VFontAwesome.WPF, Version=4.7.0.37774, Culture=neutral, PublicKeyToken=0758b07a11a4f466-fa$http://schemas.fontawesome.io/icons/  5   	   &localclr-namespace:Desktop.View  5	   	   !VMclr-namespace:Desktop.VM  5
   	     � Title$  	Dashboard��5   	   $	��500��6   $	��800��6(    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    � AllowsTransparency$
 True��5   	   
������  � 	Resources 5         BoolToVisibilityConverter��%   &	        �� 5   
   6'   5       � DataContext 5         Desktop.VM.DashboardVM  5   
   .��5      � .+�5   
   �� $��Center=�6   $	��500��61   
���   �$��Center=�6M   $	��800��6h   ���	#FFF1E7E7 �� RadiusX$ 29.783��6�    �� RadiusY$
 48.7��6�   � 5   
    � ColumnDefinitions 5      �� 5      $
��Auto �6#   �� 5      $��* �6#   .+�5      � $��1��6   .+�5      �� $
��Auto��6   $
��Auto��6+   .+�5       �� ��6%   �� *CurrentView+5!      5"      � 5#      $��0��6   .+�5$      �� $
��Left=�6   $	��500��67   
���   �$��Center=�6S   $	��190��6n   $
 19.9��6z   $
 19.9��6�   ��5%      �� 5&      	 �� EndPoint$	 0.5,1&�6.   
 �� 
StartPoint$
 0.5,0&�6?   .��5'      �  � Color$ DarkCyan��6+    � Offset$ 1Q�6<   � 5(      $ White��6+   $ 1Q�69   5)      5+      � 5,       � RowDefinitions 5-      �� 5.      $	��150 �6(   �� 5/      $��* �6(   .+�51      ��  �� Orientation$ 
Horizontal=�6!   .+�52      ��   UserButtonStyle#��[ 6!   
������ $
��Auto��6e   $��70��6r   $
��Left=�6~   $��	20 15 0 0q�6�   ��6�   �� *UserInfoCommand+.��53      �� $ Vertical=�6)   $
��Left=�6@   $��70��6[   .+�54   "   �� $��50��6J   $��40��6U   ��6(   �� *User.ImagePath+6U   �� 55   "   $��Center=�6K   ��6,   �� *User.UserName+6K   56      57      �� 58      $��Welcome��6$   $��15(�63   $��Center=�6A   $��10 0 0 0q�6\   
�������6n   �� 59      $��15(�6C   $��Center=�6Q   $��5 0 0 0q�6l   ��6$   �� *User.UserName+6l   5:      �� 5;      
�������$��2q�61   $	��100��6E   $	��330��6Q    �� CornerRadius$ 10��6^   $��1��6p   ._�5<      �� $ Vertical=�6%   $��1��6<   .+�5=      �� 
�������
�������$��55��6}   ��6%   Z� ��66   �� *HomeCommand+.��5>   "   �� 
����� �$��2q�6@   $��50��6T   ._�5?   &   �� $ Vertical=�61   .+�5@   *   '  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 Home=�66   $��Center=�6B   
���   �6_   �� 5A   *   $
��Home��64   $��Center=�6@   
���   �6]   5B   '   5C   #   5D      �� 5E      
�������
�������$��55��6}   ��6%   Z� ��66   �� *UserCommand+.��5F   "   �� 
����� �$��2q�6@   $��50��6T   ._�5G   &   �� $ Vertical=�61   .+�5H   *     $
 User=�66   $��Center=�6B   �� 5I   *   $
��User��64   $��Center=�6@   5J   '   5K   #   5M      �� 5N      
�������
�������$��55��6�   ��6%   Z� ��66   �� *CustomerCommand+.��5O   "   �� 
����� �$��2q�6@   $��50��6T   ._�5P   &   �� $ Vertical=�61   .+�5Q   *     $ CustomerService=�66   $��Center=�6M   �� 5R   *   $��Customer��64   $��Center=�6D   5S   '   5T   #   5V      �� 5W      
�������
�������$��55��6�   ��6%   Z� ��66   �� *ProductCommand+.��5X   "   �� 
����� �$��2q�6@   $��50��6T   ._�5Y   &   �� $ Vertical=�61   .+�5Z   *     $ Package=�66   $��Center=�6E   �� 5[   *   $��Product��64   $��Center=�6C   5\   '   5]   #   5_      �� 5`      
�������
�������$��55��6�   ��6%   Z� ��66   �� *CategoryCommand+.��5a   "   �� 
����� �$��2q�6@   $��50��6T   ._�5b   &   �� $ Vertical=�61   .+�5c   *     $ Category=�66   $��Center=�6F   �� 5d   *   $��Category��64   $��Center=�6D   5e   '   5f   #   5h      �� 5i      
�������
�������$��55��6~   ��6%   Z� ��66   �� *OrderCommand+.��5j   "   �� 
����� �$��2q�6@   $��50��6T   ._�5k   &   �� $ Vertical=�61   .+�5l   *     $ MobilePhone=�66   $��Center=�6I   �� 5m   *   $��Order��64   $��Center=�6A   5n   '   5o   #   5q      �� 5r      
�������
�������$��55��6~   ��6%   Z� ��66   �� *StockCommand+.��5s   "   �� 
����� �$��2q�6@   $��50��6T   ._�5t   &   �� $ Vertical=�61   .+�5u   *   �� $��/Image/stocks.png��60   $��20��6K   $��20��6V   �� 5v   *   $��Stock��64   $��Center=�6A   5w   '   5x   #   5z      �� 5|      
�������
�������$��55��6   ��6%   Z� ��66   �� *LogoutCommand+.��5}   "   �� 
����� �$��2q�6@   $��50��6T   ._�5~   &   �� $ Vertical=�61   .+�5   *     $ Logout=�66   $��Center=�6D   �� 5�   *   $��Log out��64   $��Center=�6C   5�   '   5�   #   5�      5�      5�      5�      5�      5�      5�      5�      