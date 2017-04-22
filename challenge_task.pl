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
	
# Check the format of the file

# Read the file
while(my $info = <$fh>){
	chomp($info	);
	my ($friend_1,$friend_2) = split /,/,$info;
	foreach my $friend ($friend_1,$friend_2){
	
	
	}



}

close $fh 
	or die "Couldn't close File : $_";