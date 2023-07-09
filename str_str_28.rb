def str_str(haystack, needle)
    if !(haystack.is_a?(String) and 1 <= haystack.size)
        raise "dead"
    elsif !(needle.is_a?(String) and 1 <= needle.size)
        raise "dead"
    end

    i = 0
    while i < haystack.size
        if match(needle, haystack[i...(i+needle.size)])
            return i
        end
        i += 1
    end

    return -1
end

def match(xs, ys)
    if !xs.is_a?(String)
        raise "dead"
    elsif !ys.is_a?(String)
        raise "dead"
    end

    if xs == "" and ys == ""
        return true
    elsif xs == ""
        return false
    elsif ys == ""
        return false
    else
        if xs[0] == ys[0]
            return match(xs[1..], ys[1..])
        else
            return false
        end
    end
end

raise "dead" if str_str("sadbutsad", "sad") != 0
raise "dead" if str_str("leetcode", "leeto") != -1
