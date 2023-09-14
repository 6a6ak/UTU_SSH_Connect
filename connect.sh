#!/bin/bash

# Initialize an empty array to hold server details
declare -a servers

# Read the file and populate the servers array
while IFS= read -r line; do
    servers+=("$line")
done < "server_list.txt"

# List servers by numbers
echo "Available servers:"
for i in "${!servers[@]}"; do
    echo "$((i+1)). ${servers[i]}"
done

# Ask for the server number to connect to
read -p "Select a server number to connect to: " selected_num

# Validate the selected number
if [[ ! "$selected_num" =~ ^[0-9]+$ ]] || [ "$selected_num" -le 0 ] || [ "$selected_num" -gt "${#servers[@]}" ]; then
    echo "Invalid selection. Exiting."
    exit 1
fi

# Extract username and IP address
selected_server="${servers[$((selected_num-1))]}"
username=$(echo "$selected_server" | cut -d' ' -f1)
ip_address=$(echo "$selected_server" | cut -d' ' -f2)

# Ask for the name of the SSH key in the .ssh directory
read -p "Enter the name of your SSH key within the .ssh directory (e.g., id_rsa): " ssh_key

# Validate if the SSH key file exists
if [ ! -f "$HOME/.ssh/$ssh_key" ]; then
    echo "SSH key file does not exist. Exiting."
    exit 1
fi

# Connect to the server
ssh -i "$HOME/.ssh/$ssh_key" "$username@$ip_address"
