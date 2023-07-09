# Solution for leetcode.com problem #70
# https://leetcode.com/problems/climbing-stairs/

def climb_stairs_bf(n)
    if !(n.is_a?(Integer) and 1 <= n)
        raise "invalid input"
    end

    count = 0
    routes = [0]
    while routes.size > 0
        r = routes.pop
        if r + 1 == n
            count += 1
        else
            routes.push(r+1)
            if r + 2 == n
                count += 1
            else
                routes.push(r+2)
            end
        end
    end
    return count
end

def climb_stairs(n)
    if !(n.is_a?(Integer) and 1 <= n)
        raise "invalid input"
    end

    return climb_stairs_impl(n, {})
end

def climb_stairs_impl(n, cache)
    if !(n.is_a?(Integer) and 1 <= n)
        raise "invalid input"
    elsif !(cache.is_a?(Hash))
        raise "invalid input"
    end

    if n == 1
        return 1
    elsif n == 2
        return 2
    else
        if cache.has_key?(n)
            return cache[n]
        end
      
        cache[n] = climb_stairs_impl(n-1, cache)
        cache[n] += climb_stairs_impl(n-2, cache)
        return cache[n]
    end
end

raise "Hell" if !(climb_stairs_bf(1) == 1)
raise "Hell" if !(climb_stairs_bf(2) == 2)
raise "Hell" if !(climb_stairs_bf(3) == 3)
raise "Hell" if !(climb_stairs_bf(4) == 5)

5.upto(25) do |n|
    raise "Hell" if !(climb_stairs_bf(n) == climb_stairs(n))
end
