#!/bin/sh

is_tiled() {
bspc query -T -n | grep -q '"state":"tiled"'
}

wid=$(xdotool getactivewindow)
wininfo=$(xwininfo -id "$wid")
width=$(echo "$wininfo" | awk '/Width/ {print $2}')
height=$(echo "$wininfo" | awk '/Height/ {print $2}')

case $1 in
	left)
        if ! is_tiled; then
            bspc node -z right -40 0
        else
            # bspc node @east -r -40 || bspc node @west -r -40
            bspc node -z left -40 0
            # bspc node -z right -40 0
            if [[ $width == "$(xwininfo -id "$wid" | \
                    awk '/Width/ {print $2}')" ]]; then
                bspc node -z right -40 0
            fi
        fi
		;;
	down)
        if ! is_tiled; then
            bspc node -z bottom 0 +35
        else
            # bspc node @south -r +35 || bspc node @north -r +35
            bspc node -z bottom 0 +35
            if [[ $height == "$(xwininfo -id "$wid" | \
                    awk '/Height/ {print $2}')" ]]; then
                bspc node -z top 0 +35
            fi
		fi
		;;
	up)
        if ! is_tiled; then
            bspc node -z bottom 0 -35
        else
            # bspc node @north -r -35 || bspc node @south -r -35
            bspc node -z top 0 -35
            # bspc node -z bottom 0 -35
            if [[ $height == "$(xwininfo -id "$wid" | \
                    awk '/Height/ {print $2}')" ]]; then
                bspc node -z bottom 0 -35
            fi
		fi
		;;
	right)
        if ! is_tiled; then
            bspc node -z right +40 0
        else
            # bspc node @west -r +40 || bspc node @east -r +40
            bspc node -z right +40 0
            if [[ $width == "$(xwininfo -id "$wid" | \
                    awk '/Width/ {print $2}')" ]]; then
                bspc node -z left +40 0
            fi
		fi
		;;
esac
