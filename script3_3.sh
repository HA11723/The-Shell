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
#Script: script3_3.sh
################################################################################
#Google/Internet References used:
#                               
################################################################################

#Question 3
[[ "$#" -ne 1 ]] && { echo "Usage: $0 <input_file>"; 

exit 1; 
    
}

# Store the input file path 
INPUT_FILE="$1"


[[ ! -f "$INPUT_FILE" ]] && { echo "Error: File '$INPUT_FILE' not found or is not a regular file."; exit 1; }
[[ ! -r "$INPUT_FILE" ]] && { echo "Error: File '$INPUT_FILE' is not readable."; 

exit 1; 
    
}

cat "$INPUT_FILE" | xargs -I {} bash -c 'wc -c <<< "{}"'