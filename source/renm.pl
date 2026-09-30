#! /usr/bin/perl
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : renm.pl
# function : rename of files
# method   : renm.pl before_word after_word
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

my $opt_fg	= 0;
my $sps		= "";
my $dir		= `pwd`;
chomp $dir;
if (($#ARGV == 2) && ($ARGV[0] =~ /-R/)) {
    $opt_fg = 1;
    $bfo_wd = $ARGV[1];
    $aft_wd = $ARGV[2];
} elsif (($#ARGV == 2) && ($ARGV[0] =~ /-F/)) {				# 自動実行時は元ファイルを削除
    $opt_fg = 2;
    $bfo_wd = $ARGV[1];
    $aft_wd = $ARGV[2];
} elsif ($#ARGV == 1) {
    $bfo_wd = $ARGV[0];
    $aft_wd = $ARGV[1];
} else {
	system ("clear");
	$msg =
	"┌──────────┬─────────────────────────────────────────────┐\n" .
	"│ name     │ renm.pl                                     │\n" .
	"├──────────┼─────────────────────────────────────────────┤\n" .
	"│ function │ rename of files                             │\n" .
	"├──────────┼─────────────────────────────────────────────┤\n" .
	"│ usage    │ renm.pl [-R] before_word after_word <⏎ >    │\n" .
	"│          │     Regular expressions can be used.        │\n" .
	"│          │   -R : Lower-level processing               │\n" .
	"└──────────┴─────────────────────────────────────────────┘\n";
	system ("ansi_print on_blue '$msg\n'");
    exit;
}
#print "opt_fg:$opt_fg:ARGV:$#ARGV:";
#foreach my $wk (@ARGV) {
#	print ";$wk";
#}
#print"\n";
if ($opt_fg == 0) {											# 通常実行時のみ処理可否判定
	my @wk_nm = `ls`;
	print "\n--- Conversion candidates --- $prt_fgi : $ARGV[0] : $#ARGV ---\n";
    foreach my $item (@wk_nm) {
		chomp $item;
		if ($item =~ /$bfo_wd/) {
			print "  $item\n";
		}
	}
	print "-----------------------------\n";
	print "\nWould you like to process it ? [Y/N] : ";
	$key = <STDIN>;
	chomp $key;
	if ($key ne "" && $key !~ /[Yy]/) {
		exit;
	}
}
dwndir($dir, $sps, $bfo_wd, $aft_wd);						# 再帰処理サブルーチン呼び出し
exit;
    
sub dwndir{ 
    my ($dir, $sps, $bfo_wd, $aft_wd) = @_;
    $sps .= "    ";
    my @files = `ls`;
    my $dir = `pwd`;
    chomp $dir;
    system("ansi_print bright_blue '\n$sps=> $dir\n'");
    foreach my $bfo_nm (@files) {
        chop $bfo_nm;
        my $aft_nm = $bfo_nm;
        $aft_nm =~ s/$bfo_wd/$aft_wd/g;
        if ((-d $bfo_nm) && ($opt_fg == 1)) {
            chdir $bfo_nm;
            dwndir($bfonm, $sps, $bfo_wd, $aft_wd);			# 再帰処理サブルーチン呼び出し
            chdir "..";
        }
        if ($bfo_nm =~ /$bfo_wd/) {
            rename ($bfo_nm, $aft_nm);
            system("ansi_print white '$sps    $bfo_nm '");
            system("ansi_print bright_yellow '=> '");
            system("ansi_print bright_cyan '$aft_nm\n'");
        }
    }
    system ("ansi_print bright_blue  '$sps<= $dir\n\n'");
 }
