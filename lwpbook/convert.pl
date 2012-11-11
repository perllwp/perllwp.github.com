use strict;
use warnings;
use v5.10;
use Pod::HTML2Pod;

my @files = <*.html>;
my $dir = 'pod';

for my $file ( @files ) {
my ($basename) = $file =~/(.*)\.htm/;
$basename .= '.pod';

open my $fh,'>',"./$dir/$basename" or die "$!";

  print {$fh} Pod::HTML2Pod::convert(
    'file' =>"$file",  # input file
    'a_href' => 1,  # try converting links
  );

}
