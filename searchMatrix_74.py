class Solution:
    def searchMatrix(self, matrix: list[list[int]], target: int) -> bool:
        r = len(matrix)
        c = len(matrix[0])
        start = [0,0]
        end = [r-1,c-1]
        while start[0] * c + start[1] <= end[0] * c + end[1]:
            assert 0 <= start[0] and start[0] < r
            assert 0 <= start[1] and start[1] < c
            assert 0 <= end[0] and end[0] < r
            assert 0 <= end[1] and end[1] < c
            start_flat = start[0] * c + start[1]
            end_flat = end[0] * c + end[1]
            cnt = end_flat - start_flat + 1
            mid_flat = start_flat + (cnt // 2)
            mid = [mid_flat // c, mid_flat % c]
            assert 0 <= mid[0] and mid[0] < r
            assert 0 <= mid[1] and mid[1] < c
            elt = matrix[mid[0]][mid[1]]
            if elt < target:
                start = [(mid_flat + 1) // c, (mid_flat + 1) % c]
            elif elt == target:
                return True
            else:
                end = [(mid_flat - 1) // c, (mid_flat - 1) % c]
        return False


s = Solution()
assert s.searchMatrix([[1]], 0) == False
assert s.searchMatrix([[1]], 1) == True
assert s.searchMatrix([[1]], 2) == False
assert s.searchMatrix([[1],[7]], 0) == False
assert s.searchMatrix([[1],[7]], 1) == True
assert s.searchMatrix([[1],[7]], 7) == True
assert s.searchMatrix([[1],[7]], 9) == False
assert s.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3) == True
assert s.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13) == False
