# Website status check script 
#10/03/2023 Donwald Hartman 

import requests
from tabulate import tabulate
from termcolor import colored

# List of websites to test

websites = ["https://twitter.com","https://facebook.com","https://google.com"]



# Initialize Table for Admin environments 
table_data = []
for website in websites:
    try:
        response = requests.get(website)
        status_code = response.status_code
        if status_code == 200:
            status_text = "OK"
            color = "green"
        elif status_code == 502:
            status_text = "Bad Gateway"
            color = "red"
        else:
            status_text = "ERROR"
            color = "red"
    except requests.exceptions.RequestException:
        status_code = "Error"
        status_text = "ERROR"
        color = "red"
    status_colored = colored(status_text, color)
    table_data.append([website, status_colored])   
print(tabulate(table_data, headers=["Website URL", "HTTP Status"]))
