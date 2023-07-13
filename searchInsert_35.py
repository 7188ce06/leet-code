# Solution for leetcode.com problem #35
# https://leetcode.com/problems/search-insert-position/

class Solution:
    # Find the index of the largest number that is not greater than target
    def searchInsert(self, nums: list[int], target: int) -> int:
        if len(nums) == 0 or target < nums[0]:
            return 0

        # Loop invariant: nums[start] <= target <= nums[end]
        # If there are any elements in @nums that are not larger than @target, then
        # the largest such element is always in @nums[start:end+1].
        # If @target is smaller than every element in @nums, then return 0 after
        # exiting the loop.
        start = 0
        end = len(nums) - 1
        while start <= end:
            cnt = end - start + 1
            mid = start + (cnt // 2)
            if nums[mid] < target:
                if mid == len(nums) - 1:
                    return len(nums)
                else:
                    if nums[mid+1] <= target:
                        start = mid + 1
                    else:
                        return mid + 1
            elif nums[mid] == target:
                return mid
            else:
                end = mid - 1
        assert False, "unreachable"

s = Solution()
assert s.searchInsert([], 1) == 0
assert s.searchInsert([1], 0) == 0
assert s.searchInsert([1], 1) == 0
assert s.searchInsert([1], 2) == 1
assert s.searchInsert([1,5],0) == 0
assert s.searchInsert([1,5],1) == 0
assert s.searchInsert([1,5],2) == 1
assert s.searchInsert([1,5],5) == 1
assert s.searchInsert([1,5],7) == 2

assert s.searchInsert([1,3,5,6], 5) == 2
assert s.searchInsert([1,3,5,6], 2) == 1
assert s.searchInsert([1,3,5,6], 7) == 4
