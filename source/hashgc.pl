#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : hashgc.pl
# function : Hash Value Calculator sha256 only
# method   : hashgc.pl Hash_expectation
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
use strict;
use warnings;
use Digest::SHA qw(sha256_hex);

my $ex_val = "";

my $arg_no = $#ARGV;
print"arg_no:$arg_no\n";
if ($arg_no == 1) {
  $ex_val = $ARGV[1];
  print "$ex_val\n\n";
} else {
    my $msg =
    "┌──────────┬───────────────────────────────────────────────┐\n" .
    "│ name     │ hashgc.pl                                     │\n" .
    "├──────────┼───────────────────────────────────────────────┤\n" .
    "│ function │ function : Hash Value Calculator sha256 only  │\n" .
    "├──────────┼───────────────────────────────────────────────┤\n" .
    "│ usage    │ hashgc.pl input_file <⏎  >                    │\n" .
    "└──────────┴───────────────────────────────────────────────┘\n";
    system ("ansi_print on_blue '$msg'");
    exit(0);
}
my $data = "example\@example.com";
my $hash_key = sha256_hex($data);

if (defined $ex_val && $ex_val ne '') {
  print "Expected Hash  : $ex_val\n";
  if ($hash_key eq $ex_val) {
	print "Mach : The generated hash key matches the expected value.\n";
  } else {
    print "Discrepancy : The hash key does not match the expected value.\n";
  }
}
print "Generated Hash : $hash_key\n";

exit;
