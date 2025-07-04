import unittest
import uuid
import os
import shutil
import subprocess
import stat
import re

class Test(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        set_of_tests = {"part1" : {"fut" :"script3_1.sh", "aux" :["setup.sh"]},
                        "part2" : {"fut" :"script3_2.sh", "aux" :["setup.sh"]},
                        "part3" : {"fut" :"script3_3.sh", "aux" :["case.txt","caseb.txt"]}}
                        
                        
        cls.shell = "/usr/bin/bash"
        cls.assertTrue(os.path.isfile(cls.shell), "/usr/bin/bash not found. Operating System my not be correct, considering using cloud9")

        cls.test = set_of_tests
        
        #Create temp directory
        uidString = str(uuid.uuid4()) 
        cls.test_directory = "/tmp/Assignment3_"+uidString;
        os.mkdir(cls.test_directory)
        
        #copy files to temp directory
        for test in set_of_tests:
            
            shutil.copy(cls.test[test]["fut"],cls.test_directory)
            for file in cls.test[test]["aux"]:
                #copy files, and set permissions
                if os.path.isfile(file) : 
                    shutil.copy(file,cls.test_directory)
                    new_filename = cls.test_directory + "/" + file;
                else:
                    print("Setup failed, file " + file + "Does not exist")
                    assert("Setup failed, file " + file + "Does not exist")
        
        os.chdir(cls.test_directory) 
        
    @classmethod
    def tearDown(cls):
        #shutil.rmtree(cls.test_directory)
        pass

    def test_script3_1(self):
        excutable_script = self.test["part1"]["fut"]
        setup = self.test["part1"]["aux"][0]
        print("Output for " + excutable_script)
        self.assertTrue(os.path.isfile(excutable_script),excutable_script+" file not found")
        
        
        #create testing directory structure        
        #run setup script        
        subprocess.run([self.shell, setup])
        test_cases = [ {"id": "case 1", 
                  "expected": ["a3_example/a3q1/documents/reports/annual_report.csv",
                               "a3_example/a3q1/documents/reports/financial_summary.json",
                               "a3_example/a3q1/documents/letters/invitation_letter.txt",
                               "a3_example/a3q1/documents/letters/resignation_letter.json",
                               "a3_example/a3q1/downloads/movies/drama/movie5.csv",
                               "a3_example/a3q1/downloads/movies/drama/movie6.json",
                               "a3_example/a3q1/downloads/software/installer1.txt",
                               "a3_example/a3q1/downloads/software/installer2.json",
                               "a3_example/a3q1/music/rock/song1.csv",
                               "a3_example/a3q1/music/rock/song2.json",
                               "a3_example/a3q1/pictures/vacations",
                               "a3_example/a3q1/pictures/family",
                               "a3_example/a3q1/pictures/pets"],
                    "params":["a3_example/a3q1","*r*"]},
                    {"id": "case 2", 
                     "expected": ["a3_example/a3q1/documents/letters/invitation_letter.txt",
                                  "a3_example/a3q1/documents/letters/resignation_letter.json"],
                     "params":["a3_example/a3q1","l*"]}
                    ]
        output=[];
        for test in  test_cases:
            command = [self.shell, excutable_script]
            command.extend(test["params"])
            print("----------                  ---------")
            print("Testing:" + test["id"])
            
            cpi = subprocess.run(command, capture_output=True, text=True)            
            results = cpi.stdout.strip().split("\n")
            results.sort()
            test["expected"].sort()
            print("Output(stdout):")
            print(cpi.stdout)
            print("Error(stderr):")
            print(cpi.stderr)
            print("Comparing results:")
            self.assertEqual(results,test["expected"],"Results do not match")
        
        print("Finished Test: Success!")
        
    #Test number 2
    def test_script3_2(self):
        test_script = self.test["part2"]["fut"]
        print("Output for " + test_script)        
        self.assertTrue(os.path.isfile(test_script),"script3_2.sh file not found")
        
        test_dir = "p2_test"
        os.mkdir(test_dir)
        
        dirs = ["sub1", "sub2"]
        filelist = [[{"name":"fan.txt","perm":"o+x,u+r"}, {"name":"fun.txt","perm":"o+x,u-r"}, 
                     {"name":"fern.txt","perm":"o-x,u+r"},{"name":"fit.txt","perm":"o-x,u-r"}],
                     [{"name":"non.txt","perm":"o+x,u+r"}, {"name":"fin.txt","perm":"o+x,u-r"}, 
                      {"name":"fuun.txt","perm":"o-x,u-r"}]]
        
        for i in range(len(dirs)) :
            os.mkdir(test_dir+"/"+dirs[i])
            for file in filelist[i]:
                filename = test_dir+"/"+dirs[i]+"/"+file["name"]
                cmd = "echo test > " + filename
                os.system(cmd)
                permcmd = "chmod " + file["perm"] + " " +filename
                os.system(permcmd)
        
        #add executable permissions to test file
        expectedFiles = [test_dir+"/"+dirs[0]+"/"+filelist[0][0]["name"], 
                         test_dir+"/"+dirs[1]+"/"+filelist[1][0]["name"]]        
        
        #search pattern
        pat = "*.txt"
        
        #create script
        script = "echo test $1"
        filename = "p2.sh"
        file = open(filename,"wt")
        file.write(script)
        file.close()
        os.system("chmod +x p2.sh")
        print("Running Script 2")
        
        cpi = subprocess.run([self.shell, test_script,test_dir, pat, filename], capture_output=True, text=True)
        lines = cpi.stdout.strip().split("\n")
        print("Output for script:")
        print(lines)
        #check the results
        self.assertTrue(len(lines) == len(expectedFiles), "Incorrect number of results")
        
        for line in lines:
            print("output line")
            print(line)
            tokens = line.split()
            self.assertTrue(tokens[0] == "test", "user script did not run")
            idx = expectedFiles.index(tokens[1])  #will assert, if not in list
            expectedFiles.remove(tokens[1])
        print("End of run")
        
    def test_script3_3(self):
        test_script = self.test["part3"]["fut"]
        print("Output for " + test_script)
        self.assertTrue(os.path.isfile(test_script),"script3_3.sh file not found")

        test_cases = [ {"id": "case 1", "params":["case.txt"],
                        "expected": ["80","81","81","77","81","81","79","79","9"]},
                       {"id": "case 2", "params":["caseb.txt"],
                        "expected": ["79","81","81","76","77","83","81","88","56"]}]
        
        for test in  test_cases:                
            command = [self.shell, test_script]
            command.extend(test["params"])
            print("----------                  ---------")
            print("Testing:" + test["id"])
            
            cpi = subprocess.run(command, capture_output=True, text=True)            
            results = cpi.stdout.strip().split("\n")            
            print("Output(stdout):")
            print(cpi.stdout)
            print("Error(stderr):")
            print(cpi.stderr)
            print("Comparing results:")
            self.assertEqual(results,test["expected"],"Results do not match")

        print("End of test")

if __name__ == '__main__':
    unittest.main()