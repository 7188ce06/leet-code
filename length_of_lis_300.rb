# Solution for leetcode.com problem #300
# https://leetcode.com/problems/longest-increasing-subsequence/

# (1) Start at the end of the array.
# (2) Determine the LIS for the current position and store it
#     in @history. This can be done using the previously computed
#     LISs for each succeeding position.
#     Specifically, of the succeeding positions with elements
#     larger than the current element, get the largest LIS among
#     them and add one to it, that is the LIS from the current
#     position. If there are no succeeding positions with elements
#     larger than the current element, then the LIS from the
#     current position is 1.
# (3) Return the largest LIS from any of the positions in the array.
#     That is, return the largest element in @history.
def length_of_lis(nums)
    raise "assert" if !(nums.is_a?(Array) and nums.size >= 1)

    i = nums.size - 1
    history = [nil] * nums.size
    while 0 <= i
        longest = 1
        j = i + 1
        while j <= history.size - 1
            raise "assert" if !(history[j].is_a? Integer)
            if nums[i] < nums[j]
                if history[j] + 1 > longest
                    longest = history[j] + 1
                end
            end
            j += 1
        end
        history[i] = longest
        i -= 1
    end 
    raise "assert" if !(history.size == nums.size)
    raise "assert" if !(history.compact.size == history.size)

    longest = history[0]
    i = 1
    while i <= history.size - 1
        if history[i] > longest
            longest = history[i]
        end
        i += 1
    end
    longest
end

raise "ur kidz" if !(length_of_lis([1]) == 1)
raise "ur kidz" if !(length_of_lis([1,1]) == 1)
raise "ur kidz" if !(length_of_lis([1,2]) == 2)
raise "ur kidz" if !(length_of_lis([2,1]) == 1)
raise "ur kidz" if !(length_of_lis([1,1,1]) == 1)
raise "ur kidz" if !(length_of_lis([1,1,2]) == 2)
raise "ur kidz" if !(length_of_lis([1,2,1]) == 2)
raise "ur kidz" if !(length_of_lis([2,1,1]) == 1)
raise "ur kidz" if !(length_of_lis([2,2,1]) == 1)
raise "ur kidz" if !(length_of_lis([2,1,2]) == 2)
raise "ur kidz" if !(length_of_lis([1,2,2]) == 2)
raise "ur kidz" if !(length_of_lis([1,2,2]) == 2)
raise "ur kidz" if !(length_of_lis([1,2,3]) == 3)
raise "ur kidz" if !(length_of_lis([1,3,2]) == 2)
raise "ur kidz" if !(length_of_lis([2,1,3]) == 2)
raise "ur kidz" if !(length_of_lis([2,3,1]) == 2)
raise "ur kidz" if !(length_of_lis([3,1,2]) == 2)
raise "ur kidz" if !(length_of_lis([3,2,1]) == 1)
