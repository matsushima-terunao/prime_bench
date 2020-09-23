def count_primeS(size)
	total = 0
	flags = Array.new(size, true)
	flags[0] = flags[1] = false
	for s in 2..size/2-1
		if flags[s]
			total = total + 1
			(s * 2).step(size - 1, s) {|s2|
				flags[s2] = false
			}
		end
	end
    for s in s..size-1
        if flags[s]
            total = total + 1
        end
    end
	return total
end

if ARGV.size() < 1 then
	puts "ruby #{$0} size [count]"
	exit 1
end
size = ARGV[0].to_i
if size < 1 then
	puts "ruby #{$0} size [count]"
	exit 1
end
count = (ARGV.size() < 2) ? 1 : ARGV[1].to_i
total = 0;
for c in 0..count-1
	total = count_prime(size)
end
puts "prime count = #{total}"

