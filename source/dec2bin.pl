#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : dec2bin.pl
# function : conversion tool from decimal to binaly 
# method   : dec2bin.pl [digit_value] Decimal_value
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
my $arg_no = $#ARGV;
my $dec = 0;
my $no = 0;
if ($arg_no == 1) {
    $no = $ARGV[0];
    $dec = $ARGV[1];
    print "\nmode1   digit:$no decimal;$dec\n";
} elsif ($arg_no == 0) {
    $dec = $ARGV[0];
    print "\nmode0   digit:real decimal:$dec\n";
} else {
    print "_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n";
    print "_/ name     : dec2bin.pl\n";
    print "_/ function : conversion tool from decimal to binaly\n";
    print "_/ usage    : dec2bin.pl [digit_value] Decimal_value\n";
    print "_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n";
    exit;
}
if ($dec < 0) {
    print " I'm sorry.\n";
    print " This tool does not support the Negative value.\n";
    exit;
}
my $bin;
while ($dec >= 1) {
    $bin = $dec % 2 . $bin;
    $dec = $dec / 2;
    if ($arg_no > 0) {
        $no--;
    }
}
for (my $ii = $no; $ii > 0; $ii--) {
    $bin = "0" . $bin;
}
print "Binaly : $bin\n";
exit;
