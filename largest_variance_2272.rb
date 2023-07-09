def largest_variance_bf(s)
    if !(s.is_a?(String) and 1 <= s.size)
        raise "invalid input"
    end

    largest_v = nil
    i = 0
    while i < s.size
        j = i
        while j < s.size
            v = variance_bf(s[i..j])
            if largest_v == nil or largest_v < v
                largest_v = v
            end
            j += 1
        end
        i += 1
    end
    raise "assert" if !(largest_v != nil)
    largest_v
end

def variance_bf(s)
    if !(s.is_a?(String) and 1 <= s.size)
        raise "invalid input"
    end

    freqs = {}
    i = 0
    while i < s.size
        if !freqs.has_key?(s[i])
            freqs[s[i]] = 1
        else
            freqs[s[i]] += 1
        end
        i += 1
    end
    raise "assert" if !(freqs.size >= 1)

    xs = freqs.values.sort
    xs[-1] - xs[0]
end

raise "Hell" if variance_bf("a") != 0
raise "Hell" if variance_bf("aa") != 0
raise "Hell" if variance_bf("ab") != 0
raise "Hell" if variance_bf("aaa") != 0
raise "Hell" if variance_bf("aab") != 1
raise "Hell" if variance_bf("abc") != 0
raise "Hell" if variance_bf("aaaa") != 0
raise "Hell" if variance_bf("aaab") != 2
raise "Hell" if variance_bf("aabb") != 0
raise "Hell" if variance_bf("aabc") != 1

raise "Hell" if largest_variance_bf("aababbb") != 3
raise "Hell" if largest_variance_bf("abcde") != 0
