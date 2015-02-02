for f in $(find img/ -name '*.jpg' -not -name '-thumb.jpg'); 
do 
	if [[ $f != *"-thumb.jpg" ]]
	then
		t_name="${f/\.jpg/-thumb\.jpg}"
		if [ ! -f "$t_name" ]
		then
			echo "Image $f does not have a thumbnail"
			mogrify -format jpg -resize 750 -write $t_name $f
			echo "Generated $t_name"
		fi
	fi
done