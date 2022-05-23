# Exercises

1. Find the number of words (in `/usr/share/dict/words`) that contain at least three `a`s and don’t have a `'s` ending. What are the three most common last two letters of those words? `sed`’s `y` command, or the `tr` program, may help you with case insensitivity. How many of those two-letter combinations are there? And for a challenge: which combinations do not occur?

   1.  Number of words

      ```bash
      cat /usr/share/dict/words | awk '$0 ~/^([^a]*a)([^a]*a)([^a]*a)[^a]*$/ && $0 !~ /.*\x27s$/' | wc -l
      
      ```

   2. Three most common last two letters

      ```bash
      cat /usr/share/dict/words | awk '$0 ~/^([^a]*a)([^a]*a)([^a]*a)[^a]*$/ && $0 !~ /.*\x27s$/ {print substr($0, length($0)-1)}' | sort | uniq -c | sort -r -n -k1,1 | head -n3
      ```

   3. Number of different two-letter combinations

      ```bash
      cat /usr/share/dict/words | awk '$0 ~/^([^a]*a)([^a]*a)([^a]*a)[^a]*$/ && $0 !~ /.*\x27s$/ {print substr($0, length($0)-1)}' | sort | uniq -c | wc -l
      ```

   4. Combinations which not occur

      ```bash
      cat /usr/share/dict/words | awk '$0 ~/^([^a]*a)([^a]*a)([^a]*a)[^a]*$/ && $0 !~ /.*\x27s$/ {print substr($0, length($0)-1)}' | sort | uniq | awk '{for}'
      
      echo a | awk 'BEGIN{for(n=97;n<123;n++){for(m=97;m<123;m++){ if(n != m){ chr[n,m]=sprintf("%c%c",n,m)}}}}{for(n=97;n<123;n++)for(m=97;m<123;m++)  print chr[n, m]}'
      
      
      echo a | awk 'BEGIN{isIn = false for(n=97;n<123;n++){for(m=97;m<123;m++){ if(n != m){ chr[n,m]=sprintf("%c%c",n,m)}}}}{for(n=97;n<123;n++)for(m=97;m<123;m++)  print chr[n, m]}'
      
      # not finished
      
      ```

2. To do in-place substitution it is quite tempting to do something like `sed s/REGEX/SUBSTITUTION/ input.txt > input.txt`. However this is a bad idea, why? Is this particular to `sed`? Use `man sed` to find out how to accomplish this.

   * The file becomes empty, as like `>` created a new one, and it is not particular to sed.
   * To accomplish this with sed is necessary to use the option `-i`.

3. Find your average, median, and max system boot time over the last ten boots. Use `journalctl`

     and look for log timestamps near the beginning and end of each boot. On Linux, they may look something like:

   ```
   Logs begin at ...
   ```

   and

   ```
   systemd[577]: Startup finished in ...
   ```

   * **Mean**

     ```bash
     journalctl | awk '/.*Startup finished in [0-9]+ms\./ {print substr($9, 1, length($9)-3) }' | awk 'BEGIN {sum = 0} {sum +=$0} END {print sum/NR}'
     ```

   * **Median**

     ```bash
     journalctl | awk '/.*Startup finished in [0-9]+ms\./ {print substr($9, 1, length($9)-3) }' | sort -n | uniq -c | sort -n -r -k1,1 | head -n1
     ```

   * **Max**

     ```bash
     journalctl | awk '/.*Startup finished in [0-9]+ms\./ {print substr($9, 1, length($9)-3) }' | sort -n -r | head -n1
     ```

4. Look for boot messages that are *not* shared between your past three reboots (see `journalctl`’s `-b` flag). Break this task down into multiple steps. First, find a way to get just the logs from the past three boots. There may be an applicable flag on the tool you use to extract the boot logs, or you can use `sed '0,/STRING/d'` to remove all lines previous to one that matches `STRING`. Next, remove any parts of the line that *always* varies (like the timestamp). Then, de-duplicate the input lines and keep a count of each one (`uniq` is your friend). And finally, eliminate any line whose count is 3 (since it *was* shared among all the boots).

   1. Get data and hour of the boot from 2 days ago

      ```bash
      journalctl --list-boots | tail -n3 | head -n1 | awk '{print $3" "$4" "$5}'
      ```

   2. get boot info

      ```bash
      journalctl| sed -E '0,/2022-05-19/d' | sed -E '0,/15:52:46/d' | sed -E 's/.*gabriel1000homem-IdeaPad-3-15IML05 kernel://'| sort | uniq -c | awk '$1 != 3 {print $0}' | sort -n -k1,1 | head -n20
      ```