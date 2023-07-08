def put_marbles(weights, k)
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
    # puts "AVGS: #{avgs}"

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

    # puts "L: #{largest_score}\nS: #{smallest_score}"
    largest_score - smallest_score
end

def put_marbles_bf(weights, k)
    # XXX: Is there a less kludgy way to handle this?
    if k == 1
        return 0
    end

    partitions = get_seqs(1.upto(weights.size-1).to_a, k-1)
    smallest = nil
    largest = nil
    i = 0
    while i < partitions.size
        curr = weights[0] + weights[-1]
        j = 0
        while j < partitions[i].size
            curr += weights[partitions[i][j]-1] + weights[partitions[i][j]]
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
    if cnt == 0
        raise "unreachable"
    elsif cnt == 1
        ys = []
        i = 0
        while i < xs.size
            ys.append([xs[i]])
            i += 1
        end
        return ys
    else
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
  xs = []
  i = 0
  while i < k
    xs.append(rand(max))
    i += 1
  end
  xs
end

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

raise "Hell" if put_marbles_bf([1,3,5,1], 2) != 4
raise "Hell" if put_marbles_bf([1,3,5,1], 4) != 0
raise "Hell" if put_marbles_bf([1,3], 2) != 0
raise "Hell" if put_marbles_bf([8,6,2,4,7,1,3,5], 2) != 10
raise "Hell" if put_marbles_bf([8,6,2,4,7,1,3,5], 3) != 15
raise "Hell" if put_marbles_bf([6, 4, 7, 2, 8], 2) != 2
raise "Hell" if put_marbles_bf([22, 13, 7, 14, 9, 7, 24, 14, 3, 15], 5) != 56


1.upto(100) do
  xs = randseq(25, 15)
  k = rand(6)+1
  raise "Hell: XS: #{xs} K: #{k}" if put_marbles(xs, k) != put_marbles_bf(xs, k)
end

raise "Hell" if put_marbles([1,3,5,1], 2) != 4
raise "Hell" if put_marbles([1,3,5,1], 4) != 0
raise "Hell" if put_marbles([1,3], 2) != 0
raise "Hell" if put_marbles([8,6,2,4,7,1,3,5], 2) != 10
raise "Hell" if put_marbles([8,6,2,4,7,1,3,5], 3) != 15
raise "Hell" if put_marbles([6,4,7,2,8], 2) != 2
raise "Hell" if put_marbles([22, 13, 7, 14, 9, 7, 24, 14, 3, 15], 5) != 56
