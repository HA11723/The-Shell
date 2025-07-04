
WD="a3_example"

if test -e  $WD;
then
   echo $WD already exist
   echo Remove with the command: rm -rf $WD
   echo before running this script.  
   echo Stopping....
   exit 1
fi

q1_setup () {
   # Create directories
   mkdir -p a3q1/documents/reports
   mkdir -p a3q1/documents/letters
   mkdir -p a3q1/downloads/movies/action
   mkdir -p a3q1/downloads/movies/comedy
   mkdir -p a3q1/downloads/movies/drama
   mkdir -p a3q1/downloads/software
   mkdir -p a3q1/music/rock
   mkdir -p a3q1/music/jazz
   mkdir -p a3q1/music/classical
   mkdir -p a3q1/pictures/vacations
   mkdir -p a3q1/pictures/family
   mkdir -p a3q1/pictures/pets
   
   # Create files with random content
   echo "Annual Report Data" > a3q1/documents/reports/annual_report.csv
   echo '{"summary": "Financial Data"}' > a3q1/documents/reports/financial_summary.json
   echo "Invitation Letter Content" > a3q1/documents/letters/invitation_letter.txt
   echo '{"letter": "Resignation Letter Content"}' > a3q1/documents/letters/resignation_letter.json
   echo "Notes Content" > a3q1/documents/notes.txt
   
   echo "Movie 1 Data" > a3q1/downloads/movies/action/movie1.csv
   echo '{"movie": "Movie 2 Data"}' > a3q1/downloads/movies/action/movie2.json
   echo "Movie 3 Data" > a3q1/downloads/movies/comedy/movie3.csv
   echo '{"movie": "Movie 4 Data"}' > a3q1/downloads/movies/comedy/movie4.json
   echo "Movie 5 Data" > a3q1/downloads/movies/drama/movie5.csv
   echo '{"movie": "Movie 6 Data"}' > a3q1/downloads/movies/drama/movie6.json
   echo "Installer 1 Data" > a3q1/downloads/software/installer1.txt
   echo '{"installer": "Installer 2 Data"}' > a3q1/downloads/software/installer2.json
   
   echo "Rock Song 1 Data" > a3q1/music/rock/song1.csv
   echo '{"song": "Rock Song 2 Data"}' > a3q1/music/rock/song2.json
   echo "Jazz Song 3 Data" > a3q1/music/jazz/song3.csv
   echo '{"song": "Jazz Song 4 Data"}' > a3q1/music/jazz/song4.json
   echo "Classical Song 5 Data" > a3q1/music/classical/song5.csv
   echo '{"song": "Classical Song 6 Data"}' > a3q1/music/classical/song6.json
   
   echo "Beach Vacation Data" > a3q1/pictures/vacations/beach.csv
   echo '{"vacation": "Mountains Vacation Data"}' > a3q1/pictures/vacations/mountains.json
   echo "Birthday Family Data" > a3q1/pictures/family/birthday.csv
   echo '{"family": "Reunion Family Data"}' > a3q1/pictures/family/reunion.json
   echo "Cat Pet Data" > a3q1/pictures/pets/cat.csv
   echo '{"pet": "Dog Pet Data"}' > a3q1/pictures/pets/dog.json
   
}

mkdir $WD
cd $WD

q1_setup

#files for Question 2 for patter p*r.sh
mkdir mariko
echo pwd > mariko/protectdoor.sh  #included
chmod o+x,u+r mariko/protectdoor.sh 
echo pwd > mariko/presser.sh #included
chmod o+x,u+r mariko/presser.sh
echo pwd > mariko/pistols.sh #exluded
chmod o+x,u+r mariko/pistols.sh
echo pwd > mariko/poor.sh #exluded
chmod o-x,u+r mariko/poor.sh
echo pwd > mariko/potter.sh #exluded
chmod o+x,u-r mariko/potter.sh
echo pwd > mariko/pinner.sh #exluded
chmod o-x,u-r mariko/pinner.sh



