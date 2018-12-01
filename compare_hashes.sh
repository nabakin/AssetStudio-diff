rm -rf "Diff_Assets"
mkdir "Diff_Assets"

if [ "$1" == "" ]; then
    for dir in New_Assets/*/; do
        dir=${dir%*/}
        dir=${dir##*/}
        mkdir "Diff_Assets/${dir}"
        
        for filename in New_Assets/${dir}/*.*; do
            flag=0
            new_hash=`md5sum "$filename" | awk '{ print $1 }'`
            
            while read old_hash; do
                if [ "$old_hash" == "$new_hash" ]; then
                    flag=1
                    break
                fi
            done < "Old_Assets/${dir}_Hashes.txt"
            
            if [ "$flag" -eq "0" ]; then
                cp "$filename" "Diff_Assets/${dir}"
            fi
        done
    done
else
    mkdir "Diff_Assets/${1}"
    
    for filename in New_Assets/${1}/*.*; do
        flag=0
        new_hash=`md5sum "$filename" | awk '{ print $1 }'`
        
        while read old_hash; do
            if [ "$old_hash" == "$new_hash" ]; then
                flag=1
                break
            fi
        done < "Old_Assets/${1}_Hashes.txt"
        
        if [ "$flag" -eq "0" ]; then
            cp "$filename" "Diff_Assets/${1}"
        fi
    done
fi
