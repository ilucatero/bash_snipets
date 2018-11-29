#!/usr/bin/env bash

# run curl fo reach url IN PARALLEL to get the resulted HTTP Code 
mycurl() {
    RES=`curl -s -I -L -k -m 30 -o /dev/null -w "%{http_code}" "$1" `
    echo -e "$1, $RES" >> /tmp/url-sources-res.csv;
}
export -f mycurl

#parallel -j10 -k mycurl < /tmp/my_urls.csv

# run in background
nohup $(date >> /tmp/url-sources-res.csv.log; parallel -j15 -k mycurl < /tmp/my_urls.csv; date >> /tmp/url-sources-res.csv.log;) &
