#!/usr/bin/env bash

function help()
{
 echo "usage:[options][]"
 echo "options:"
 echo "-a"
 echo "-b"
 echo "-c"
 echo "-d"
 echo "-h"


}
function age_status()
## statistics of athletes of differant ages

{total=0
 younger_20=0
 older_30=0
 bt_20_30=0
 ages=$(awk -F "\t" '{ print $6 }' worldcuppalyerinfo.tsv)
 for age in $ages;
 do
	 if [ "sage" != "Age" ] ;then
		 total=`expr $total + 1`
		 if [ $age -lt 20 ] ;then
			 younger_20=`expr $younger_20 + 1`
		 elif [ $age -gt 30 ] ;then
			 older_30=`expr $older_30+ 1`
                 elif [ $age -ge 20 ] && [ $age -le 30 ] ;then
			 bt_20_30=`expr $bt_20_30 + 1`
		fi
	fi
done

per20=`awk 'BEGIN{printf "%.3f\n",('${younger_20}'/'$total')*100}'`
per2030=`awk 'BEGIN{printf "%.3f\n",('${bt_20_30}'/'$total')*100}'`
per30=`awk 'BEGIN{printf "%.3f\n",('${older_30}'/'$total')*100)'`

echo "the number of players uder 20 is $younger_20 ,proportion is $per20%"
echo "the number of players between 20 and 30 is $bt_20_30 ,proportion is $per2030%"
echo "the number of players older than 30 is $older_30 ,proportion is $per30%"
}

function position_stastus()
{c=`awk -F '\t' '{print $5}' worldcupplayerinfo.tsv |sort -r|uniq -c|awk '{print $1}'`
 p=`awk -F '\t' '{print $5}' ./worldcupplayerinfo.tsv|sort -r|uniq -a|awk '{wak '{print $2}'`
 sum=0
 count=($c)
 position=($p)
 for i in $c ;do
	 sum=$((sum+$i))
 done

 n=${#count[@]}
 for((i=1;i<n;i++));
 do
	 cc=${count[i]}
	 p=`awk 'BEGIN{printf "%f\n",('${cc}'/'$((sum-1))')*100}'`
	 echo "there are ${cc} players in field${position[i]},the proportion is ${p}%"
 done

}
function name_length()
{name=$(awk -F "\t" '{ print length($9) }' worldcupplayerinfo.tsv)
	longest=0
	shortest=999
	for i in $name;
	do
		if [ "$i" != "Player" ];then
		if [ $longest -lt $i ];then
                      longest=$i
		fi
		if [ $shortest -gt $i ];then
			shortest=$i
		fi

	fi
done

longest_name=$(awk -F '\t' '{if (length($9)=='$longest'){print $9}}' worldcupplayerinfo.tsv)
echo "the player whose name is the longest:"
echo "$longest_name"
shorest_name=$(awk -F '\t' '{if (length($9)=='$shortest'){print $9}}' worldcupplayerinfo.tsv)
echo "the player whose name is shortest:"
echo "$shortset_name"
}


function age_sort()
{age=$(awk -F "\t" '{ print $6 }' worldcupplayerinfo.tsv)
	max=0
	min=999
	for i in $age;
	do
		if [[ "$i" != "Age" ]];then
		if [[ $i -lt $min ]];then
			min=$i
		fi
		if [[ $i -gt $max ]];then
			max=$i
		fi
	fi
done

min_name=$(awk -F '\t' '{if($6=='$min') {print $9}}' worldcupplayerinfo.tsv)
echo "the least age is $min,who is :"
echo "$min_name"
max_name=$(awk -F '\t' '{if($6=='$max') {print $9}}' worldcuppalyerinfo.tsv)
echo "the biggst age is $max,who is :"
echo "$max_name"
}
while [ "$1" != ""];do
	case $1 in
		-a ) age_status
			exit
			;;
		-b ) position_status
			exit
			;;
		-c ) name_length
			exit
			;;
		-d ) age_sort
			exit
			;;
		-h ) helps
			exit
			;;
	esac
done
