#!/usr/bin/expect -f  

# Set variables  
set timeout 10  
set password "zenerbaba"  

# Start the sudo session  
spawn sudo su  

# Look for the password prompt  
expect "Password:"  

# Send the password  
send "$password\r"  

# Expect a shell prompt  
expect "#"  

# Execute the remaining commands  
send "cd\r"  
send "mkdir -p ceremony && docker pull ghcr.io/unionlabs/union/mpc-client:v1.2 && docker run -v $(pwd)/ceremony:/ceremony -w /ceremony -p 4919:4919 --rm -it ghcr.io/unionlabs/union/mpc-client:v1.2\r"  

# Interact with the shell  
interact
