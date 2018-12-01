if [ "$1" == "" ]; then
    for dir in Old_Assets/*/; do
        dir=${dir%*/}
        dir=${dir##*/}
        > "Old_Assets/${dir}_Hashes.txt"
        
        for filename in Old_Assets/${dir}/*.*; do
            md5sum "$filename" | awk '{ print $1 }' >> "Old_Assets/${dir}_Hashes.txt"
        done
    done
else
    > "Old_Assets/${1}_Hashes.txt"
    
    for filename in Old_Assets/${1}/*.*; do
        md5sum "$filename" | awk '{ print $1 }' >> "Old_Assets/${1}_Hashes.txt"
    done
fi
