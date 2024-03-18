echo "How many log entries are in the file?"
echo "  $(wc -l < ads_website.log)"

echo "How many accesses were successful (server sends back a status of 200) and how many had an error of "Not Found" (status 404)?"
echo "  Requests Succes:     $(cut -d$'\t' -f10 < ads_website.log | grep 200 | wc -l)"
echo "  Requests Not Found : $(cut -d$'\t' -f10 < ads_website.log | grep 404 | wc -l)"

echo "What are the URIs that generated a "Not Found" response? Be careful in
specifying the correct search criteria: avoid selecting lines that happen to
have the character sequence 404 in the URI."
cut -d$'\t' -f9,10 < ads_website.log | grep 404$ | cut -d$'\t' -f1 | cut -d' ' -f2


echo "How many different days are there in the log file on which requests were made?"
cut -d$'\t' -f3 < ads_website.log | egrep '[[:digit:]]{2,2}/[[:alpha:]]{3,3}/[[:digit:]]{4,4}' -o | uniq | wc -l

echo "How many accesses were there on 4th March 2021?"
cut -d$'\t' -f3 < ads_website.log | grep '14/Mar/2021' -c

echo "Which are the three days with the most accesses? Hint: Create first a pipeline that produces a list of dates preceded by the count of log entries on that date."
cut -d$'\t' -f3 < ads_website.log | egrep '[[:digit:]]{2,2}/[[:alpha:]]{3,3}/[[:digit:]]{4,4}' -o | uniq -c | sort -k1,1nr | head -n3 | sed -e 's/  */ /' | cut -d' ' -f3

echo "Which is the user agent string with the most accesses?"
cut -d$'\t' -f17 < ads_website.log | uniq -c | sort -k1,1nr | head -n1 | grep '".*"' -o

echo "If a web site is very popular and accessed by many people the user agent strings appearing in the server's log can be used to estimate the relative market share of the users' computers and operating systems. How many accesses were done from browsers that declare that they are running on Windows, Linux and Mac OS X (use three commands)?"
echo "windows : $(cut -d$'\t' -f17 < ads_website.log | grep -i 'windows' -c)"
echo "linux : $(cut -d$'\t' -f17 < ads_website.log | grep -i 'linux' -c)"
echo "mac os x : $(cut -d$'\t' -f17 < ads_website.log | grep -i 'mac os x' -c)"

echo "Read the documentation for the tee command. Repeat the analysis of the previous question for browsers running on Windows and insert tee into the pipeline such that the user agent strings (including repeats) are written to a file for further analysis (the filename should be useragents.txt )."
cut -d$'\t' -f17 < ads_website.log | grep -i 'windows' | tee useragents.txt > /dev/null

echo "Why is the file access.log difficult to analyse, consider for example the analysis of question 7, with the commands you have seen so far?"
echo "because we aren't able to easily differentiate separation whitespace and and a whitespace within a field"



