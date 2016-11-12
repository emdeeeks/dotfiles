Xephyr -ac -br -noreset -screen 1306x708 :1 &
sleep 1
DISPLAY=:1.0 awesome & 
