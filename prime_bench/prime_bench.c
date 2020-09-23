#define USE_ORG
#define USE_BIT_ARRAY
#define USE_BIT_ARRAY_ORG

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef USE_ORG
// オリジナル版
static int count_prime(int size) {
	int total = 0, s, s2;
	// 結果配列初期化
	char* flags = (char*)malloc(size);
	memset(flags, 1, size);
	flags[0] = flags[1] = 0;
	// 素数をカウント、素数の倍数を素数でないと設定
	for (s = 2; s < size / 2; ++s) {
		if (flags[s]) {
			++total;
			for (s2 = s * 2; s2 < size; s2 += s) {
				flags[s2] = 0;
			}
		}
	}
	// 素数をカウント
	for (; s < size; ++s) {
		total += flags[s];
	}
	// 後処理
	free(flags);
	return total;
}

#elif defined USE_BIT_ARRAY
// ビット配列版
// bit array: clang -O3 11.0.0 (clang-1100.0.33.17) 0m3.184s
static int count_prime(int size) {
	static char mask[] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
	static char unmask[] = {0xfe, 0xfd, 0xfb, 0xf7, 0xef, 0xdf, 0xbf, 0x7f};
	int total = 1, s, s2;
	// 結果配列初期化
	char* flags = (char*)malloc((size + 7) >> 3);
	memset(flags, 0xaa, (size + 7) >> 3); // 2の倍数はクリア
	flags[0] = 0xac;
	// 素数をカウント、素数の倍数を素数でないと設定
#ifdef USE_BIT_ARRAY_ORG
	// ビット配列
	for (s = 2; s < size / 2; ++s) {
		if (flags[s >> 3] & mask[s & 7]) {
			++total;
			for (s2 = s * 2; s2 < size; s2 += s) {
				flags[s2 >> 3] &= unmask[s2 & 7];
			}
		}
	}
#else
	// ビット配列＆最適化
	for (s = 3; s < size / 4; ++s) {
		if (flags[s >> 3] & mask[s & 7]) {
			++total;
			s2 = s * 2;
			for (; s2 + s * 7 < size; s2 += s * 8) {
				flags[s2 >> 3] &= unmask[s2 & 7];
				flags[(s2 + s * 1) >> 3] &= unmask[(s2 + s * 1) & 7];
				flags[(s2 + s * 2) >> 3] &= unmask[(s2 + s * 2) & 7];
				flags[(s2 + s * 3) >> 3] &= unmask[(s2 + s * 3) & 7];
				flags[(s2 + s * 4) >> 3] &= unmask[(s2 + s * 4) & 7];
				flags[(s2 + s * 5) >> 3] &= unmask[(s2 + s * 5) & 7];
				flags[(s2 + s * 6) >> 3] &= unmask[(s2 + s * 6) & 7];
				flags[(s2 + s * 7) >> 3] &= unmask[(s2 + s * 7) & 7];
			}
			for (; s2 < size; s2 += s) {
				flags[s2 >> 3] &= unmask[s2 & 7];
			}
		}
	}
	for (; s < size / 3; ++s) {
		if (flags[s >> 3] & mask[s & 7]) {
			++total;
			flags[(s * 2) >> 3] &= unmask[(s * 2) & 7];
			flags[(s * 3) >> 3] &= unmask[(s * 3) & 7];
		}
	}
	for (; s < size / 2; ++s) {
		if (flags[s >> 3] & mask[s & 7]) {
			++total;
			flags[(s * 2) >> 3] &= unmask[(s * 2) & 7];
		}
	}
#endif
	// 素数をカウント
	for (; s < ((size + 63) & -64); ++s) {
		total += !!(flags[s >> 3] & mask[s & 7]);
	}
	for (; s < (size & -64); s += 64) {
		long long bits = *(long long*)&flags[s >> 3];
		bits = (bits & 0x5555555555555555) + (bits >> 1 & 0x5555555555555555);
		bits = (bits & 0x3333333333333333) + (bits >> 2 & 0x3333333333333333);
		bits = (bits & 0x0f0f0f0f0f0f0f0f) + (bits >> 4 & 0x0f0f0f0f0f0f0f0f);
		bits = (bits & 0x00ff00ff00ff00ff) + (bits >> 8 & 0x00ff00ff00ff00ff);
		bits = (bits & 0x0000ffff0000ffff) + (bits >> 16 & 0x0000ffff0000ffff);
		bits = (bits & 0x00000000ffffffff) + (bits >> 32 & 0x00000000ffffffff);
		total += (int)bits;
	}
	for (; s < size; ++s) {
		total += !!(flags[s >> 3] & mask[s & 7]);
	}
	// 後処理
	free(flags);
	return total;
}
#endif

static int prime_bench(int size, int count) {
	int result = 0, c;
	for (c = 0; c < count; ++c) {
		result = count_prime(size);
	}
	return result;
}

int main(int argc, char* argv[]) {
	if (argc < 2) {
		goto usage;
	}
	int size = atoi(argv[1]);
	if (size < 1) {
		goto usage;
	}
	int count = (argc < 3) ? 1 : atoi(argv[2]);
	int total = prime_bench(size, count);
	printf("prime count = %d\n", total);
	return 0;
usage:
	printf("%s size [count]\n", argv[0]);
	return 1;
}

