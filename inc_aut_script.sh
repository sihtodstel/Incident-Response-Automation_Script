#!/usr/bin/python

import subprocess
import logging

def isolate_system(ip_address):
    """
    Function to isolate a system based on its IP address.
    """
    try:
        # to isolate the system 
        subprocess.run(["iptables", "-A", "INPUT", "-s", ip_address, "-j", "DROP"], check=True)
        subprocess.run(["iptables", "-A", "OUTPUT", "-d", ip_address, "-j", "DROP"], check=True)
        
        logging.info(f"System with IP {ip_address} isolated successfully.")
    except subprocess.CalledProcessError as e:
        logging.error(f"Error isolating system: {e}")
        
if __name__ == "__main__":
    # 
    target_ip = "192.168.1.100"
    
    # Setup logging
    logging.basicConfig(filename='incident_response.log', level=logging.INFO)
    
    # Call the isolate_system function
    isolate_system(target_ip)
