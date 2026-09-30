#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : ffmpeg_asp.pl
# function : MP4 Aspect Ratio Changer Tool
# method   : ffmpeg_asp.pl input_file
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

use strict;
use warnings;
my $bfnm = $ARGV[0];
my $msg ="";
$bfnm =~ /(\S+)\.mp4/;
my $afnm = $1 . "_out.mp4"; 
#--- command ------------------------------------
# ffmpeg -i input.mp4 -aspect 16:9 -c copy output.mp4
my $cmd = "ffmpeg -hide_banner -i " . $bfnm . " -aspect 16:9 -c copy " . $afnm;
#--- prompt -------------------------------------
system ("clear");
print "ARGV:$#ARGV\n";
system ("prompt_print");
print "$cmd\n\n";
#--- usage --------------------------------------
if ($#ARGV != 0) {
    my $msg =
    "┌──────────┬──────────────────────────────────────────────┐\n" .
    "│ name     │ ffmpeg_asp.pl                                │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ function │ MP4 Aspect Ratio Changer => 16:9 only        │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ usage    │ ffmpeg_asp.pl input_file <⏎  >               │\n" .
    "└──────────┴──────────────────────────────────────────────┘\n";
    system ("ansi_print on_blue '$msg'");
    exit(0);
}
#--- execution ----------------------------------
sleep (1);
system ($cmd);
`rm -rf $bfnm`;
`mv $afnm $bfnm`;
$msg =
"┌──────────────────────────────────────────────────────────────────────────\n".
"│ 💮 Processing is complete.😸  >>> $bfnm\n" .
"└──────────────────────────────────────────────────────────────────────────\n";
system ("ansi_print bright_magenta '$msg'");
exit (0);
