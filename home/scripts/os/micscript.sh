amixer get Capture | grep -q '\[off\]' && echo "off" || echo "on"
