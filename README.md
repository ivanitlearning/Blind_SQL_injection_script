# Blind_SQL_injection_script
This is a Bash script which automates blind SQL injections by testing characters: {0..9} {A..z} . .. ; : - _ @
It was written and tested based on this [PentesterLab course](https://pentesterlab.com/exercises/from_sqli_to_shell/course) which actually supports in-band SQL injection which is preferable. Previously I used a similar script but for an eLS PTP lab. Since that lab is not open to the public and I haven't found a free one publicly available, this will do.

## Important:
This script requires heavy editing. You have to use Burpsuite to test the SQLI parameters, then copy as `curl`, replace the curl syntax in this script, together with `$URL`, `$truestring`.

## Usage
`./SQLblind.sh 20 '@@version'`

`./SQLblind.sh 20 'system_user()'`
