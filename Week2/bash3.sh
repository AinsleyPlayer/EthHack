sudo nmap -n -vv -sn 10.0.5.2-50 | grep "Nmap scan report for" | awk '{print $5}' | sudo tee sweep3.txt 
