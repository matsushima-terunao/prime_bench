import java.util.Arrays;

class prime_bench {
	public static int count_prime(int size) {
		int total = 0, s, s2;
		boolean[] flags = new boolean[size];
		Arrays.fill(flags, true);
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
	
	public static void main(String[] args) {
		//long time = System.currentTimeMillis();
		if (args.length < 1) {
			System.out.printf("java prime_bench size [count]\n");
			System.exit(1);
		}
		int size = Integer.parseInt(args[0]);
		if (size < 1) {
			System.out.printf("java prime_bench size [count]\n");
			System.exit(1);
		}
		int count = (args.length < 2) ? 1 : Integer.parseInt(args[1]);
		int total = 0;
		for (int c = 0; c < count; ++c) {
			total = count_prime(size);
		}
		System.out.printf("prime count = %d\n", count);
		//System.out.printf("time(ms) = %d\n", System.currentTimeMillis() - time);
		System.exit(0);
	}
}
