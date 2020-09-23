package main
import "flag"
import "strconv"
import "fmt"
import "os"

func count_prime(size int) int {
	var total = 0
	var s, s2 int
	// 結果配列初期化
	var flags = make([]bool, size)
	flags[0] = false
	flags[1] = false
	for s = 2; s < size; s++ {
	    flags[s] = true
	}
	// 素数をカウント、素数の倍数を素数でないと設定
	for s = 2; s < size / 2; s++ {
		if flags[s] {
			total++
			for s2 = s * 2; s2 < size; s2 += s {
				flags[s2] = false
			}
		}
	}
	// 素数をカウント
	for ; s < size; s++ {
	    if flags[s] {
			total++
	    }
	}
	// 後処理
	return total
}

func main() {
	flag.Parse()
	var args = flag.Args()
	if len(args) < 1 {
		fmt.Println("go run prime_bench.go size [count]")
		os.Exit(1)
	}
	var size, _ = strconv.Atoi(args[0])
	if size < 1 {
		fmt.Println("go run prime_bench.go size [count]")
		os.Exit(1)
	}
	var count = 1
	if len(args) >= 2 {
		count, _ = strconv.Atoi(args[1])
	}
	var total, c int
	for c = 0; c < count; c++ {
		total = count_prime(size)
	}
	fmt.Println("prime count = " + strconv.Itoa(total))
	os.Exit(0)
}

