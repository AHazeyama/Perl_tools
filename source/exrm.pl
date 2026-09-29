#! /usr/bin/perl

#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name	 : exrm.pl
# function : Exclusive remove tool
# method   : exrm.pl [-R] Not_removed_word ･･･
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

my $dir_fg = 0;
my $sps = "";
my $dir = `pwd`;
my $msg = "";
chop $dir;
my @undel_wd = @ARGV;
if ($#ARGV == -1) {
	$msg =
	"┌──────────┬──────────────────────────────────────────────────────\n" .
	"│ name     │ exrm.pl\n" .
	"├──────────┼──────────────────────────────────────────────────────\n" .
	"│ function │ Exclusive remove of files\n" .
	"├──────────┼──────────────────────────────────────────────────────\n" .
	"│ usaeage  │ exrm.pl [-R] Not_removed_words ･･･<⏎ >\n" .
	"└──────────┴──────────────────────────────────────────────────────\n";
	system ("ansi_print bright_green '$msg'");
	exit;
} elsif ($undel_wd[0] =~ /^-R$/) {						# 再帰処理フラグ有
	$dir_fg = 1;
	splice (@undel_wd, 0, 1);							# 非削除ワードリストから再帰処理フラグ除去
}
dwndir($dir, $sps, @undel_wd);							# 再帰処理サブルーチン呼び出し
system ("tree");
exit(0);
	
sub dwndir{ 
	my ($dir, $sps, @undel_wd) = @_;
	$sps .= "	";
	my @files = `ls`;
	my $dir = `pwd`;
	my $del_flg = 1;
	chop $dir;
	$msg = "$sps=> $dir\n";
	system ("ansi_print bright_blue '$msg'");
	foreach my $item_nm (@files) {
		$del_flg = 1;
		chop $item_nm;
		foreach my $word (@undel_wd) {					# 削除対象チェック
			if ($item_nm =~ /$word/) {
				$del_flg = 0;							# 削除除外word Hit !!
# for test : 				Hit($item_nm, $word);
				lasst;
			}
		}
		if ($del_flg == 1) {							# 削除処理
			if (-d $item_nm) {							# ItemがDIR
				if ($dir_fg ==1) {						# 再帰処理フラグ有
					chdir $item_nm;
					dwndir($dir, $sps, @undel_wd);		# 再帰処理サブルーチン呼び出し
					chdir "..";
					if (rmdir($item_nm) == 1) {			# DIR削除(中身があればret==0で削除されない)
						$msg = "$sps 💀 deleted_d $item_nm\n";
						system ("ansi_print bright_red '$msg'");
					} else {
						$msg = "$sps leave_d in   $item_nm\n";
						system ("ansi_print bright_cyan '$msg'");
					}
				} else {
					$msg = "$sps leave_d fg   $item_nm\n";
					system ("ansi_print bright_cyan '$msg'");
				}
			} else {									# ItemがFile
				$msg = "$sps 💀 deleted_f $item_nm\n";
				system ("ansi_print bright_red '$msg'");
				unlink($item_nm);						# File削除
			}
		} else {
			$msg = "$sps leave_f ne   $item_nm\n";
			system ("ansi_print bright_cyan '$msg'");
		}
	}
	$msg = "$sps<= $dir\n";
	system ("ansi_print bright_blue '$msg'");
}

# for test : sub Hit{
# for test : 	my ($wd1, $wd2) = @_;
# for test : 	system ("ansi_print bright_cyan 'Hit '");
# for test : 	system ("ansi_print bright_blue '$wd1'");
# for test : 	system ("ansi_print bright_cyan ' ⇔  '");
# for test : 	system ("ansi_print bright_blue '$wd2\n'");
# for test : }
