#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : ffmpeg_thumb.pl
# function : Insert thumbnails into MP4 files
# method   : ffmpeg_join.pl input_mp4 image
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

use strict;
use warnings;
my $bfnm = $ARGV[0];
my $image = $ARGV[1];
my $msg = "";
$bfnm =~ /(\S+)\.mp4/;
my $afnm = $1 . "_thum.mp4";
#--- command ------------------------------------
my $cmd = "ffmpeg -hide_banner -i " . $bfnm . " -i " . $image . " -map 0 -map 1 -c copy -disposition:v:1 attached_pic " . $afnm;
#--- prompt -------------------------------------
system ("clear");
system ("prompt_print");
print "$cmd\n\n";
#--- usage --------------------------------------
if ($#ARGV != 1) {
    $msg =
    "┌──────────┬──────────────────────────────────────────────┐\n" .
    "│ name     │ ffmpeg_thumb.pl                              │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ function │ Insert thumbnails into MP4 files             │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ usaeage  │ ffmpeg_join.pl input_mp4 image <⏎  >         │\n" .
    "│          │    image : Thumbnail image (jpg, png)        │\n" .
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
