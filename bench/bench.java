//  100,000  2447 0m1.430s
//1,000,000 16386 1m42.834s
class bench{
	private static int isprime(int x) {
	  int i;
	  for (i = 2; i < x; ++i)
		if (x%i == 0) return 0;
	  return 1;
	}

	private static int findprimes(int m) {
	  int i,cnt=0;
	  for ( i = 11; i < m; ++i)
		if (isprime(i)!=0 && isprime(i-6)!=0)
		  //printf("%d %d\n", i-6, i);
		  ++cnt;
	  return cnt;
	}

	private static int prime_bench()
	{
		int size = 100000;
		int count = 10000;
		//*C*/int sw; SYSTEMTIME st; GetLocalTime(&st); sw = st.wMilliseconds + st.wSecond * 1000 + st.wMinute * 1000000;
		//*C#*/Stopwatch sw = Stopwatch.StartNew();
		/*J*/long sw = System.currentTimeMillis();
		//*JS*/var sw = new Date();
		boolean[] flags = null;
		int total = 0, c, s, s2;
		for (c = 0; c < count; ++c)
		{
			//*C*/flags = (char*)realloc(flags, size); memset(flags, 0, size);
			//*C#*/flags = new bool[size];
			/*J*/flags = new boolean[size];
			//*JS*/flags = undefined; flags = new Array(size);
			for (s = 2; s < size; ++s)
			{
				if (!flags[s])
				{
					for (s2 = s * 2; s2 < size; s2 += s)
					{
						flags[s2] = true;
					}
				}
			}
		}
		for (s = 2; s < size; ++s)
		{
			if (!flags[s])
			{
				++total;
			}
		}
		//*C*/GetLocalTime(&st); printf("C: size = %d, count = %d, total = %d, time(us) = %f", size, count, total, (st.wMilliseconds + st.wSecond * 1000 + st.wMinute * 1000000 - sw) * 1000.0 / count);
		//*C#*/Console.WriteLine("C#: size = " + size + ", count = " + count + ", total = " + total + ", time(us) = " + sw.Elapsed.TotalMilliseconds * 1000.0 / count);
		/*J*/System.out.println("Java: size = " + size + ", count = " + count + ", total = " + total + ", time(us) = " + (System.currentTimeMillis() - sw) * 1000.0 / count);
		//*JS*/document.write("JavaScript: size = " + size + ", count = " + count + ", total = " + total + ", time(us) = " + (new Date() - sw) * 1000.0 / count);
		return total;
	}


	
	public static void main(String[] args){
		//int res = findprimes(1000*1000);
		int res = prime_bench();
		System.out.println(res);
		System.out.println(System.getProperty("java.version"));
    	System.out.println(System.getProperty("os.name"));
	}
}

