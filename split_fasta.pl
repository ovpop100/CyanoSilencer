
### file to split fasta files into a x number of files
#
use POSIX;
my $count=0;

open(FI,"$ARGV[0]");
while(<FI>){
	chomp;
		if(/^>/){
			$header=$_;
			$count++;
		}
		else{
			$seq{$header}.=$_;
		}
}
close FI;


if(!$ARGV[1]){
	$parts=1;
}
else{ $parts=$ARGV[1];}

$file_name=$ARGV[0];
$file_name=~s/\..*$//;

my $x=$count/$parts;
$file_size=floor($x);

for(my $i=1; $i<=$parts;$i++){

	if($i==1){$start=1;$end=$file_size-1;}
	else{$start=$file_size*($i-1); $end=$file_size*$i-1}
	
	if($i==$parts){
		$last=$count-(($parts-1)*$file_size);
		$end=$count;
		print "$i $count $last $file_name"."_$i $start $end\n";
		$new_file{$start}=$file_name."_$i";

	}	

	
	else{	
		
	
		print "$i $count $file_size $file_name"."_$i $start $end\n";
	
		$new_file{$start}=$file_name."_$i";
	}

}
my $cnt=1;
foreach my $key(keys %seq){

	if(exists $new_file{$cnt}){
		open(OUT,">$new_file{$cnt}");
		
	}
	 print OUT "$key\n$seq{$key}\n";
	 $cnt++;
}
close OUT;







