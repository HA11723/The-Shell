
#check command line arguments
if [ $# -ne 2 ] 
then
    echo 'Usage: '$0' "<your name>" "<your student number>"'
    exit 1
fi
#check if we are in a repo, only work in a repo  
#to enforce good coding habits.
if git status 2>&1 | grep "^fatal"
then
   echo 'Work in a git repository.  Type "git init", to initialize directory to a git repository'
   echo "Then rerun $script1"
   exit 1
fi

anum=3
#Check directory, make sure student work in an organized fashion.
curr_dir="$(basename "$(pwd)")"

if [[ $curr_dir != "assignment$anum" ]]
then
   echo "Please be organized, and work in a subdirectory called assignment${anum}."   
   echo "To make a directory called assignment${anum} use: mkdir assignment${anum}."
   echo "To traverse into the directory use: cd assignment${anum}."
   exit 1
fi

v=1
scripts=( "script3_1.sh" "script3_2.sh" "script3_3.sh")
#check if file exists
for file in ${scripts[@]}
do
   if [ -f $file ]
   then
       echo "One or more starter files already exists. If they are incorrect, delete and rerun."
       echo "$0"
       echo "To delete the starter type 'rm ${scripts[@]}'"
       exit 1
   fi
done




head_file="$(mktemp)"
echo Name: "$1" 
echo Student Number: "$2" 

echo \#Student Name: $1 >$head_file
echo \#Student Number: $2 >>$head_file
dt_string="$(TZ='America/Vancouver' date)"
echo \#Date: "$dt_string" >>$head_file
echo \#Date md5: $(echo "$dt_string"|md5sum) >>$head_file
echo \#Machine->>$head_file
echo \#Host name: $HOSTNAME >>$head_file
echo \#C9 Project: $C9_PROJECT >>$head_file
echo \#Current Directory: $(pwd) >>$head_file
echo \#$(ec2-metadata -i) >>$head_file
echo \#$(ec2-metadata -i | md5sum) >>$head_file


for file in ${scripts[@]}
do 
    echo "#!/usr/bin/bash" > $file
    cat "$head_file" >>"$file"
    printf "#" >> "$file"
    cat "$head_file" | md5sum >> "$file"
    echo "#Script: $file" >> "$file"
    echo {1..80} | xargs -n1 printf "#" >> "$file" 2> /dev/null
    echo "">> "$file"
    echo "#Google/Internet References used:">> "$file"
    echo "#                               ">> "$file"
    echo {1..80} | xargs -n1 printf "#" >> "$file" 2> /dev/null
    echo >> "$file"
done
chmod u+x ${scripts[@]}
git add ${scripts[@]}
