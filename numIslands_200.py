# Solution for leetcode.com problem #200
# https://leetcode.com/problems/number-of-islands/

class Solution:
    def numIslands(self, grid: list[list[str]]) -> int:
        charted = {}
        count = 0
        i = 0
        while i < len(grid):
            j = 0
            while j < len(grid[0]):
                if (i, j) not in charted:
                    charted[(i,j)] = True
                    if grid[i][j] == '1':
                        count += 1
                        maybeisland = [(i,j)]
                        while len(maybeisland) != 0:
                            p = maybeisland.pop()
                            k = p[0]
                            l = p[1]

                            if grid[k][l] == '1':
                                if k != 0 and (k-1,l) not in charted:
                                    charted[(k-1,l)] = True
                                    maybeisland.append((k-1,l))
                                if k != len(grid) - 1 and (k+1,l) not in charted:
                                    charted[(k+1,l)] = True
                                    maybeisland.append((k+1,l))
                                if l != 0 and (k,l-1) not in charted:
                                    charted[(k,l-1)] = True
                                    maybeisland.append((k,l-1))
                                if l != len(grid[0]) - 1 and (k,l+1) not in charted:
                                    charted[(k,l+1)] = True
                                    maybeisland.append((k,l+1))
                j += 1
            i += 1

        return count

s = Solution()
assert s.numIslands([['0']]) == 0
assert s.numIslands([['1']]) == 1

assert s.numIslands([['0','0']]) == 0
assert s.numIslands([['0','1']]) == 1
assert s.numIslands([['1','0']]) == 1
assert s.numIslands([['1','1']]) == 1

assert s.numIslands([['0','0','0']]) == 0
assert s.numIslands([['0','0','1']]) == 1
assert s.numIslands([['0','1','0']]) == 1
assert s.numIslands([['0','1','1']]) == 1
assert s.numIslands([['1','0','0']]) == 1
assert s.numIslands([['1','0','1']]) == 2
assert s.numIslands([['1','1','0']]) == 1
assert s.numIslands([['1','1','1']]) == 1

assert s.numIslands([['0'],['0']]) == 0
assert s.numIslands([['0'],['1']]) == 1
assert s.numIslands([['1'],['0']]) == 1
assert s.numIslands([['1'],['1']]) == 1

assert s.numIslands([['0','0'],['0','0']]) == 0
assert s.numIslands([['0','0'],['0','1']]) == 1
assert s.numIslands([['0','0'],['1','0']]) == 1
assert s.numIslands([['0','0'],['1','1']]) == 1
assert s.numIslands([['0','1'],['0','0']]) == 1
assert s.numIslands([['0','1'],['0','1']]) == 1
assert s.numIslands([['0','1'],['1','0']]) == 2
assert s.numIslands([['0','1'],['1','1']]) == 1
assert s.numIslands([['1','0'],['0','0']]) == 1
assert s.numIslands([['1','0'],['0','1']]) == 2
assert s.numIslands([['1','0'],['1','0']]) == 1
assert s.numIslands([['1','0'],['1','1']]) == 1
assert s.numIslands([['1','1'],['0','0']]) == 1
assert s.numIslands([['1','1'],['0','1']]) == 1
assert s.numIslands([['1','1'],['1','0']]) == 1
assert s.numIslands([['1','1'],['1','1']]) == 1

assert s.numIslands([
  ['1','1','1','1','0'],
  ['1','1','0','1','0'],
  ['1','1','0','0','0'],
  ['0','0','0','0','0']
]) == 1

assert s.numIslands([
  ['1','1','0','0','0'],
  ['1','1','0','0','0'],
  ['0','0','1','0','0'],
  ['0','0','0','1','1']
]) == 3
