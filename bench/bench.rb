# Your code here!
# 100000 1000 0m20.887s
# 1000000 100 0m21.852s
# ruby 2.3.7p456 (2018-03-28 revision 63024) [universal.x86_64-darwin18]

def prime_bench
    size = 1000000
    count = 100
    total = 0
    for c in 0..count-1
        flags = Array.new(size)
        for s in 2..size-1
            if !flags[s]
                (s * 2).step(size - 1, s) {|s2|
                    flags[s2] = true
                }
            end
        end
    end
    for s in 2..size-1
        if !flags[s]
            total = total + 1
        end
    end
    puts total
end

prime_bench()

