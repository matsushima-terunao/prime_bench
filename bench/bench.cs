/*
paiza.io 2020/8/18
C#: size = 100000, count = 1000, total = 9592, time(us) = 516.1784
C#: size = 1000000, count = 100, total = 78498, time(us) = 5244.843
2
C#: size = 100000, count = 1000, total = 9592, time(us) = 563.9258
C#: size = 1000000, count = 100, total = 78498, time(us) = 6496.024
*/
using System.Diagnostics;
using System;

public class PrimeBench {

	int size = 100000;
	int count = 1000;
	private int prime_bench()
	{
		Stopwatch sw = Stopwatch.StartNew();
		bool[] flags = null;
		int total = 0, c, s, s2;
		for (c = 0; c < count; ++c)
		{
			flags = new bool[size];
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
		Console.WriteLine("C#: size = " + size + ", count = " + count + ", total = " + total + ", time(us) = " + sw.Elapsed.TotalMilliseconds * 1000.0 / count);
		return total;
	}

    public static void Main(){
        new PrimeBench().prime_bench();
    }
}

