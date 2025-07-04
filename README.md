# The-Shell

Concepts:
      Command-Line Arguments
      find command
      piping
      command substitution
      xargs

The first command-line argument, $1, is the starting directory to examine
The second command-line argument, $2, is a pattern 
Write a script that list the contents of directories and subdirectories that matches that pattern $2 in the directory $1.  Write the output to stdout.

Assuming you have executed the setup.sh script, an example invocation of

./script3_1.sh a3_example/a3q1 "*r*"
should have the output:

a3_example/a3q1/documents/reports/annual_report.csv
a3_example/a3q1/documents/reports/financial_summary.json
a3_example/a3q1/documents/letters/invitation_letter.txt
a3_example/a3q1/documents/letters/resignation_letter.json
a3_example/a3q1/downloads/movies/drama/movie5.csv
a3_example/a3q1/downloads/movies/drama/movie6.json
a3_example/a3q1/downloads/software/installer1.txt
a3_example/a3q1/downloads/software/installer2.json
a3_example/a3q1/music/rock/song1.csv
a3_example/a3q1/music/rock/song2.json
a3_example/a3q1/pictures/vacations
a3_example/a3q1/pictures/family
a3_example/a3q1/pictures/pets
An example invocation of

./script3_1.sh a3_example/a3q1 "l*"
should have the output:

a3_example/a3q1/documents/letters/invitation_letter.txt
a3_example/a3q1/documents/letters/resignation_letter.json
Question 2:   
For this problem, write a script, script3_2.sh, that searches for all files that is executable by others and readable by the owner.  You are to execute a user provided script on each of the files found.

$1 represents the directory to search in
$2 represents the pattern to be matched
$3 represents the user provided script to execute
The user provided script, assumed to take 1 parameter which is the filename found by the find command.
an example invocation of your script would be as follows:

./script3_2.sh a3_example "p*r.sh" ex_us.sh
The output for the example data for the example setup by setup.sh would be:

Your script was called a3_example/mariko/protectdoor.sh
it has 4 characters
Your script was called a3_example/mariko/presser.sh
it has 4 characters
Where :

a3_example is the directory to search in
p*r.sh is the pattern to look for
ex_us.sh, is the script to apply to every file found.
Click here for hint

Question 3:
reference: xargs, here strings

Write a script, script3_3.sh

Write a script that accepts 1 parameters:

$1 represents a file
For each line in the file $1, count the number of characters on each line( including the newline character).  

Hints:
If you pipe a string into bash, bash will execute it as a command
"here strings" and xargs will be needed to solve the problem.
Assuming the command line:

./script3_3.sh case.txt
And example output may be

80
81
81
77
81
81
79
79
9
