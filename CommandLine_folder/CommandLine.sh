#! /bin/zsh
# We're going to save the ordered couple in a new file txt
awk -F, '{if ($2<$1) print $2 "\t\t\t-" $1; else print $1 "\t\t-" $2}' hero_clear1.csv > heroes_ordered.txt

echo "Let's display the 20 most popular pair of heroes:" 
sed -r 's/\s+//g' heroes_ordered.txt | sort | uniq -c | sort -rnk1 | head -n  20

echo -e "\nNumber of comics per hero (First 20):"
awk -F, '{count[$1]++}END{for(j in count) print count[j] " : " j |"sort -t: -k2r"}' edges_clear.csv | sort -nr | head -n 20


echo -e "\nNow we create a new txt file where in each line there will be the number of different heroes appearing in the comic, then later we will average "
echo -e "So finally this is the average number of heroes in comics:\n"
awk -F, '{count[$2]++}END{for(j in count) print count[j] |"sort -t: -k2r"}' edges_clear.csv | sort -nr > number_of_heroes_comics.txt
awk -F, '{ total += $0 } END { print total/NR }' number_of_heroes_comics.txt
