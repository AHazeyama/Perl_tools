#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : ffmpeg_cut.pl
# function : Remove the beginning portion of the MP4 file.
# method   : ffmpeg_join.pl input_mp4 sec
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

use strict;
use warnings;
my $bfnm = $ARGV[0];
my $sec = $ARGV[1];
my $msg ="";
$bfnm =~ /(\S+)\.mp4/;
my $afnm = $1 . "_cut.mp4"; 
#--- command ------------------------------------
my $cmd = "ffmpeg -hide_banner -ss " . $sec . " -i " . $bfnm . " -c copy ". $afnm;
#--- prompt -------------------------------------
system ("clear");
system ("prompt_print");
print "$cmd\n\n";
#--- usage --------------------------------------
if ($#ARGV != 1) {
    my $msg =
    "┌──────────┬──────────────────────────────────────────────┐\n" .
    "│ name     │ ffmpeg_cut.pl                                │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ function │ Remove the beginning portion of the MP4 file.│\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ usaeage  │ ffmpeg_join.pl input_mp4 sec <⏎  >           │\n" .
    "│          │    sec : Deletion time in seconds            │\n" .
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
