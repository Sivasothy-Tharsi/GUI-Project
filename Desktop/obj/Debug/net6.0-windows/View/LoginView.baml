   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5   	   'clr-namespace:Desktop.VM
Desktop.VM  5   	       Desktop.View.LoginView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   &localclr-namespace:Desktop.View  5   	   !VMclr-namespace:Desktop.VM  5   	     � Title$  	LoginView��5
   	   $	��500��6   $	��800��6(    � WindowStartupLocation$ CenterScreen=�5   	    � AllowsTransparency$
 True��5   	    � WindowStyle$
 None=�6#   
������  � 
ResizeMode$ NoResize=�5   	   $��Forte)�6    � DataContext 5         Desktop.VM.LoginVM  5   
   .��5      �  � ColumnDefinitions 5   
   �� 5      $��* �6   �� 5      $��2* �6   .+�5   
   � $��0��6   
������ .+�5      ��  �� CornerRadius$ 	20 0 0 20��6   ��5      �� 5       �� 
StartPoint$ 1.5 0.5&�6*   	 �� EndPoint$	 0.5 1.5&�6?   .��5      � 
 � Color$
 DarkCyan��6'    � Offset$	 0.1Q�68   � 5      $
 White��6'   $	 1.5Q�65   5      5!      �� 5"      $��BERRY��6   $��Center=�6%   $	��Top=�6B   $��50(�6Z   $��0,39,0,0q�6h    J� Effect 5#      3  -System.Windows.Media.Effects.DropShadowEffect  5$         Color$ Black��6'      ShadowDepth$ 2Q�65      
BlurRadius$ 2Q�6E      Opacity$	 0.7Q�6T      	Direction$ 0Q�6b   ��5&      �� 5'      $	 0,0&�6*   $		 1,0&�6;   .��5(      � $ 0Q�6'   $
 Purple��62   � 5)      $ 1Q�6'   $
 White��62   5*      5,      �� 5-      $	��POS��6   $
��Left=�6#   $	��Top=�6>   $��30(�6V   $��
161,93,0,0q�6d    5.        5/      $ Black��6'   $ 2Q�65   $ 2Q�6E   $	 0.7Q�6T   $ 0Q�6b   ��51      �� 52      $	 0,0&�6*   $		 1,0&�6;   .��53      � $ 0Q�6'   $
 CornflowerBlue��62   � 54      $ 1Q�6'   $
 White��62   55      57      �� 58      $��/Image/POS.png��6   $	��Top=�6,   $��	8,113,9,0q�6D   $	��163��6W    59        5:      $ Black��6'   $ 5Q�65   $ 10Q�6E   $	 0.5Q�6U   5<      �� 5=      .+�5>      �  � Points �    -1��� ;X��
�������$	��Top=�6H   $��Center=�6`   
 �� Top$	 230��6}    J� Opacity$
 0.08Q�6�   5?      �� 5@      $��LOG IN��6   $
��Left=�6&   $	��Top=�6A   $��30(�6Y   $��
32,345,0,0q�6g    5A        5B      $ Black��6'   $ 3Q�65   $ 2Q�6E   $	 0.7Q�6T   $ 0Q�6b   ��5D      �� 5E      $	 0,0&�6*   $		 1,0&�6;   .��5F      � $ 0Q�6'   $
 
WhiteSmoke��62   � 5G      $ 1Q�6'   $
 White��62   5H      5J      �� 5K      $M��GUnlock your world, with a key of trust, where dreams and security meet.��6   $	��Top=�6g   $��32,391,10,0q�6   $
��Wrap=�6�    �� TextAlignment$
 Left=�6�   
�������6�   5L      � 5M   
   $��1��6   
������ .+�5N      �� $ 	0 20 20 0��6   
�������6.   � 5O       � RowDefinitions 5P      �� 5Q      $
��Auto �6$   �� 5R      $��* �6$   .+�5T      � $��0��6   .+�5U      �� 
����� �$ 
0 20 20 20��63   $��0q�6M   ._�5V      �� 
����� �$��	0,0,0,250q�64   $��2��6G    �� RadiusX$ 17.889��6X    �� RadiusY$ 17.889��6i   5W      �� 5X      $��Right=�6   $��40��6:   
������ 
������ $��10q�6�   $	��Top=�6�   ��6y   �� *ShutdownCommand+.��5Y      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Shutdown=�6&   
�������$��40��6I   $��35��6T   5Z      5\      � 5]      $��1��6   $	��Top=�6$   $��Center=�6<   .+�5^      �� �� 5_      
������ $��1q�67   $ 20��6K   $��75,-103,75,60q�6]   
������� 5`        5a      $ Black��6/   $ 2Q�6=   $ 8Q�6M   $ 0Q�6\   ._�5c      �� $	��Top=�6&   $	��400��6>   $	��300��6J   .+�5d      �� .+�5e   "   �� $��10,30q�6D   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ 	User name��6S    %  !MaterialDesignFloatingHintTextBox#��[  6r   $��Champagne & Limousines)�6�   $��18(�6�   $	��341��6�   ��6*   �� *
Username+6�   G� 5f   "   $��10,10q�6b   $ Password��6q    ) %MaterialDesignFloatingHintPasswordBox#��[ 6�   $��Champagne & Limousines)�6�   $��18(�6�   $	��349��6  0  *MaterialDesignThemes.Wpf.PasswordBoxAssist   Password 6.   �� *
Password+6  5g      �� 5i      
������ 
������ $��10(�6j   $
��Left=�6x   $��25 20q�6�   $��85��6�   $
��Left=�6�   ��6%   Z� ��6�   �� *ForgotPasswordCommand+.��5j   "   �� $��Forgot password ?��6,   5k      �� 5l       �� Orientation$ 
Horizontal=�6)   $
��Auto��6B   $��0q�6P   $��Center=�6[   .+�5m   "   �� $	��100��6)     btnLogin#��[ 65   $��Login��6W   $��30��6�   $��Frank Ruhl Hofshi)�6�   $
��10 0q�6�   ��6h   �� *LoginCommand+6�   �� 5n   "   $��Sign up��6)   #��[ 6;   
������ $
��30 0q�6�   $��16(�6�   $��
Constantia)�6�   $��30��6�   $	��100��6�   ��6]   �� *RegisterCommand+6�   5o      5p      5q      5r      5u      5v      5w      5x      