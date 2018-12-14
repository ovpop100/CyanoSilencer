# run psiBlast to calculate the pssm matrix for sec structure prediction



open(BLAST,"$ARGV[0]");
while(<BLAST>){
chomp;
        if(/^>/){
		@dd=split(/\s+/);
                $header=$dd[0];
		$header=~s/>//;
        }
        else{
                $seq{$header}.=$_;
        }
}
close BLAST;


foreach my $gi(keys %seq){

my $query="$gi\n$seq{$gi}";
my $out=$gi;
$out=~s/>//;
$out=~s/&/#/;

 my $cmd="psiblast -db /home/ovidiu/HHU_Projects/silencer/blastDB/silencerDB -num_iterations 3 -num_threads 25 -query <(echo -e \"$query\") -out_ascii_pssm pssm_files/$out.pssm > /dev/null";

$r=qx(bash -c '$cmd');
#print $cmd."\n";
}
