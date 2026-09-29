#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : uzfl.pl
# function : Zip file unzipping and extraction tool
# method   : uzfl.pl prefix
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

#use Term::ANSIColor qw(colored);
use Time::HiRes 'usleep';
my @prm_wd	= @ARGV;
my $prm_ct	= $#ARGV;
my $uif_fg	= 0;
my $keep_fg	= 0;
my $extr_fg	= 0;
my $afwd	= "";
my $preffix	= ""; 
my $pfno	= "";
my $aftr_dr	= "";
my $aftr_nm	= "";
my $file_nm	= "";
my $key		= "";
my $rand4	= "";
my $prefix	= "";
my $msg		= "";
my $name	= "";
my $pos1	= "";
my $dec1	= "";
my $pos2	= "";
my $dec2	= "";
my $preffix	= "";

if ($prm_ct >= 0) {
	foreach $prm_wk (@prm_wd) {
		chomp $prm_wk;
		if ($prm_wk =~ /-E/) {								# Extract the file
			$extr_fg = 1;
		} elsif ($prm_wk =~ /-K/) {							# Keep the original file.
			$keep_fg = 1;
		} else {
			print "An unsupported parameter is specified.\n";
			exit(1);
		}
	}
}

system ("clear");
#print "\nextr_fg:$extr_fg keep_fg:$keep_fg\n";
$msg = 
"┌──────────┬──────────────────────────────────────────────────────┐\n" .
"│ name     │ uzfl.pl                                              │\n" .
"├──────────┼──────────────────────────────────────────────────────┤\n" .
"│ function │ Zip file unzipping and extraction tool               │\n" .
"├──────────┼──────────────────────────────────────────────────────┤\n" .
"│ usaeage  │ uzfl.pl [-E] [-K] <⏎ >                               │\n" .
"│          │   -E : Extract the file                              │\n" .
"│          │   -K : Keep the original file                        │\n" .
"│          │   ※ The input zip file must not contain any spaces.  │\n" .
"│          │                                                      │\n" .
"│          │  The file name in the zip file is                    │\n" .
"│          │     name\.zip           => filename                   │\n" .
"│          │     name_[no]\.zip      => [no]_filename              │\n" .
"│          │     name_[no]-[no].zip => [no]-[no]_filename         │\n" .
"└──────────┴──────────────────────────────────────────────────────┘";
#system ("ansi_print bright_blue '$msg\n'");
system ("ansi_print on_blue '$msg\n'");

if ($extr_fg == 0) {
	$msg = "Extract the files to a single directory.";
} else {
	$msg = "-E : The unzipped files are extracted to their respective directories.";
}
system ("ansi_print bright_yellow '$msg\n'");
if ($keep_fg == 0) {
	$msg =  "Delete the original file.";
} else {
	$msg = "-D : Do not delete the original file.";
}
system ("ansi_print bright_yellow '$msg\n'");
print "\nWould you like to process it ? [Y/N] : ";
$key = <STDIN>;
chomp $key;

my $key_v = $key;
if ($key eq "") {
	$key_v = "<↩️>";
} else {
	$key_v = "<" . $key . ">";
}
$msg = "The specified value is ";
system ("ansi_print bright_cyan '$msg'");
system ("ansi_print bright_magenta '$key_v\n'");

if (($key =~ /[Yy]/) || $key eq "") {								# Y/y/<Enter>のみに対応
	my $f_no = 0;
	my @files = `ls *.zip`;
	my $f_all = $#files + 1;
	my $prefix = "";
	foreach $file_nm (@files) {
		chomp $file_nm;
		$rand4 = sprintf("%04d", int(rand(10000)));					# File名重複防止乱数
		$f_no++;
		$dec1 = $pos1 = $dec2 = $pos2 = "00";						# 00 initialize
		if ($file_nm =~ /(\S+)_(\d+)\.(\d+)\-(\d+)\.(\d+)\.zip$/) {	# file_nm_00.00-00.00.zip
			$name   = $1;
			$dec1 = sprintf("%02d", $2 + 0);
			$pos1 = sprintf("%02d", $3 + 0);
			$dec2 = sprintf("%02d", $4 + 0);
			$pos2 = sprintf("%02d", $5 + 0);
			$prefix = $dec1 . "." .  $pos1 . "-" . $dec2 . "." . $pos2 . "_" . $rand4 . "_";	# xx.xx-xx.xx
		} elsif ($file_nm =~ /(\S+)_(\d+)\-(\d+)\.(\d+)\.zip$/) {	# file_nm_00-00.00.zip
			$name   = $1;
			$dec1 = sprintf("%02d", $2 + 0);
			$dec2 = sprintf("%02d", $3 + 0);
			$pos2 = sprintf("%02d", $4 + 0);
			$prefix = $dec1 . "-" . $dec2 . "." . $pos2 . "_" . $rand4 . "_";	# xx.xx-xx.xx_xxxx
		} elsif ($file_nm =~ /(\S+)_(\d+)\.(\d+)\-(\d+)\.zip$/) {	# file_nm_00.00-00.zip
			$name   = $1;
			$dec1 = sprintf("%02d", $2 + 0);
			$pos1 = sprintf("%02d", $3 + 0);
			$dec2 = sprintf("%02d", $4 + 0);
			$prefix = $dec1 . "." .  $pos1 . "-" . $dec2 . "_" . $rand4 . "_";	# xx.xx-xx.xx_xxxx
		} elsif	($file_nm =~ /(\S+)_(\d+)\-(\d+)\.zip$/) {			# file_name_00-00.zip
			$name   = $1;
			$dec1 = sprintf("%02d", $2 + 0);
			$dec2 = sprintf("%02d", $3 + 0);
			$prefix = $dec1 . "-" . $dec2 . "_" . $rand4 . "_";		# xx.xx-xx.xx-xxxx
		} elsif ($file_nm =~ /(\S+)_(\d+)\.(\d+)\.zip$/) {			# file_nm_00.00.zip
			$name   = $1;
			$dec1 = sprintf("%02d", $2 + 0);
			$pos1 = sprintf("%02d", $3 + 0);
			$prefix = $dec1 . "." .  $pos1 . "_" . $rand4 . "_";	# xx.xx_xxxx
		} elsif	($file_nm =~ /(\S+)_(\d+)\.zip$/) { 				# file_name_00.zip
			$name   = $1;
			$dec1 = sprintf("%02d", $2 + 0);
			$prefix = $dec1 . "_" . $rand4 . "_";					# xx.xx-xx.xx_xxxx
		} elsif ($file_nm =~ /(\S+)\.zip$/) {						# file_name.zip
			$name = $1;
			$prefix = "";
		} else {
			next;
		}
		$dir_nm = $prefix . $name;

		$msg = sprintf("━━ %03d/%03d ━━ ", $f_no, $f_all);
		system ("ansi_print bright_magenta '$msg'");
		$msg = "unzip ";
		system ("ansi_print bright_yellow '$msg'");
		system ("ansi_print bright_blue '$file_nm\n'");

#		usleep (500 * 1000);
		sleep (1);
		system ("unzip -d \'$dir_nm\' \'$file_nm\' > /dev/null");	# 特殊文字対策:'で展開無効
#		system ("unzip -d \'$dir_nm\' \'$file_nm\'");	# 特殊文字対策:'で展開無効
		if ($prefix ne "") {										# Prefixがあった場合のみリネーム
			chdir $dir_nm;
			$msg =
			"┌───────────────────────────────────────────────────────────────────────────────\n" .
			"│ $file_nm : Rename process begins\n" .
			"└───────────────────────────────────────────────────────────────────────────────";
			system ("ansi_print bright_blue '$msg\n'");
			usleep (500 * 1000);
			system ("renm.pl -F ^ $prefix");						# 解凍後のfile名にprefix付加
			chdir "..";
		}
		if ($extr_fg == 1) {
			system ("mv $dir_nm/* .");
			system ("rm -rf $dir_nm");
		}
		if ($keep_fg == 0) {
			system ("rm -rf $file_nm");
		}
	}
#	system ("clear");
	if ($f_no > 0) {
		$msg = 
		"┌────────────────────────────────────────────────────────\n" .
		"│\n" .
		"│ 👍 Processing has completed. File count is $f_no.🆗\n" .
		"│\n" .
		"└────────────────────────────────────────────────────────";
		system ("ansi_print bright_cyan '$msg\n'");
	} else {
		$msg = 
		"┌────────────────────────────────────────────────────────\n" .
		"│\n" .
		"│ ⚠️ There was no zip file.💦\n" .
		"│\n" .
		"└────────────────────────────────────────────────────────";
		system ("ansi_print bright_yellow '$msg\n'");
	}
} else {
#	system ("clear");												# デバッグ向けにClear無し
	$msg = 
	"┌────────────────────────────────────────────────────────\n" .
	"│\n" .
	"│ 🚨 Processing has been aborted.🆖\n" .
	"│\n" .
	"└────────────────────────────────────────────────────────";
	system ("ansi_print bright_red '$msg\n'");
}
exit(0);

