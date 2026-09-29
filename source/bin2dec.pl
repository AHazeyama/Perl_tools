#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : bin2dec.pl
# function : conversion tool from decimal to binaly 
# method   : bin2dec.pl Binaly_value
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
#use encoding 'shiftjis', STDIN=>'shiftjis', STDOUT=>'shiftjis';
#use encoding 'UTF8', STDIN=>'UTF8', STDOUT=>'UTF8';
my $bin = 0;
if ($#ARGV == 0) {
    $bin = $ARGV[0];
} else {
    print "_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n";
    print "_/ name     : bin2dec.pl\n";
    print "_/ function : conversion tool from binaly to decimal\n";
    print "_/ usage    : bin2dec.pl Binaly_value\n";
    print "_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n";
    exit;
}
my $dec = 0;
my @bins = split("",$bin);
my $b_no = $#bins;
for ($ii = 0; $ii <= $#bins; $ii++) {
    if ($bins[$b_no] == 1) {
        $dec += 2 ** $ii;
    }
    $b_no--;
}
print "Result : $bin -> $dec\n";
exit;
