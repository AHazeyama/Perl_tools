#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : ffmpeg_vol.pl
# function : Adjusting the volume of an MP4 file
# method   : ffmpeg_join.pl input_mp4 vol
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

use strict;
use warnings;
my $bfnm = $ARGV[0];
my $vol = $ARGV[1];
my $msg ="";
$bfnm =~ /(\S+)\.mp4/;
my $afnm = $1 . "x" . $vol . ".mp4"; 
#--- command ------------------------------------
my $cmd = 'ffmpeg -hide_banner -i ' . $bfnm . ' -filter:a "volume= ' . $vol . ',aresample=async=1" ' . $afnm;
#--- prompt -------------------------------------
system ("clear");
system ("prompt_print");
print "$cmd\n\n";
#--- usage --------------------------------------
if ($#ARGV != 1) {
    my $msg =
    "┌──────────┬──────────────────────────────────────────────┐\n" .
    "│ name     │ ffmpeg_vol.pl                                │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ function │ Adjusting the volume of an MP4 file          │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ usage    │ ffmpeg_join.pl input_mp4 vol <⏎  >           │\n" .
    "│          │    vol : Audio Magnification (0.5, 2, 4)     │\n" .
    "└──────────┴──────────────────────────────────────────────┘\n";
    system ("ansi_print on_blue '$msg\n'");
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
