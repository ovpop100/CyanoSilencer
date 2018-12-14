
#ls -1 pssm_files/ |awk '{print "python ~/Software/SPIDER2_local/misc/pred_pssm.py pssm_files/"$1}' |sh

`ls -1 pssm_files/ >files2do.tmp` 
#input=$1
split=$1
nthreads=`grep processor /proc/cpuinfo |wc -l`
if [ -z $1 ]; then 
        split=$nthreads
fi

echo "split file $input in $split parts"
split files2do.tmp -n $split -d part_

#split $input -n $split -d part_
FI=`ls -1 part_*`
for f in $FI
do
	cat $f | awk '{print "python ~/Software/SPIDER2_local/misc/pred_pssm.py pssm_files/"$1}' | sh & 
	
done


rm files2do.tmp
rm part*
#nfiles=`ls -1 pssm_files/ |wc -l`

#x=$(($nfiles/$nthreads))



