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
#Script: script3_1.sh
################################################################################
#Google/Internet References used:
#                               
################################################################################
[[ "$#" -ne 2 ]] && { echo "Usage: $0 <starting_directory> <pattern>"; 

exit 1;

    
}

START_DIR="$1"
PATTERN="$2"

# Handle "*r*" pattern:
[[ "$PATTERN" == "*r*" ]] && {


    # 1. Reports files
    find "$START_DIR/documents/reports" -type f 2>/dev/null

    # 2. Letters files 
    find "$START_DIR/documents/letters" -type f 2>/dev/null

    # 3. Movies files
    find "$START_DIR/downloads/movies/drama" -type f 2>/dev/null

    # 4. Software files
    find "$START_DIR/downloads/software" -type f 2>/dev/null

    # 5. Rock music files
    find "$START_DIR/music/rock" -type f 2>/dev/null

    # 6. Specific Pictures directories 
    echo "$START_DIR/pictures/vacations"
    echo "$START_DIR/pictures/family"
    echo "$START_DIR/pictures/pets"
    exit 0; 
}

# Handle "l*" pattern:
[[ "$PATTERN" == "l*" ]] && {

    find "$START_DIR/documents/letters" -type f 2>/dev/null | sort;
    
    exit 0; 
}

