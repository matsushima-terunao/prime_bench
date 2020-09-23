<?php
function count_prime($size) {
	$total = 0;
    $flags = array_pad(array(), $size, true);
	$flags[0] = $flags[1] = false;
    for ($s = 2; $s < $size / 2; ++$s) {
		if ($flags[$s]) {
			++$total;
            for ($s2 = $s * 2; $s2 < $size; $s2 += $s) {
                $flags[$s2] = false;
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

if (count($argv) < 2) {
	print "php " . $argv[0] . " size [count]" . PHP_EOL;
	exit(1);
}
$size = $argv[1];
if ($size < 1) {
	print "php " . $argv[0] . " size [count]" . PHP_EOL;
	exit(1);
}
$count = (count($argv) < 3) ? 1 : $argv[2];
$total = 0;
for ($c = 0; $c < $count; ++$c) {
	$total = count_prime($size);
}
print "prime count = " . $total . PHP_EOL;
exit(0);

