# Solution for leetcode.com problem #162
# https://leetcode.com/problems/find-peak-element/

class Solution:
    def findPeakElement(self, nums: list[int]) -> int:
        start = 0
        end = len(nums) - 1
        while True:
            cnt = end - start + 1
            mid = start + (cnt // 2)
            assert start <= mid and mid <= end

            if (mid != start and nums[mid] < nums[mid - 1]):
                end = mid - 1
            elif (mid != end and nums[mid] < nums[mid + 1]):
                start = mid + 1
            else:
                return mid

    def findPeakElement2(self, nums: list[int]) -> int:
        start = 0
        end = len(nums) - 1
        while True:
            if start == end:
                return start
            elif start + 1 == end:
                if nums[start] < nums[end]:
                    return end
                else:
                    return start
            else:
                cnt = end - start + 1
                mid = start + (cnt // 2)

                if nums[mid] < nums[mid - 1]:
                    end = mid - 1
                elif nums[mid] < nums[mid + 1]:
                    start = mid + 1
                else:
                    return mid

    def findPeakElement_linearScan(self, nums: list[int]) -> int:
        i = 0
        while i < len(nums):
            larger_than_prev = (i == 0 or (i != 0 and nums[i-1] < nums[i]))
            larger_than_next = (i == len(nums) - 1 or (i != len(nums) - 1 and nums[i] > nums[i+1]))
            if larger_than_prev and larger_than_next:
                return i
            i += 1

        return -1

s = Solution()
assert s.findPeakElement_linearScan([]) == -1
assert s.findPeakElement_linearScan([1]) == 0
assert s.findPeakElement_linearScan([1,1]) == -1
assert s.findPeakElement_linearScan([1,2]) == 1
assert s.findPeakElement_linearScan([2,1]) == 0
assert s.findPeakElement_linearScan([1,1,1]) == -1
assert s.findPeakElement_linearScan([1,1,2]) == 2
assert s.findPeakElement_linearScan([1,2,1]) == 1
assert s.findPeakElement_linearScan([2,1,1]) == 0
assert s.findPeakElement_linearScan([2,2,1]) == -1
assert s.findPeakElement_linearScan([2,1,2]) == 0
assert s.findPeakElement_linearScan([1,2,2]) == -1
assert s.findPeakElement_linearScan([1,2,3,1]) == 2
assert s.findPeakElement_linearScan([1,2,1,3,5,6,4]) == 1
    
assert s.findPeakElement2([1,2]) == 1
assert s.findPeakElement2([2,1]) == 0
assert s.findPeakElement2([1,2,1]) == 1
assert s.findPeakElement2([2,1,2]) in [0,2]
assert s.findPeakElement2([1,2,3]) == 2
assert s.findPeakElement2([1,3,2]) == 1
assert s.findPeakElement2([2,1,3]) in [0,2]
assert s.findPeakElement2([2,3,1]) == 1
assert s.findPeakElement2([3,1,2]) in [0,2]
assert s.findPeakElement2([3,2,1]) == 0
assert s.findPeakElement2([1,2,3,1]) == 2
assert s.findPeakElement2([1,2,1,3,5,6,4]) in [1,5]

assert s.findPeakElement([1,2]) == 1
assert s.findPeakElement([2,1]) == 0
assert s.findPeakElement([1,2,1]) == 1
assert s.findPeakElement([2,1,2]) in [0,2]
assert s.findPeakElement([1,2,3]) == 2
assert s.findPeakElement([1,3,2]) == 1
assert s.findPeakElement([2,1,3]) in [0,2]
assert s.findPeakElement([2,3,1]) == 1
assert s.findPeakElement([3,1,2]) in [0,2]
assert s.findPeakElement([3,2,1]) == 0
assert s.findPeakElement([1,2,3,1]) == 2
assert s.findPeakElement([1,2,1,3,5,6,4]) in [1,5]

