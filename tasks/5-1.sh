#!/usr/bin/env bash

function help()
{echo "usage:"
 echo "-q [quality_num][dir]  "
 echo "-r [persent][dir]"
 echo "-w [watermark_text][dir]"
 echo "-p [perfix_text][dir]"
 echo "-s [suffix_text][dir]"
 echo "-c [dir]"
 echo "-h"


}

function jpeg_quality_compress()
#quality compression of JPEG image

{quality_num=${1}
dir=${2}

jpeg_files=($(find "${dir}" -regex '.*\.jpg))
for jpeg_file in "${jpeg_file[@]}";
do
	file_name=${jpeg_file%.*}
	file_tail=${jpeg_file} -quality ${quality_num} $file_name'_quaity.'$file_tail
	echo $jpeg_file 'is compressed into' $file_name'_quality.'$file_tail
done


}

function keep_radio_compress()
##compress resolution
{percent=${1}
dir=${2}
jps_files=($(find"${dir)" -regex '.*\.jpg\|.svg\|.*\.png'))

for jps_file in "${jps_files[@]}";
do
	file_name=${jps_file%.*}
	file_tail=${jps_file##*.}
	convert ${jps_file} -resize ${persent}'%x'${persent}'%' $file_name'_'$persent'%.'$file_tail
        echo ${jps_file} 'is compressed into' $file_name'_'$persent'%.'$file_tail
done
}
function add_watermark()
##add cunstom text watermark to pictures in batch
{watermark_text=${1}
dir=${2}
all_files=($(find"${dir}" -regex '.*\.jpg\|.*\.svg\|.*\.png\|.*\.jpeg'))
for all_file in "${all_files[@]}";
do
        file_name=${all_file%.*}
        file_tail=${all_file##*.}
	convert ${all_file} -gravity south -fill black -pointsize 16 -draw "text 5,5 '$watermark_text'" $file_name'_watermarked.'$file_tail
        echo ${all_file} 'is added watermark into' $file-name' $file_name'_watermarked.'$file_tail
done
}
function rename_add_prefix()
{## add file name prefix uniformly
	prefix=${1}
	dir=${2}
	files=($(find "${dir}" -regix '.*\.jpg\|.*\.svg\|.*\.png\|.*jpeg'))
	for file in "${files[@]}";
	do
		file_dir=${file%/*}
		file_name=${file%.*}
		file_tail=${file##*.}
		file_sname=${file_name##*/}
		mv $file $file_dir'/'$prefix$file_sname'.'$file_tail
		echo "prefix is added"
	done

}
function rename_add_suffix(){
## add file name suffix uniformly
suffix=${1}
dir=${2}
files=($(find "${dir}" -regex '.*\.jpg\|.*\.svg\|.*\.png\|.*\.jpeg'))
for file in "${files[@]}";
do
	file_name=${file%.*}
	file_tail=${file##*.}
	mv $file $file_name$suffix'.'$file_tail
	echo"suffix is added"
done
}
function transfer_format()
{## png/svg to jpg
	dir=${1}
	files=($(find "dir" -regex '.*\.png\|.*svg'))
	for file in "${files[@]}";
	do
		convert $file "${file%.*}.jpg"
		echo "transfer to jpg finished"
	done


}
while  [ "$1" !=""];do
	case "$1" in
		"-q")
			jpeg_quality_compress $2 $3
			exit 0
			;;
		"-r")
			keep_radio_compress $2 $3
			exit 0
			;;
		"-w")
			add_watermark $2 $3
			exit 0
			;;
		"-p")
			rename_add_prefix $2 $3
			exit 0
			;;
		"-s")
			rename_add_suffix $2 $3
			exit 0
			;;
		"-c")
			transfer_format $2
			exit 0
			;;
		"-h")
			help
			exit 0
			;;
		esac
	done
