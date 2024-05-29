# Main
# This is built to run on mac

echo "CPU"
lshw -C cpu | grep -i product
lshw -C cpu | grep -i vendor 
lshw -C cpu | grep -i physical
lshw -C cpu | grep -i bus
lshw -C cpu | grep -i width

echo "RAM"
lshw -C ram | grep -i description
lshw -C ram | grep -i physical
lshw -C ram | grep -i size

echo "Display Adapter"
lshw -C display | grep -i description
lshw -C display | grep -i product
lshw -C display | grep -i vendor
lshw -C display | grep -i physical
lshw -C display | grep -i bus
lshw -C display | grep -i width
lshw -C display | grep -i clock
lshw -C display | grep -i capabilities
lshw -C display | grep -i configuration

echo "Network Adapter"
lshw -C network | grep -i description
lshw -C network | grep -i product
lshw -C network | grep -i vendor
lshw -C network | grep -i physical
lshw -C network | grep -i bus
lshw -C network | grep -i width
lshw -C network | grep -i clock
lshw -C network | grep -i capabilities
lshw -C network | grep -i configuration

# End