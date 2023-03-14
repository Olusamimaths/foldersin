#! /bin/bash

# This script deletes folders that doesn't contain files with a given extension
# E.g if graceExtension="xml", then this script will delete all folders that doesn't contain an xml file

graceExtension="xml"
count=0
for DIR in *; do
    [[ -d $DIR ]] || continue
    for FILE in "$DIR"/*; do
        [[ -f $FILE ]] || continue

        if [[ $FILE =~ $graceExtension ]]; then
            printf "\n▶ Skipping: Found xml file in %s\n" "$DIR"
            break
        fi
        printf "☒ Deleting...: %s\n" "$DIR"
        rm -rf "$DIR"
        printf "\t ✗ ..deleted\n"
        ((count += 1))
    done
done

printf "\n"
echo "→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→"
printf "⌛ Deleted a total of %s folders\n" "$count"
echo "→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→→"
