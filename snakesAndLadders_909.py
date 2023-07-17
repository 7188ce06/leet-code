# Solution for leetcode problem #909
# https://leetcode.com/problems/snakes-and-ladders

def snakesAndLadders(board: list[list[int]]) -> int:
    assert len(board) == len(board[0])

    if len(board) == 1:
        return 0

    # Without a history, some inputs will just loop forever. One such
    # example is any board where squares 2 through 7 are all snakes
    # back to square 1.
    history = {}
    searchFroms = [1]
    rolls = 0
    while len(searchFroms) != 0:
        rolls += 1
        newSearchFroms = []
        while len(searchFroms) != 0:
            p = searchFroms.pop()
            i = 1
            while i <= 6:
                if p+i == len(board) * len(board):
                    return rolls
                else:
                    coords = convert(board, p+i)
                    x = board[coords[0]][coords[1]]
                    if x == -1:
                        newSearchFroms.append(p+i)
                    else:
                        if x == len(board) * len(board):
                            return rolls
                        else:
                            newSearchFroms.append(x)
                i += 1

        searchFroms = []
        i = 0
        while i < len(newSearchFroms):
            if newSearchFroms[i] not in history:
                searchFroms.append(newSearchFroms[i])
                history[newSearchFroms[i]] = True
            i += 1
        assert len(searchFroms) <= len(newSearchFroms)

    return -1

# Starting from the last row, rows are numbered from left to right,
# then right to left, ...
def convert(board: list[list[int]], n: int) -> (int,int):
    rowoffset = (n-1) // len(board[0])
    row = (len(board) - 1) - rowoffset
    assert 0 <= row and row <= len(board)

    coloffset = (n-1) % len(board[0])
    if rowoffset % 2 == 0:
        col = 0 + coloffset
    else:
        col = (len(board[0]) - 1) - coloffset
    assert 0 <= col and col <= len(board[0])

    return (row, col)

board = [[-1,-1,-1]]
assert convert(board, 1) == (0, 0)
assert convert(board, 2) == (0, 1)
assert convert(board, 3) == (0, 2)

board = [[-1,-1],[-1,-1],[2,-1]]
assert convert(board, 1) == (2, 0)
assert convert(board, 2) == (2, 1)
assert convert(board, 3) == (1, 1)
assert convert(board, 4) == (1, 0)
assert convert(board, 5) == (0, 0)
assert convert(board, 6) == (0, 1)

board = [[-1]]
assert snakesAndLadders(board) == 0

board = [[-1, -1], [-1, -1]]
assert snakesAndLadders(board) == 1


board = [
    [-1,-1,-1],
    [-1,-1,-1],
    [-1,-1,-1],
]
assert snakesAndLadders(board) == 2

# If the algorithm doesn't track history, then it gets stuck
# in a loop for this input.
board = [
    [1,-1,-1],
    [1, 1, 1],
    [-1,1, 1],
]
assert snakesAndLadders(board) == -1

board = [
    [-1,-1,-1,-1,-1,-1],
    [-1,-1,-1,-1,-1,-1],
    [-1,-1,-1,-1,-1,-1],
    [-1,35,-1,-1,13,-1],
    [-1,-1,-1,-1,-1,-1],
    [-1,15,-1,-1,-1,-1]
]
assert snakesAndLadders(board) == 4

board = [[-1,-1],[-1,3]]
assert snakesAndLadders(board) == 1

board = [
    [-1,-1,-1],
    [-1, 9, 8],
    [-1, 8, 9]
]
assert snakesAndLadders(board) == 1
