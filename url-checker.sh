#!/bin/bash



# Function to print colored output
GREEN="\x1b[32;1m"
RED="\x1b[31m"
DEFAULT="\x1b[39;1m"

# Function to check URL status
check_url_status() {
  local url=$1
  local status
  status=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  if [ "$status" -eq 200 ] || [ "$status" -eq 301 ] || [ "$status" -eq 302 ]; then
    echo -e "${GREEN} $url OK \t $status${DEFAULT}"
  else
    echo -e " ${RED} $url $BAD \t $status ${DEFAULT}"
  fi
}

# List of URLs to check
urls=(
    "https://example.com"
    "https://google.com"
    "https://tiktok.com"
    "https://donwaldhartman.co.za"
    "https://notreallolxd.com") 


sleep 1
clear

header="_______________________URL Status Checker___________________________\n"

echo -e "$header\n\n" | column  -s $'\t'

for url in "${urls[@]}"; do
   url_status=$(check_url_status "$url") 
   echo -e $url_status
done

echo -e "\n______________Flex________(っ▀¯▀)つ_____Flex________________________"
