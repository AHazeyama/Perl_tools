#!/usr/bin/env perl

#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# name     : rerm.pl
# function : Regular expression remove tool
# method   : rerm.pl [-R] Not_removed_word ･･･
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

my $dir_fg = 0;
my $sps = "";
my $dir = `pwd`;
chop $dir;

my @undel_wd = @ARGV;
if ($#ARGV == -1) {
    print "_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n";
    print "_/ name        : rerm.pl\n";
    print "_/ function    : Regular expression remove of files\n";
    print "_/ usae        : rerm.pl [-R] Not_removed_words ･･･\n";
    print "_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/\n\n";
    exit;
} elsif ($undel_wd[0] =~ /^-R$/) {						# 再帰処理フラグ有
    $dir_fg = 1;
    splice (@undel_wd, 0, 1);							# 非削除ワードリストから再帰処理フラグ除去
}

dwndir($dir, $sps, @undel_wd);							# 再帰処理サブルーチン呼び出し
exit;
    
sub dwndir{ 
     my ($dir, $sps, @undel_wd) = @_;
    $sps .= "    ";
     my @files = `ls`;
    my $dir = `pwd`;
    my $del_flg = 1;
    chop $dir;
    print "\n$sps=> $dir\n";
     foreach my $item_nm (@files) {
        $del_flg = 1;
        chop $item_nm;
        foreach my $word (@undel_wd) {					# 削除対象チェック
            if ($item_nm =~ /$word/) {
                $del_flg = 0;
                lasst;
            }
        }
        if ($del_flg == 1) {							# 削除処理
            if (-d $item_nm) {							# ItemがDIR
                if ($dir_fg ==1) {						# 再帰処理フラグ有
                    chdir $item_nm;
                    dwndir($dir, $sps, @undel_wd);		# 再帰処理サブルーチン呼び出し
                    chdir "..";
                    if (rmdir($item_nm) == 1) {			# DIR削除 中身があれば ret==0 で削除されない
                        print "$sps rmdir      $item_nm\n";
                    } else {
                        print "$sps leave_d in $item_nm\n";
                    }
                } else {
                    print "$sps leave_d fg $item_nm\n";
                }
            } else {									# ItemがFile
                print "$sps unlink     $item_nm\n";
                unlink($item_nm);						# file削除
            }
        } else {
            print "$sps leave_f ne $item_nm\n";
        }
    }
    print "$sps<= $dir\n\n";
 }
