using System.Diagnostics;
using System;

public class PrimeBench
{
	private static int prime(int size)
	{
		int total = 0, s, s2;
		bool[] flags = new bool[size];
		Array.Fill(flags, true);
		flags[0] = flags[1] = false;
		for (s = 2; s < size / 2; ++s)
		{
			if (flags[s])
			{
				++total;
				for (s2 = s * 2; s2 < size; s2 += s)
				{
					flags[s2] = false;
				}
			}
		}
		for (; s < size; ++s)
		{
			if (flags[s])
			{
				++total;
			}
		}
		return total;
	}

	public static int Main(string[] args)
	{
		//Stopwatch sw = Stopwatch.StartNew();
		if (args.Length < 1)
		{
			Console.WriteLine("prime_bench size [count]");
			return 1;
		}
		int size = int.Parse(args[0]);
		if (size < 1)
		{
			Console.WriteLine("prime_bench size [count]");
			return 1;
		}
		int count = (args.Length < 2) ? 1 : int.Parse(args[1]);
		int total = 0;
		for (int c = 0; c < count; ++c)
		{
			total = prime(size);
		}
		Console.WriteLine("prime count = {0}", total);
		//Console.WriteLine("time(ms) = {0}", sw.Elapsed.TotalMilliseconds);
		return 0;
	}
}
