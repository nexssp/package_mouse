# Nexss PROGRAMMER 2.x - Bash
# Default template for JSON Data
# This works also on Windows (WSL - Windows Subsystem Linux)
# !Important
# Remeber to change CRLF to LF (Windows to Unix)
# In VSCode you can mae it from bottom status bar
# Click on CRLF and change it to LF.
# For JSON in bash is good to use
# https://stedolan.github.io/jq/download/
# STDIN
NexssStdin=`cat`
# Modify Data
# NexssStdout=$(echo "$NexssStdin" | jq ".HelloFromBash = \"$BASH_VERSION\"")

# Validation is done through Nexss Programmer. See _nexss / input/output validate
x=$(echo "$NexssStdin" | jq "._x")
y=$(echo "$NexssStdin" | jq "._y")

# sleep 0.2 && xdotool click --clearmodifiers 3
# xdotool mousemove 200 200 && xdotool click 3

xdotool mousemove $x $y #&& xdotool click 3 # right click

# STDOUT
echo $NexssStdin>&1