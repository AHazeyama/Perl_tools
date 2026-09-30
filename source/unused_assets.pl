#!/usr/bin/env perl

# ============================================================
# unused_assets.pl
#
# Markdownから参照されていないassetsファイルを検索し、
# 削除またはDeleteディレクトリへ退避する。
#
# Usage:
#   perl unused_assets.pl <assets_dir> <markdown_file_or_dir>
#
# Example:
#   perl unused_assets.pl ./assets ./README.md
#   perl unused_assets.pl ./assets .
#
# markdown_file_or_dir:
#   File : 指定Markdownファイルのみ検査
#   DIR  : DIR以下の *.md を再帰的にすべて検査
# ============================================================

use strict;
use warnings;
use utf8;

use File::Find;
use File::Basename qw(basename dirname);
use File::Path qw(make_path);
use File::Copy qw(move);
use File::Spec;
use Cwd qw(abs_path);

binmode STDIN,  ':encoding(UTF-8)';
binmode STDOUT, ':encoding(UTF-8)';
binmode STDERR, ':encoding(UTF-8)';


# ------------------------------------------------------------
# Arguments
# ------------------------------------------------------------

my ($target_dir, $reference) = @ARGV;

#--- usage --------------------------------------
if ($#ARGV != 1) {
    my $msg =
    "┌──────────┬─────────────────────────────────────────────────────────┐\n" .
    "│ name     │ unused_assets.pl                                        │\n" .
    "├──────────┼─────────────────────────────────────────────────────────┤\n" .
    "│ function │ Tool to delete files not included                       │\n" .
    "├──────────┼─────────────────────────────────────────────────────────┤\n" .
    "│ usage    │ unused_assets.pl assets_dir markdown_file_or_dir <⏎  >  │\n" .
    "│          │                  File or Directory to check             │\n" .
    "│          │                  Markdown to be checked                 │\n" .
    "│          │                     (Regular expressions possible)      │\n" .
    "└──────────┴─────────────────────────────────────────────────────────┘\n";
    system ("ansi_print on_blue '$msg'");
    exit(0);
}
#--- execution ----------------------------------

die "Usage: perl $0 <assets_dir> <markdown_file_or_dir>\n"
    unless defined $target_dir && defined $reference;

die "Assets directory not found: $target_dir\n"
    unless -d $target_dir;

die "Markdown file/directory not found: $reference\n"
    unless -e $reference;

$target_dir = abs_path($target_dir);
$reference  = abs_path($reference);

# ------------------------------------------------------------
# Get Markdown files
# ------------------------------------------------------------

my @markdown_files;

if (-f $reference) {

    # Single Markdown file
    die "Not a Markdown file: $reference\n"
        unless $reference =~ /\.md$/i;

    push @markdown_files, $reference;
}
else {

    # All Markdown files recursively
    find(
        {
            wanted => sub {
                return unless -f $_;
                return unless /\.md$/i;

                push @markdown_files, $File::Find::name;
            },
            no_chdir => 1,
        },
        $reference
    );
}

die "No Markdown files found.\n"
    unless @markdown_files;

print "\n--- Markdown files ---\n\n";

for my $md (sort @markdown_files) {
    print "$md\n";
}


# ------------------------------------------------------------
# Read Markdown files
# ------------------------------------------------------------

my %markdown_text;

for my $md (@markdown_files) {

    open my $fh, '<:encoding(UTF-8)', $md
        or die "Cannot open $md: $!\n";

    $markdown_text{$md} = do {
        local $/;
        <$fh>;
    };

    close $fh;
}


# ------------------------------------------------------------
# Get asset files recursively
# ------------------------------------------------------------

my @files;

find(
    {
        wanted => sub {

            return unless -f $_;

            # Previous backup directory is not an asset.
            my $path = $File::Find::name;

            my $relative =
                File::Spec->abs2rel($path, $target_dir);

            $relative =~ s{\\}{/}g;

            return if $relative =~ m{^Delete(?:/|$)};

            push @files, $path;
        },
        no_chdir => 1,
    },
    $target_dir
);

die "No asset files found.\n"
    unless @files;


# ------------------------------------------------------------
# Check duplicate filenames
# ------------------------------------------------------------

my %basename_map;

for my $file (@files) {
    push @{ $basename_map{basename($file)} }, $file;
}

my @duplicates =
    sort grep {
        @{ $basename_map{$_} } > 1
    } keys %basename_map;

if (@duplicates) {

    print "\n--- Duplicate filenames ---\n\n";

    for my $name (@duplicates) {

        print "$name\n";

        for my $file (sort @{ $basename_map{$name} }) {

            my $relative =
                File::Spec->abs2rel($file, $target_dir);

            $relative =~ s{\\}{/}g;

            print "    $relative\n";
        }

        print "\n";
    }
}
else {
    print "\n--- Duplicate filenames ---\n\n";
    print "None\n";
}


# ------------------------------------------------------------
# Check usage
# ------------------------------------------------------------

my @unused;

print "\n--- Check files ---\n\n";

for my $file (sort @files) {

    my $used = 0;

    # Check path relative to each Markdown file.
    for my $md (@markdown_files) {

        my $md_dir = dirname($md);

        my $relative =
            File::Spec->abs2rel($file, $md_dir);

        # Markdown path separator
        $relative =~ s{\\}{/}g;

        # Both forms are accepted:
        #
        #   assets/env/M_link.png
        #   ./assets/env/M_link.png
        #
        my $markdown_path =
            ($relative =~ m{^\.\./})
                ? $relative
                : "./$relative";

        if (
            index($markdown_text{$md}, $markdown_path) >= 0 ||
            index($markdown_text{$md}, $relative)      >= 0
        ) {
            $used = 1;
            last;
        }
    }

    my $display =
        File::Spec->abs2rel($file, $target_dir);

    $display =~ s{\\}{/}g;

    if ($used) {
        print "[+] $display\n";
    }
    else {
        print "[-] $display\n";
        push @unused, $file;
    }
}


# ------------------------------------------------------------
# Result
# ------------------------------------------------------------

print "\n--- Unused files ---\n\n";

if (!@unused) {
    print "Unused files: 0\n\n";
    exit 0;
}

for my $file (@unused) {

    my $relative =
        File::Spec->abs2rel($file, $target_dir);

    $relative =~ s{\\}{/}g;

    print "$relative\n";
}

printf "\n%d unused file(s) found.\n", scalar @unused;


# ------------------------------------------------------------
# Confirmation
# ------------------------------------------------------------

print "\nDelete unused files? [y/N]: ";
chomp(my $answer = <STDIN> // '');

unless (lc($answer) eq 'y') {
    print "\nCanceled.\n";
    exit 0;
}


# ------------------------------------------------------------
# Select Delete / Backup
# ------------------------------------------------------------

print "\nDelete or Backup? [d/B]: ";
chomp(my $action = <STDIN> // '');

# d/D         : Delete
# Enter/b/B   : Backup
my $use_backup = (lc($action) ne 'd');


# ------------------------------------------------------------
# Backup preparation
# ------------------------------------------------------------

my $delete_dir =
    File::Spec->catdir($target_dir, 'Delete');

if ($use_backup) {

    # Existing Delete directory is allowed.
    # Directory structure is preserved below it.
    make_path($delete_dir)
        unless -d $delete_dir;

    print "\nBackup directory:\n";
    print "$delete_dir\n\n";
}
else {
    print "\nDelete files permanently.\n\n";
}


# ------------------------------------------------------------
# Delete / Backup
# ------------------------------------------------------------

my $success = 0;
my $failed  = 0;

for my $file (@unused) {

    my $relative =
        File::Spec->abs2rel($file, $target_dir);

    if ($use_backup) {

        my $dest =
            File::Spec->catfile(
                $delete_dir,
                $relative
            );

        my $dest_dir = dirname($dest);

        make_path($dest_dir)
            unless -d $dest_dir;

        if (-e $dest) {
            warn "Backup destination already exists: $dest\n";
            $failed++;
            next;
        }

        if (move($file, $dest)) {
            print "MOVE   $relative\n";
            $success++;
        }
        else {
            warn "Move failed: $file -> $dest : $!\n";
            $failed++;
        }
    }
    else {

        if (unlink $file) {
            print "DELETE $relative\n";
            $success++;
        }
        else {
            warn "Delete failed: $file : $!\n";
            $failed++;
        }
    }
}


# ------------------------------------------------------------
# Summary
# ------------------------------------------------------------

print "\n--- Result ---\n\n";

if ($use_backup) {
    print "Backup : $success\n";
}
else {
    print "Delete : $success\n";
}

print "Failed : $failed\n";

print "\nDone.\n";

exit($failed ? 1 : 0);
