#open terminal
mod+enter 

#close window
mod+shift+q

#open application different from terminal
mod+d


#tile windows
mod+enter

#move between windows
mod+(left|down|up|right) arrow 
mod+( j  | k  | l| ;   ) 

#insert next vertically
mod+v

#put windows in stacking mode
mod+s
#NOTE: to move between window user mod arrows or jkl;

#tiling mode
mod+e
#(mod+e)x2 changes from orizontal to vertical

#tab mode
mod+w

#
### Resize windows
#

## to make window wider
# enter resizing mode
mod+r
user arrow keys to resize
# esc to exit resize mode (not TAB but actually esc --> search how to configure)

#swap positions
mod+shift+arrow


#move window to workspace 3
mod+shift+3 

#logout
mod+shift+e

#refresh configuration
mod+shift+r

#lock screen
i3lock


####
## File configuration
####
# execute command at startup
exec command

#execute everytime refresh configuration
#useful for sourcing 
exec_always command

#for solid background
exec_always xsetroot -solid "#333333"
#custom wallpaper
sudo apt-get install feh
feh --bg-scale wallpaper.jpg
exec_always feh --bg-scale /home/mgazz/.../wallpaper.jpg


##open application in specific workspace
# step1: open application and find class as following
xprop # and click on open application and search for WM_CLASS. copy second element
assign=[class="Gnome-terminal"] $workspace3

#for icons I need to install fonts
wget https://github.com/FortAwesome/Font-Awesome/archive/v4.7.0.tar.gz
mkdir ~/.fonts
tar -xvzf v4.7.0.tar.gz
cp Font-Awesome-4.7.0/fonts/fontawesome-webfont.ttf ~/.fonts
google-chrome https://fortawesome.github.io/Font-Awesome/cheatsheet/


####
## Colors
###

set $bg-color 	         #2f343f
set $inactive-bg-color   #2f343f
set $text-color          #f3f4f5
set $inactive-text-color #676E7D
set $urgent-bg-color     #E53935

# window colors
# indicator represents where the next window will be tiled
#                       border              background          text                 indicator
client.focused          $bg-color           $bg-color           $text-color             #00ff00
client.unfocused        $inactive-bg-color  $inactive-bg-color   $inactive-text-color   #00ff00
client.focused_inactive $inactive-bg-color  $inactive-bg-color   $inactive-text-color   #00ff00
client.urgent           $urgent-bg-color    $urgent-bg-color    $text-color             #00ff00

# to disable indicators
hide_edge_borders both

