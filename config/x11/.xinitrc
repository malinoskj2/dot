zsh ~/env/config/x11/key_binds.zsh # Run script that sets keybinds
xset s off -dpms &&	# disable screen power saving
xset m 0 0 &&		# disable mouse accel
xset r rate 260 55 &&   # repeat delay / rate 	
exec startxfce4
