chmod +x $1
mv ~/Downloads/rosalind* ./problem
$1 problem > out
rm problem
