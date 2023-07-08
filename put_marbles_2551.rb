def put_marbles(weights, k)
    if !(weights.is_a?(Array) and 1 <= weights.size)
        raise "invalid input"
    elsif !(k.is_a?(Integer) and 1 <= k and k <= weights.size)
        raise "invalid input"
    end

    i = 1
    # XXX: Not actually averages, because I don't divide by 2.
    #      Dividing by 2 causes an issue because the non-integer part of the
    #      result is lost.
    avgs = []
    while i <= weights.size - 1
        avgs.append([weights[i-1] + weights[i], i])
        i += 1
    end

    avgs = avgs.sort_by {|x| x[0]}

    smallest_score = weights[0] + weights[-1]
    i = 0
    while i < k - 1
        index = avgs[i][1]
        smallest_score += weights[index-1] + weights[index]
        i += 1
    end

    largest_score = weights[0] + weights[-1]
    i = 0
    while i < k - 1
        index = avgs[avgs.size - 1 - i][1]
        largest_score += weights[index-1] + weights[index]
        i += 1
    end

    largest_score - smallest_score
end

def put_marbles_bf(weights, k)
    if !(weights.is_a?(Array) and 1 <= weights.size)
        raise "invalid input"
    elsif !(k.is_a?(Integer) and 1 <= k and k <= weights.size)
        raise "invalid input"
    end

    # After this conditional, the function is concerned with finding and scoring
    # each way to cut up @weights into @k sections.  When @k == 1, there is no
    # way to 'cut it up' into 1 section, so the rest of the function can't handle
    # this case.  But in fact, when @k == 1, the correct output for this function
    # is always zero, so just output that here.
    # (If this comment doesn't make sense to you, try to think about what the
    # correct value for the below variable @cuts should be when @k == 1. I don't
    # think there is a correct value because the idea doesn't apply when @k is
    # 1.)
    if k == 1
        return 0
    end

    # Example: @weights == [8,2,3,4,5] and @k = 3
    # It's possible to make a cut between any two elements. For example, the cut
    # between 8 and 2 is known as 1, which is the index of the rightmost
    # element in the cut pair.
    # Since @k == 3, I'm concerned with each way to cut @weights twice, as that
    # partitions @weights into 3 sections. For example the cut [1,2] gives
    # [[8],[2],[3,4,5]] and the cut [2, 3] gives [[8,2],[3],[4,5]].
    raise "assert" if !(2 <= weights.size)
    cuts = get_seqs(1.upto(weights.size-1).to_a, k-1)
    smallest = nil
    largest = nil
    i = 0
    while i < cuts.size
        curr = weights[0] + weights[-1]
        j = 0
        while j < cuts[i].size
            curr += weights[cuts[i][j]-1] + weights[cuts[i][j]]
            j += 1
        end
        if smallest == nil or curr < smallest
            smallest = curr
        end
        if largest == nil or curr > largest
            largest = curr
        end
        i += 1
    end

    return largest - smallest
end

def get_seqs(xs, cnt)
    if !(xs.is_a?(Array) and 1 <= xs.size)
        raise "invalid input"
    elsif !(cnt.is_a?(Integer) and 1 <= cnt and cnt <= xs.size)
        raise "invalid input"
    end

    if cnt == 1
        ys = []
        i = 0
        while i < xs.size
            ys.append([xs[i]])
            i += 1
        end
        return ys
    else
        raise "assert" if !(xs.size >= 2)

        ys = []
        i = 0
        while i < xs.size - (cnt - 1)
            zs = get_seqs(xs[(i+1)..], cnt-1)
            j = 0
            while j < zs.size
                ys.append([xs[i]] + zs[j])
                j += 1
            end
            i += 1
        end
        return ys
    end
end

def randseq(max, k)
    if !(max.is_a?(Integer) and 1 <= max)
        raise "invalid input"
    elsif !(k.is_a?(Integer) and 0 <= k)
        raise "invalid input"
    end

    xs = []
    i = 0
    while i < k
        xs.append(rand(max))
        i += 1
    end
    xs
end


raise "Hell" if randseq(10, 0) != []
raise "Hell" if randseq(1, 100) != [0] * 100

raise "Hell" if get_seqs([1], 1) != [[1]]
raise "Hell" if get_seqs([1,2], 1) != [[1],[2]]
raise "Hell" if get_seqs([1,2], 2) != [[1,2]]
raise "Hell" if get_seqs([1,2,3], 1) != [[1],[2],[3]]
raise "Hell" if get_seqs([1,2,3], 2) != [[1,2],[1,3],[2,3]]
raise "Hell" if get_seqs([1,2,3], 3) != [[1,2,3]]
raise "Hell" if get_seqs([1,2,3,4], 1) != [[1],[2],[3],[4]]
raise "Hell" if get_seqs([1,2,3,4], 2) != [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
raise "Hell" if get_seqs([1,2,3,4], 3) != [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
raise "Hell" if get_seqs([1,2,3,4], 4) != [[1,2,3,4]]

[
  [[[1], 1], 0],
  [[[1,3,5,1], 2], 4],
  [[[1,3,5,1], 4], 0],
  [[[1,3], 2], 0],
  [[[8,6,2,4,7,1,3,5], 2], 10],
  [[[8,6,2,4,7,1,3,5], 3], 15],
  [[[6,4,7,2,8], 2], 2],
  [[[22,13,7,14,9,7,24,14,3,15], 5], 56]
].each do |test_case|
    input = test_case[0]
    expected_output = test_case[1]
    raise "Hell" if put_marbles_bf(*input) != expected_output
    raise "Hell" if put_marbles(*input) != expected_output
end

100.times do
  xs = randseq(25, 15)
  k = rand(6)+1
  raise "Hell: XS: #{xs} K: #{k}" if put_marbles(xs, k) != put_marbles_bf(xs, k)
end
