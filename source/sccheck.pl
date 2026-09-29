#!/usr/bin/env perl

# Detected word : ' ''　'!！()（）[]「」【】
my $word = $ARGV[0];
print "check start\n";
if (($word =~ / /)   || ($word =~ /　/)  ||
	($word =~ /\!/)  || ($word =~ /\！/) ||
	($word =~ /\(/)  || ($word =~ /\)/)  ||
	($word =~ /\（/) || ($word =~ /\）/) ||
	($word =~ /\[/)  || ($word =~ /\]/)  ||
	($word =~ /\「/) || ($word =~ /\」/) ||
	($word =~ /\【/) || ($word =~ /\】/)) {
	print "ERROR Hit is $word\n";					# Hit is error
	exit(1);
}
exit(0);
