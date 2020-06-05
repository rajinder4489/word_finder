use strict;
use warnings;
use Data::Dumper;
use Array::Utils qw(:all);

my @a = @ARGV;

my $dict_f = "english3.txt";

open(my $dict, $dict_f) or die "Could not open file '$dict_f' $!";

my %d;

while(<$dict>)
{
	$_ =~ s/\s|\n|\t|\r//g;
	$d{$_} = undef;
}

my $l = shift @a;
my $r = pop @a;
my @rep = split //, $r;

#print Dumper \%d;
my @arr = split //, $a[0];
my @words = @arr;

my @rep_na = array_minus( @arr, @rep );	#repition not allowed


while(length($words[0]) < $l)
{
#	@words = words_formed(\@words, \@arr);
	
	my @temp;
	
	for(my $i=0; $i<scalar(@words); $i++)
	{
		for(my $j=0; $j<scalar(@arr); $j++)
		{
			push @temp, $words[$i].$arr[$j];
		}
	}
	@words = @temp;
}

my %f;
foreach my $word (@words)
{
	if(exists $d{$word})
	{
#		my $number = 1;		
#		foreach my $alpha (@rep_na)
#		{
#			$number = () = $word =~ /$alpha/gi;
#			if($number>1)
#			{last;}
#		}
				
#		if($number == 1)
#		{
			$f{$word} = undef;
#		}
	}
}

foreach(keys %f)
{
	print "$_\n";
}