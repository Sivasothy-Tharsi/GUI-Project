   M S B A M L   `   `   `  ����B  >Desktop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:Desktop.ViewDesktop.View  5   	   'clr-namespace:Desktop.VM
Desktop.VM  5   	   !    Desktop.View.ForgotPassword   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.9.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962a:md1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   &localclr-namespace:Desktop.View  5   	   !vmclr-namespace:Desktop.VM  5   	     � Title$  ForgotPassword��5
   	   $	��450��6    $	��400��6-    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    � AllowsTransparency$
 True��5   	   
������  � DataContext 5          Desktop.VM.ResetPasswordVM  5   
   .��5      � .+�5   
   �� 
������� �� CornerRadius$ 20��6$   � 5   
    � RowDefinitions 5      �� 5      $
��Auto �6    �� 5      $��* �6    .+�5      �� $��30��6   $��Right=�6    
����� �
�������$��15q�6v   ��6<   Z� ��6�   �� *closeCommand+.��5      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�6   5      �� 5      $��1��6    �� Orientation$ Vertical=�6&   $��Center=�6=   $	��Top=�6Z   $
��0 75q�6r   .+�5      �� $��50��6   $ 
Horizontal=�6)   .+�5      �� $��UserName��6    $��Bottom=�60   �� 5      $	��200��68   $
��20 0q�6E   ��6   �� *
UserName+6E   5       �� 5!      $��50��6   $ 
Horizontal=�6)   .+�5"      �� $��mobile��6    $��Bottom=�6.   �� 5#      $	��200��68   $
��40 0q�6E   ��6   �� *
MobileNo+6E   5$      �� 5%      $��Submit��6   $
��0 30q�6*   ��68   �� *ResetPasswordCommand+5&      5'      5+      5,      