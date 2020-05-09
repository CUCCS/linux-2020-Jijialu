#!/bin/bash/env bash

function helps(){
echo "usage:[options][]"
echo "options:"
echo "-a"
echo "-b"
echo "-c"
echo "-d"
echo "-e"
echo "-u [url]"
echo "-h"

}

##count the number of times to visit the sourse host TOP100
function top100_host()
{echo "show_top100_host"
awk -F '\t' 'NR>1{host_num[$1]+=1;}END{for(i in host_num){printf("host_name:%-30s\t%d\t\n",i,host_num[i]);}}' ./web_log.tsv | sort -n -r -k 2 | head -n 100}

##count the number of times to visit the sorse IP top100
function top100_ip()
{echo "show_top_100_ip"
 awk -F'\t' 'NR>1{if($1~/([0-9]{1,3}\.){3}[0-9]{1,3}/){ip_num[$1]+=1;}}END{for(i in ip_num){printf("ip:%-30s\t%d\t\n",i,ip_num[i]);}}' ./web_log.tsv | sort -n -r -k 2 | head -n 100
}
##count the number of times to visit the sourse URL top100
function top100_url()
{echo "show_top100_url"
 awk -F '\t' 'NR>1{url_num[$5]+=1;}END{for(i in url_num){printf("url:%-60s\t%d\t\n",i,url_num[i]);}}' ./web_log.tsv | sort -n -r -k 2 | head -n 100
}

##count the occurence timea and correaponding percentage of differant response status codes
function status_code()
{echo "show_status_code"
 awk -F '\t' 'BEGIN{num=0;}NR>1{num+=1;status_num[$6]+=1;}END{for(i in status_num){printf("status"%d\tnum:%d\tpercentage:%.5f%\t\n",i,status_num[i],status_num[i]*100.0/num'}} ' ./web_log.tsv

}
## count the TOP 10 URL and times
function show_4xx()
{echo "403 top10:"
 awk -F '\t' 'NR>1{if($6~/^403/){url_num[$5]+=1;}}END{for(i in url_num){printf("url:%-50s\t%d\t\n",i,url_num[i];}} ' ./web_log.tsv | sort -n -r -k 2 | head -n 10
 echo "404 top 10:"
 awk -F '\t' 'NR>1{if($6~/^404/){url_num[$5]+=1;}}END{for(i in url_num){printf("url:%-50s\t%d\t\n",i,url_num[i]);}} ' ./web_log.tsv | sort -n -r -k 2 | head -n 10
}

## print host of top100
function show_url()
{echo "show_url"
 echo "Input URL:$1"
 url=$1
 awk -F '/t' 'NR>1{if($5=="'"${url}"'"){url_num[$1]+=1;}}END{for(i in url_num){printf("host:%-30s\t%d\t\n",i,url_num[i]);}} ' ./web_log.tsv | sort -n -r -k 2 | head -n 100
}

while [ "$1"!="" ]; do
	case $1 in
		-a ) top100_host
			exit
			;;
		-b ) top100_ip
			exit
			;;
		-c ) top100_url
			exit
			;;
		-d ) status_code
			exit
			;;
		-e ) show_4xx
			exit
			;;
		-u ) show_url "$2"
			exit
			;;
		-h ) helps
			exit
			;;
esac
done
