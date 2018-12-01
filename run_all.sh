./retrieve_files.sh "$1"
./decode_assets.sh "$1"
./compute_hashes.sh "$1"
./compare_hashes.sh "$1"