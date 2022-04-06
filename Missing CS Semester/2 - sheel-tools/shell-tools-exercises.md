1. Read [`man ls`](https://www.man7.org/linux/man-pages/man1/ls.1.html) and write an `ls` command that lists files in the following manner

   - Includes all files, including hidden files
   - Sizes are listed in human readable format (e.g. 454M instead of 454279954)
   - Files are ordered by recency
   - Output is colorized

   A sample output would look like this

   ```bash
    -rw-r--r--   1 user group 1.1M Jan 14 09:53 baz
    drwxr-xr-x   5 user group  160 Jan 14 09:53 .
    -rw-r--r--   1 user group  514 Jan 14 06:42 bar
    -rw-r--r--   1 user group 106M Jan 13 12:12 foo
    drwx------+ 47 user group 1.5K Jan 12 18:08 ..
   ```

   * **Answer**:

     ```bash
     ls -a -l -t --color='auto'
     
     ## Response:
     drwxr-xr-x 1 AzureAD+GabrielPachêcoMilhom 4096   0 Apr  5 19:05 'Missing CS Semester'/
     drwxr-xr-x 1 AzureAD+GabrielPachêcoMilhom 4096   0 Apr  5 19:01  ./
     drwxr-xr-x 1 AzureAD+GabrielPachêcoMilhom 4096   0 Apr  4 19:14  .git/
     -rw-r--r-- 1 AzureAD+GabrielPachêcoMilhom 4096 277 Apr  4 15:54  README.md
     drwxr-xr-x 1 AzureAD+GabrielPachêcoMilhom 4096   0 Apr  4 10:24 'Mathematics for Computer Science'/
     drwxr-xr-x 1 AzureAD+GabrielPachêcoMilhom 4096   0 Apr  4 10:24 'How to Code Simple Data'/
     drwxr-xr-x 1 AzureAD+GabrielPachêcoMilhom 4096   0 Mar 29 18:41  ../
     -rw-r--r-- 1 AzureAD+GabrielPachêcoMilhom 4096 301 Mar 29 16:25  .gitignore
     
     ```

2. Write bash functions `marco` and `polo` that do the following. Whenever you execute `marco` the current working directory should be saved in some manner, then when you execute `polo`, no matter what directory you are in, `polo` should `cd` you back to the directory where you executed `marco`. For ease of debugging you can write the code in a file `marco.sh` and (re)load the definitions to your shell by executing `source marco.sh`.

   ```bash
   #marco.sh
   
   marco () {
   	marco_location=$(pwd)
   }
   ```

   ```bash
   #polo.sh
   
   polo () {
   	cd "$marco_location"
   }
   ```

3. Say you have a command that fails rarely. In order to debug it you need to capture its output but it can be time consuming to get a failure run. Write a bash script that runs the following script until it fails and captures its standard output and error streams to files and prints everything at the end. Bonus points if you can also report how many runs it took for the script to fail.

   ```bash
    #!/usr/bin/env bash
   
    n=$(( RANDOM % 100 ))
   
    if [[ n -eq 42 ]]; then
       echo "Something went wrong"
       >&2 echo "The error was using magic numbers"
       exit 1
    fi
   
    echo "Everything went according to plan"
   ```
   
   * **Answer**
   
     ```bash
     #!/usr/bin/env bash
     echo "executing"
     counter=0
      
     code=0
     
     echo ""> ./question-3-output.txt
     echo ""> ./question-3-error.txt
      
     while [[ "$code" -ne 1 ]]
     do
     	counter=$(( "$counter"+1))	
     	
     	./question-3-base.sh >> ./question-3-output.txt 2> ./question-3-error.txt
     	
     	code="$?"
     	
     	if [[ "$code" -eq 1 ]]
     	then
     		
     		echo "Executed $counter times until fail" >> ./question-3-output.txt
     		
     		cat  ./question-3-output.txt ./question-3-error.txt 
     	fi
      
     done
     ```
   
     