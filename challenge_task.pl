use strict;       # The strict pragma
use warnings;     # The warnings pragma
use diagnostics;  # The diagnostics pragma

###########################################################
#  This program determines the total number of people in  #
#  a social network, in addition, determining the minimum #
#  ties between two members of the network                #	
###########################################################

# The number of people in the network
my $num_people;
# A Hash to save people
my %people;
# A Hash to save the friendships
my %friendships;

# Breadth First Search to find the shortest path between
# two persons in a network
sub min_ties{
	my ($person_1,$person_2) = @_;
	
	if ($person_1 eq $person_2){
		die "The two names must be different\n";
	}
	
	if (!(exists $people{$person_1})){
		die "The $person_1 isn't in the network\n
		     Please, enter names from the network and run again\n";
	}elsif (!(exists $people{$person_2})){
		die "The $person_2 isn't in the network\n
		     Please, enter names from the network and run again\n";
	}
	
	# Distance from the source
	my $distance=0;
	# Predecessor
	my $predecessor=undef;
	
	# BFS_Info{index} => (distance, predecessor, visited)
	# Distance - represent the number of people way from the source
	# Predecessor - the predecessor toward the source
	# Visited - this person is visited beofre or not
	my %BFS_Info;
	
	# Intialize the BFS Info Hash
	for (my $i=0; $i<$num_people; $i++){
		$BFS_Info{$i}=[(undef,undef,undef)];
	}
	
	# A queue to save the unvisited persons
	my @temp_queue;
	
	# The source
	$BFS_Info{$people{$person_1}}=[($distance,$predecessor,1)];
	
	unshift @temp_queue, $people{$person_1};
	
	while(@temp_queue > 0){ # check the length of the queue
		$predecessor = shift @temp_queue;
		$distance = $BFS_Info{$predecessor}[0]+1;
		
		# Check the connect persons with the $predecessor
		foreach my $index (@{$friendships{$predecessor}}){
			if (!$BFS_Info{$index}[2]){ # Visited before or not
				unshift @temp_queue, $index;
				# Update the BSF_Info hash
				$BFS_Info{$index}=[($distance,$predecessor,1)];
			}
			if ($index == $people{$person_2}){
				# Found the target
				return %BFS_Info;
			}
		}	
	}
	return %BFS_Info;
}

# Open the social network file
my $network_file = $ARGV[0];
open my $input_fh,'<',$network_file 
	or die "Can't open File : $_";
	
### Future Work ###	
#  Add logic here to check that the format of the input file is fine       


# Read the file
while(my $info = <$input_fh>){
	chomp($info	);
	# Split the names of friends
	my ($friend_1,$friend_2) = split /,/,$info;
	foreach my $person ($friend_1,$friend_2){
		if(exists $people{$person}){
			# This person is already added to the network
		} else {
			# Add this person to the network
			$people{$person} = $num_people++;
			$friendships{$people{$person}} = \my @temp;
		}
	}
	# Add this friendship
	push @{$friendships{$people{$friend_1}}}, $people{$friend_2};
	push @{$friendships{$people{$friend_2}}}, $people{$friend_1};
}
close $input_fh
	or die "Couldn't close File : $_";
	
# Open a file to save the outputs
my $out_file= 'OUT.txt';
open my $output_fh, '>', $out_file
	or die "Can't open File : $_";
	
print $output_fh "The number of persons in the network is (($num_people))\n";
# Print on terminal as well
print "The number of persons in the network is (($num_people))\n";
print $output_fh "People:: [";
print $output_fh "<$_>  " for keys %people;
print $output_fh "]\n";

# Defualt values in case the user forget to provide them
$ARGV[1] ||= 'STACEY_STRIMPLE';
$ARGV[2] ||= 'RICH_OMLI';

my %result = min_ties($ARGV[1],$ARGV[2]);

my %reverse_people = reverse %people;

my $num_ties = $result{$people{$ARGV[2]}}[0];
print $output_fh "The minimum number of ties between <$ARGV[1]> and <$ARGV[2]> is (($num_ties))\n";
# Print on terminal as well
print "The minimum number of ties between <$ARGV[1]> and <$ARGV[2]> is (($num_ties))\n";
print $output_fh "Ties:: ";

my $current = $ARGV[2];
my $current_index = $people{$ARGV[2]};
my $predecessor;
my $predecessor_index;

for (my $i=0; $i< $num_ties; $i++) {
	$predecessor_index = $result{$current_index}[1];
	$predecessor = $reverse_people{$predecessor_index};
	print $output_fh " [<$current> friend of <$predecessor>] ";
	$current_index = $predecessor_index;
	$current = $predecessor;
}
print $output_fh "\n";

close $output_fh
	or die "Couldn't close File : $_";