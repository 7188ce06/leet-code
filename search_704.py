# Solution for leetcode.com problem #704
# https://leetcode.com/problems/binary-search/

class Solution:
    # Each element in @nums is unique.
    def search(self, nums: list[int], target: int) -> int:
        if len(nums) == 0:
            return -1
        elif len(nums) == 1:
            if nums[0] == target:
                return 0
            else:
                return -1
            
        first = 0
        last = len(nums) - 1
        while True:
            if first + 1 == last:
                if nums[first] == target:
                    return first
                elif nums[last] == target:
                    return last
                else:
                    return -1
            cnt = last - first + 1
            i = first + (cnt // 2)
            assert first <= i and i <= last
            if nums[i] == target:
                return i
            elif nums[i] < target:
                first = i
            else:
                assert target < nums[i]
                last = i
        return -1

    def search_2(self, nums: list[int], target: int) -> int:
        first = 0
        last = len(nums) - 1
        while first <= last:
            cnt = last - first + 1
            i = first + (cnt // 2)
            assert first <= i and i <= last
            if nums[i] < target:
                first = i + 1
            elif nums[i] == target:
                return i
            else:
                assert target < nums[i]
                last = i - 1
        return -1

s = Solution()
assert s.search([], 1) == -1
assert s.search([1], -10) == -1
assert s.search([1], 1) == 0
assert s.search([1], 2) == -1

assert s.search([1,5], 0) == -1
assert s.search([1,5], 1) == 0
assert s.search([1,5], 2) == -1
assert s.search([1,5], 5) == 1
assert s.search([1,5], 6) == -1

assert s.search([-1,0,3,5,9,12], 9) == 4
assert s.search([-1,0,3,5,9,12], 2) == -1

assert s.search_2([], 1) == -1
assert s.search_2([1], -10) == -1
assert s.search_2([1], 1) == 0
assert s.search_2([1], 2) == -1

assert s.search_2([1,5], 0) == -1
assert s.search_2([1,5], 1) == 0
assert s.search_2([1,5], 2) == -1
assert s.search_2([1,5], 5) == 1
assert s.search_2([1,5], 6) == -1

assert s.search_2([-1,0,3,5,9,12], 9) == 4
assert s.search_2([-1,0,3,5,9,12], 2) == -1
