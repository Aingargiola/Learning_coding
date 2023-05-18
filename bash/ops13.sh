#!/bin/bash
echo "enter website"
read website
function whois(){
whois $website > whois.txt
dig $website >> whois.txt
host $website >> whois.txt
nslookup $website >> whois.txt
}
whois