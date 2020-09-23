<?php
// Your code here!

$size = 1000000;
$count = 1000;
$total = 0;
for ($c = 0; $c < $count; ++$c) {
    $flags = array_pad(array(), $size, 0);
    for ($s = 2; $s < $size; ++ $s) {
        if (!$flags[$s]) {
            for ($s2 = $s * 2; $s2 < $size; $s2 += $s) {
                $flags[$s2] = 1;
            }
        }
    }
}
for ($s = 2; $s < $size; ++$s) {
    if (!$flags[$s]) {
        ++$total;
    }
}
print $total . PHP_EOL;
print "size = " . $size . ", count = " . $count . ", total = " . $total . PHP_EOL;

