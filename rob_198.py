# Solution for leetcode.com problem #198
# https://leetcode.com/problems/house-robber

def rob(nums: list[int]) -> int:
    history = []
    i = len(nums) - 1
    while 0 <= i:
        if i == len(nums) - 1:
            history.insert(0, nums[i])
        elif i == len(nums) - 2:
            history.insert(0, max(nums[i], nums[i+1]))
        else:
            x = nums[i] + history[1]
            y = history[0]
            history.insert(0, max(x, y))
        i -= 1
    return history[0]

assert rob([5]) == 5
assert rob([5,10]) == 10
assert rob([10,5]) == 10
assert rob([1,5,10]) == 11
assert rob([10,5,1]) == 11
assert rob([5,15,8]) == 15
assert rob([1,2,3,1]) == 4
