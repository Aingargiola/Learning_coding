echo -e "Show System Information"
echo -e "Computer name: "$(lshw | grep "" -m1)
echo -e "CPU: "$(lshw | grep "*-cpu" -A 5)
echo -e "RAM: "$(lshw | grep "*-memory" -A 3)
echo -e "Display Adapter: "$(lshw | grep "*-display" -A 10)
echo -e "Network Adapter: "$(lshw | grep "*-network" -A-15)
echo -e "Information Complete."
