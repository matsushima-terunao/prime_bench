#!/usr/bin/perl

sub count_prime {
    ($size) = @_;
    my @flags;
    $total = 0;
    for ($s = 2; $s < $size; ++$s) {
        $flags[$s] = 1;
    }
    $flags[0] = $flags[1] = 0;
    for ($s = 2; $s < $size / 2; ++$s) {
		if ($flags[$s]) {
			++$total;
            for ($s2 = $s * 2; $s2 < $size; $s2 += $s) {
                $flags[$s2] = 0;
            }
        }
    }
	for (; $s < $size; ++$s) {
		if ($flags[$s]) {
			++$total;
		}
	}
	return $total;
}

if (@ARGV < 1) {
	print "perl prime_bench.pl size [count]\n";
	exit(1);
}
$size = $ARGV[0];
if ($size < 1) {
	print "perl prime_bench.pl size [count]\n";
	exit(1);
}
$count = (@ARGV < 2) ? 1 : $ARGV[1];
$total = 0;
for ($c = 0; $c < $count; ++$c) {
	$total = count_prime($size);
}
print "prime count = $total\n";
exit(0);

