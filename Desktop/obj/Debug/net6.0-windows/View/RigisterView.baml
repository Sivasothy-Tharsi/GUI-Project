   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5   	   'clr-namespace:Desktop.VM
Desktop.VM  5   	       Desktop.View.RigisterView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   &localclr-namespace:Desktop.View  5   	   !VMclr-namespace:Desktop.VM  5   	     � Title$  RigisterView��5
   	   $	��500��6   $	��800��6+    � WindowStartupLocation$ CenterScreen=�5   	    � AllowsTransparency$
 True��5   	    � WindowStyle$
 None=�6#   
������  � DataContext 5         Desktop.VM.RegisterVM  5   
   .��5      � .+�5   
   �� $��Center=�6   $	��500��61   
���   �$��Center=�6M   $	��800��6h    �� RadiusX$
 39.7��6t    �� RadiusY$
 39.7��6�   
�������6�   �� 5   
   $
��Left=�6   $	��446��6+   $��
278,44,0,0q�68   $	��Top=�6L   $	��499��6d   $��/Image/CreateAccount.png��6p    J� Opacity$
 0.25Q�6�   � 5   
    � ColumnDefinitions 5      �� 5      $	��260 �6#   �� 5      $��* �6#   .+�5      � $��0��6   .+�5      �� 
����� �	 �� CornerRadius$	 	20 0 0 20��6/   �� 5      
 �� Orientation$
 Vertical=�6   .+�5      A� $	��100��6   $	��100��6*   $��2��67   
�������$	��Top=�6Z   $��75q�6r   ��5      �� 5       �� ImageSource 6)   �� *	ImagePath+ �� UpdateSourceTrigger$ PropertyChanged=� J� Effect 5!      3  -System.Windows.Media.Effects.DropShadowEffect  5"         
BlurRadius$ 2Q�6/      ShadowDepth$ 5Q�6>      Color$ Black��6N   5$      �� 5%      $��Sign Up��6    $��Center=�6/   $��40(�6L   $
��Bold"�6Z   $��Source Serif Pro Black)�6l   $��49��6�   $��0 -50q�6�    5&        5'      $ Black��6/   $ 3Q�6=   $ 2Q�6M      	Direction$ 0Q�6\   ��5)      �� 5*       �� 
StartPoint$	 0,0&�62    �� EndPoint$	 1,0&�6C   .��5+   "   �  � Offset$ 0Q�6/    � Color$ Purple��6:   � 5,   "   $ 1Q�6/   $ White��6:   5-      5/      50      '  !MaterialDesignThemes.Wpf.PackIcon  52         Kind$ CircleDouble=�6   $��90��62   $	��172��6>   $��Center=�6J   $��	0,333,0,0q�6g    53        54      $ 2Q�6+   $ 5Q�6:   $ Black��6J   ��56      �� 57      $	 0 1&�6.   $	 1 0&�6?   .��58      � $
 Gray��6+   $	 0.5Q�69   � 59      $ White��6+   $ 1Q�69   5:      5<        5=      $
 Tick=�6   $��40��6*   $��93��65   $��Center=�6A   $��	0,333,0,0q�6^   
������� 5>        5?      $ 2Q�6+   $ 5Q�6:   $ Black��6J   5A      A� 5B      
�������$��52,308,52,0q�6(   $	 0.3Q�6=   A� 5C      
�������$��152,363,-48,-55q�6(   $	 0.3Q�6A    J� RenderTransformOrigin$ 0.5,0.5&�6O   z�5D      V� 5E      .~�5F      �� �� 5G      �� 5H       �� Angle$ 22.492Q�6.   T� 5I      5J      5L      A� 5M      
�������$��-46,354,150,-46q�6(   $	 0.3Q�6A   $ 0.5,0.5&�6O   z�5N      V� 5O      .~�5P      �� �� 5Q      �� 5R      $ -26.31Q�6.   T� 5S      5T      5V      5Y      � 5Z      $��1��6    � RowDefinitions 5[      �� 5\      $
��Auto �6$   �� 5]      $��* �6$   .+�5_      �� 
������ 
������ $	��Top=�6L   $��Right=�6d   
���   �$��50��6�   $��	0 10 10 0q�6�   ��6�   �� *CancelCommand+.��5`        $ Close=�6"   $��40��6/   $��40��6:   5a      � 5b       � Orientation$ 
Horizontal=�6   $
��Left=�65   $��	20 60 0 0q�6P   $��Center=�6c   .+�5c      �� $��Register User��6    
���   �$��30(�6H   $
��Bold"�6V   $��Center=�6h   $��10 0 0 0q�6�   5d      � 5e      $��1��6    5g      �� 5h      $��* �6+   �� 5i      $��* �6+   .+�5k      � $ Vertical=�6    $��Center=�67   $��0 50 0 0q�6T   .+�5l      �� $��	User Name��6$   �� 5m      $��Password��6$   $��0 20 0 0q�64   �� 5n      $��Address��6$   $��0 20 0 0q�63   �� 5o      $��Contact��6$   $��0 20 0 0q�63   �� 5p      $
��Role��6$   $��0 20 0 0q�60   �� 5q      $��Image��6$   $��0 20 0 0q�61   5r      � 5s      $��1��6    $ Vertical=�60   $
��Left=�6G   $��0 50 0 0q�6b   $	��150��6t   .+�5t      �� $	��150��63   ��6"   Z� ��6?   �� *NewUser.UserName+�� 5u      $	��150��63   $��0 20 0 0q�6a   ��6"   Z� ��6?   �� *NewUser.Password+6a   �� 5v      $	��150��63   $��0 20 0 0q�6`   ��6"   Z� ��6?   �� *NewUser.Address+6`   �� 5w      $	��150��63   $��0 20 0 0q�6`   ��6"   Z� ��6?   �� *NewUser.Contact+6`   �� 5x      $��0 20 0 0q�6y   ��6#   Z� ��65   �� *Roles+ �� SelectedItem 6S   �� *SelectedRole+6y   �� 5y      
����� �$��Upload Image��6H   $��0 20 0 0q�6�   ��6!   Z� ��6_   �� *UploadImageCommand+6�   5z      5{      �� 5|         btnLogin#��[  6   $��Register��6;   $��1��6N   $��30��6\   $	��125��6h   $��208,333,208,37q�6t   ��6�   �� *
AddCommand+5}      5~      5�      5�      