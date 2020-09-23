#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int isprime(int x) {
  int i;
  for (i = 2; i < x; ++i)
    if (x%i == 0) return 0;
  return 1;
}

int findprimes(int m) {
  int i,cnt=0;
  for ( i = 11; i < m; ++i)
    if (isprime(i) && isprime(i-6))
      //printf("%d %d\n", i-6, i);
	  ++cnt;
  return cnt;
}
	int size = 1000000;
	int count = 1000;
	int prime_bench()
	{
		//*C*/int sw; SYSTEMTIME st; GetLocalTime(&st); sw = st.wMilliseconds + st.wSecond * 1000 + st.wMinute * 1000000;
		//*C#*/Stopwatch sw = Stopwatch.StartNew();
		//*J*/long sw = System.currentTimeMillis();
		//*JS*/var sw = new Date();
		char* flags = NULL;
		int total = 0, c, s, s2;
		for (c = 0; c < count; ++c)
		{
			/*C*/flags = (char*)realloc(flags, size); memset(flags, 0, size);
			//*C#*/flags = new bool[size];
			//*J*/flags = new boolean[size];
			//*JS*/flags = undefined; flags = new Array(size);
			for (s = 2; s < size; ++s)
			{
				if (!flags[s])
				{
					for (s2 = s * 2; s2 < size; s2 += s)
					{
						flags[s2] = 1;
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
		//*J*/System.out.println("Java: size = " + size + ", count = " + count + ", total = " + total + ", time(us) = " + (System.currentTimeMillis() - sw) * 1000.0 / count);
		//*JS*/document.write("JavaScript: size = " + size + ", count = " + count + ", total = " + total + ", time(us) = " + (new Date() - sw) * 1000.0 / count);
		return total;
	}
	//prime_bench();

int main() {
    //int res = findprimes(1000*1000);
	int res = prime_bench();
	printf("%d\n", res);
	return res;
}

