#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : ffmpeg_exmerge.pl
# function : Merge MP4 files tool
# method   : ffmpeg_exmerge.pl output_mp4 list.txt
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

use strict;
use warnings;
use Term::ANSIColor qw(colored);
my $bfnm = $ARGV[0];
my $list = $ARGV[1];
my $msg = "";
$bfnm =~ /(\S+)\.mp4/;
my $afnm = $1;
#--- command ------------------------------------
#my $cmd = "ffmpeg -hide_banner -f concat -safe 0 -i " . $list . " -c copy ". $afnm . "_all.mp4";
my $cmd = "ffmpeg -f concat -safe 0 -i " . $list . " -c:v libx264 -c:a aac " . $afnm . "_all.mp4";

#--- prompt -------------------------------------
system ("clear");
system ("prompt_print");
print "$cmd\n\n";
#--- usage --------------------------------------
if ($#ARGV != 1) {
    $msg =
    "┌──────────┬──────────────────────────────────────────────┐\n" .
    "│ name     │ ffmpeg_exmerge.pl                            │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ function │ Merge MP4 files                              │\n" .
    "├──────────┼──────────────────────────────────────────────┤\n" .
    "│ usaeage  │ ffmpeg_exmerge.pl output_mp4 list.txt <⏎  >  │\n";
    system ("ansi_print on_blue '$msg'");
    print colored ("│          │    list.txt ", "on_blue");
    print colored ("┌───────────────────┐", "on_bright_blue");
    print colored ("            │\n", "on_blue");

    print colored ("│          │             ", "on_blue");
    print colored ('│ file \'file_1.mp4\' │', "on_bright_blue");
    print colored ("            │\n", "on_blue");

    print colored ("│          │             ", "on_blue");
    print colored ("│          :        │", "on_bright_blue");
    print colored ("            │\n", "on_blue");

    print colored ("│          │             ", "on_blue");
    print colored ('│ file \'file_n.mp4\' │', "on_bright_blue");
    print colored ("            │\n", "on_blue");

    print colored ("│          │             ", "on_blue");
    print colored ("└───────────────────┘", "on_bright_blue");
    print colored ("            │\n", "on_blue");
    print colored ("└──────────┴──────────────────────────────────────────────┘\n", "on_blue");
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
