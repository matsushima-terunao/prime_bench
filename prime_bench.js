function count_prime(size) {
	var total = 0, s, s2;
	var flags = new Array(size);
	flags.fill(true);
	flags[0] = flags[1] = false;
	for (s = 2; s < size / 2; ++s) {
		if (flags[s]) {
			++total;
			for (s2 = s * 2; s2 < size; s2 += s) {
				flags[s2] = false;
			}
		}
	}
	for (; s < size; ++s) {
		if (flags[s]) {
			++total;
		}
	}
	return total;
}

function prime_bench(size, count) {
	var total = 0;
	for (var c = 0; c < count; ++c) {
		total = count_prime(size);
	}
	return total;
}

(function () {
	if ("undefined" != typeof process) {
		if (process.argv.length < 3) {
			console.log("node " + process.argv[1] + " size [count]");
			process.exitCode = 1;
			return;
		}
		var size = process.argv[2] - 0;
		if (size < 2) {
			console.log("node " + process.argv[1] + " size [count]");
			process.exitCode = 1;
			return;
		}
		var count = (process.argv.length < 4) ? 1 : process.argv[3] - 0;
		var total = prime_bench(size, count);
		console.log("prime count = " + total);
	}
})();

