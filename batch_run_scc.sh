#file[1]="livejournal"
#file[2]="baidu"
#file[3]="flickr-growth"
#file[4]="zhishi-hudong-relatedpages"
#file[5]="pokec"
#file[6]="wikipedia_link_en"
#file[7]="wikipedia_en"
#file[8]="dbpedia"
#file[9]="facebook"
#file[10]="wiki_communication"
#file[11]="random"
#file[12]="RMAT"
#file[10]="twitter_www"
#file[14]="twitter_mpi"
#file[11]="wiki_talk_en"
#file[16]="us_patent"
#file[17]="citeseer"

file[1]="wiki_talk_en"
file[2]="wiki_communication"
#file[3]="us_patent"
#file[4]="citeseer"

deal () {
    echo ${file[$1]}
    ./scc -a g -p 1 -q 1 -w 4 -f /mnt/raid0_huge/yuede/data/${file[$1]}/gtgraph.txt >> result/${file[$1]}_vHong_p1_q1_w4.result
    ./scc -a x -p 1 -q 1 -w 4 -f /mnt/raid0_huge/yuede/data/${file[$1]}/gtgraph.txt >> result/${file[$1]}_wHong_p1_q1_w4.result
    ./scc -a h -p 1 -q 0 -w 4 -f /mnt/raid0_huge/yuede/data/${file[$1]}/gtgraph.txt >> result/${file[$1]}_vSlota_p1_q0_w4.result
    ./scc -a y -p 1 -q 0 -w 4 -f /mnt/raid0_huge/yuede/data/${file[$1]}/gtgraph.txt >> result/${file[$1]}_wSlota_p1_q0_w4.result
#    ./scc -a d -p 1 -q 1 -w 4 -f /mnt/raid0_huge/yuede/data/${file[$1]}/gtgraph.txt >> result/${file[$1]}_detectSCC_p1_q1_w4.result
    #/home/yuede/Dropbox/projects/gunrock/build/bin/cc market /mnt/raid0_huge/yuede/data/${file[$1]}/matrix_market.txt >> /home/yuede/Dropbox/projects/gunrock/result/${file[$1]}.result

}

make clean
make
for i in `seq 1 9`;
do
    for index in `seq 1 2`;
    do
        deal $index
    done
done


