for ip in $(seq 2 50); do ping -c 1 -W 1 10.0.5.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> sweep.txt; done

