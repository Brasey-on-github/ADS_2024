echo "Number, Date " > access.csv && \
cut -d$'\t' -f3 < ads_website.log | egrep '[[:digit:]]{2,2}/[[:alpha:]]{3,3}/[[:digit:]]{4,4}' -o | uniq -c | sed -e 's/  *//' | sed -e 's/ /, /' | sed -e 's/\//./'>> access.csv