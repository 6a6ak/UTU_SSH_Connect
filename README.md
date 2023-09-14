# SSH Server Connector

This repository contains a Bash script that allows you to easily connect to SSH servers. The script reads server details from a file, lists them, and lets you connect to one using an SSH key.

## Prerequisites

- Bash shell
- SSH client

## Installation

1. Clone this repository:
    ```
    git clone https://github.com/6a6ak/UTU_SSH_Connect.git
    ```
2. Navigate to the repository folder:
    ```
    cd /UTU_SSH_Connect
    ```
3. Make the script executable:
    ```
    chmod +x connect.sh
    ```

## Configuration

1. Rename the `server_list_sample.txt` to `server_list.txt`.
2. 
    ```
    mv server_list_sample.txt server_list.txt
    
    ```
3. Edit `server_list.txt` to include the username and IP address of the servers you want to connect to. Each line should contain a username and an IP address separated by a space:
    ```
    username1 192.168.1.1
   
    username2 192.168.1.2
    ```

## Usage

1. Run the script:
    ```
    
    ./connect_to_server.sh
    
    ```

    
2. The script will list the available servers. Select a server by entering its corresponding number.
3. Enter the name of your SSH key within the `.ssh` directory (e.g., `id_rsa`).

**Important:** Make sure your SSH key is located in the `.ssh` directory in your home folder.

## License

This project is licensed under the MIT License.
