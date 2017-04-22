use strict;       # The strict pragma
use warnings;     # The warnings pragma
use diagnostics;  # The diagnostics pragma

###########################################################
#  This program determines the total number of people in  #
#  a social network, in addition, determining the minimum #
#  distance between two members of the network            #	
###########################################################

# The number of people in the network
my $num_people;
# A Hash to save people
my %people;
# A Hash to save the friendships
my %friendships;

# Open the social network file
my $network_file = $ARGV[0];
open my $fh,'<',$network_file 
	or die "Can't open File : $_";
	
### Future Work ###	
#  Add logic here to check that the 
#  format of the input file is fine       


# Read the file
while(my $info = <$fh>){
	chomp($info	);
	# Split the names of friends
	my ($friend_1,$friend_2) = split /,/,$info;
	foreach my $person ($friend_1,$friend_2){
		if(exists $people{$person}){
			# This person is already added to the network
			print "$person is already added to the network with value $people{$person}\n";
		} else {
			print "$person is not exist in the network\n";
			# Add this person to the network
			$people{$person}=$num_people++;
			$friendships{$people{$person}}=\my @temp;
			print "$person is taking the value $people{$person}\n";
		}
	}
	# Add this friendship
	push @{$friendships{$people{$friend_1}}}, $people{$friend_2};
	push @{$friendships{$people{$friend_2}}}, $people{$friend_1};
}
close $fh 
	or die "Couldn't close File : $_";
	
print "The number of people in the network is ($num_people)\n";