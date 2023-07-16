# Solution for leetcode.com problem #80
# https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/

def removeDuplicates(nums: list[int]) -> int:
    i = 0
    end = len(nums) - 1
    while i <= end:
        if 2 <= i and nums[i] == nums[i-1] and nums[i] == nums[i-2]:
            j = i
            while j <= end - 1:
                nums[j] = nums[j+1]
                j += 1
            end -= 1
        else:
            i += 1
    return end + 1

testcases = [
    [[], []],
    [[1], [1]],
    [[1,1], [1,1]],
    [[1,2], [1,2]],
    [[1,1,1], [1,1]],
    [[1,1,2], [1,1,2]],
    [[1,2,2], [1,2,2]],
    [[1,2,3], [1,2,3]],
    [[1,1,1,1], [1,1]],
    [[1,1,1,2], [1,1,2]],
    [[1,1,2,2], [1,1,2,2]],
    [[1,2,2,2], [1,2,2]],
    [[1,1,2,3], [1,1,2,3]],
    [[1,2,2,3], [1,2,2,3]],
    [[1,2,3,3], [1,2,3,3]],
    [[1,2,3,4], [1,2,3,4]],
    [[1,1,1,2,2,3], [1,1,2,2,3]],
    [[0,0,1,1,1,1,2,3,3], [0,0,1,1,2,3,3]]
]

for t in testcases:
    tinput = t[0]
    tinputcopy = tinput.copy()
    toutput = t[1]
    assert len(toutput) == removeDuplicates(tinput), tinputcopy
    assert len(tinput) == len(tinputcopy) and tinput[0:len(toutput)] == toutput, tinputcopy
