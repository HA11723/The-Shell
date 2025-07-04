#!/usr/bin/bash
#Student Name: Hadi Nasir
#Student Number: 100367064
#Date: Fri May 23 15:34:58 PDT 2025
#Date md5: 96fffe7d5de7b5a9ba3e37f7eb5686a9 -
#Machine-
#Host name: ip-172-31-91-141.ec2.internal
#C9 Project: CPSC 1280 HomeWork Machine
#Current Directory: /home/ec2-user/environment/assignment3
#instance-id: i-027eba3cbcba94b47
#b78afcd427434ff035db4f4022feebcf -
#941734e8715402b62a40bf33ba295abe  -
#Script: script3_2.sh
################################################################################
#Google/Internet References used:
#                               
################################################################################

#Question 2 
[[ "$#" -ne 3 ]] && { echo "Usage: $0 <search_directory> <filename_pattern> <script_to_execute>";

exit 1; 
    
}

SEARCH_DIR="$1"
FILENAME_PATTERN="$2"
USER_SCRIPT="$3"

find "$SEARCH_DIR" -type f -name "$FILENAME_PATTERN" -perm -o=x -perm -u=r 2>/dev/null | xargs -I {} "$USER_SCRIPT" {}
