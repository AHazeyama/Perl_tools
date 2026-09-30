#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : ffmpeg_split.pl
# function : MP4 file splitting tool
# method   : ffmpeg_split.pl input_mp4 sec
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

use strict;
use warnings;
my $bfnm = $ARGV[0];
my $sec = $ARGV[1];
my $msg = "";
$bfnm =~ /(\S+)\.mp4/;
my $afnm = $1;
#--- command ------------------------------------
my $cmd = "ffmpeg -hide_banner -i " . $bfnm . " -c copy -map 0 -segment_time ". $sec . " -f segment " . $afnm . "%02d.mp4";
#--- prompt -------------------------------------
system ("clear");
system ("prompt_print");
print "$cmd\n\n";
#--- usage --------------------------------------
if ($#ARGV != 1) {
    $msg =
    "┌──────────┬──────────────────────────────────────────────┐\n" .
    "│ name     │ ffmpeg_split.pl                              │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ function │ MP4 file splitting                           │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ usage    │ ffmpeg_split.pl input_mp4 sec <⏎  >          │\n" .
    "│          │    sec : Deletion time in seconds            │\n" .
    "└──────────┴──────────────────────────────────────────────┘\n";
    system ("ansi_print on_blue '$msg'");
    exit(0);
}
#--- execution ----------------------------------
sleep (1);
system ($cmd);
$msg =
"┌──────────────────────────────────────────────────────────────────────────\n".
"│ 💮 Processing is complete.😸  >>> $bfnm\n" .
"└──────────────────────────────────────────────────────────────────────────\n";
system ("ansi_print bright_magenta '$msg'");
exit (0);
