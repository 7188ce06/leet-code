def rotate(matrix)
    upperleft = [0,0]
    edgelength = matrix.size
    while edgelength >= 1
        # Write the top row to the last column.
        temp = matrix[upperleft[0]][upperleft[1]..-2]
        temp2 = []
        i = 0
        while i < edgelength - 1
            writerow = upperleft[0] + i
            writecol = upperleft[1] + edgelength - 1
            temp2.append(matrix[writerow][writecol])

            matrix[writerow][writecol] = temp[i]
            i += 1
        end
        temp = temp2
        raise "assert" if !(temp.size == edgelength - 1)

        # Write the last column to the bottom row.
        temp2 = []
        i = 0
        while i < edgelength - 1
            writerow = upperleft[0] + edgelength - 1
            writecol = upperleft[1] + edgelength - 1 - i
            temp2.append(matrix[writerow][writecol])

            matrix[writerow][writecol] = temp[i]
            i += 1
        end
        temp = temp2
        raise "assert" if !(temp.size == edgelength - 1)

        # Write the bottom row to the first column. 
        temp2 = []
        i = 0
        while i < edgelength - 1
            writerow = upperleft[0] + edgelength - 1 - i
            writecol = upperleft[1]
            temp2.append(matrix[writerow][writecol])

            matrix[writerow][writecol] = temp[i]
            i += 1
        end
        temp = temp2
        raise "assert" if !(temp.size == edgelength - 1)

        # Write the first column to the first row
        i = 0
        while i < edgelength - 1
            writerow = upperleft[0]
            writecol = upperleft[1] + i
            matrix[writerow][writecol] = temp[i]
            i += 1
        end

        upperleft = [upperleft[0] + 1, upperleft[1] + 1]
        edgelength -= 2
    end
end

# This function rotates a square matrix 90 degrees clockwise.  It uses the fact
# that the ith row of the rotated matrix is the reversed ith column of the
# input matrix. For example, the reversed first column of the input matrix is the
# first row of the rotated matrix.
# (This function allocates a new matrix for the rotation.)
def rotate_2(matrix)
    out = []
    col = 0
    while col < matrix.size
        out.append(m_col(matrix, col).reverse)
        col += 1
    end

    out
end

# This function rotates a square matrix 90 degrees clockwise. It uses the fact
# that the ith column of the rotated matrix is the ith to last row of the
# input matrix. For example, the input matrix's last row is the first column
# of the rotated matrix.
# (This function allocates a new matrix for the rotation.)
def rotate_3(matrix)
    new_matrix_from_cols(*(matrix.reverse))
end


def new_matrix_from_cols(*cols)
    if !(cols.is_a?(Array) and 1 <= cols.size)
        raise "invalid input"
    end
    cols.each do |c|
        if !(c.is_a?(Array) and cols.size == c.size)
            raise "invalid input"
        end
    end

    out = []
    i = 0
    while i < cols.size
        j = 0
        row = []
        while j < cols.size
            row.append(cols[j][i])
            j += 1
        end
        out.append(row)
        i += 1
    end
    out
end

def m_row(matrix, i)
    matrix[i]
end

def m_col(matrix, i)
    xs = []
    j = 0
    while j < matrix.size
        xs.append(matrix[j][i])
        j += 1
    end
    xs
end

col0 = [10]
raise "Hell" if !(new_matrix_from_cols(col0) == [col0])

col0 = [1,4,7]
col1 = [2,5,8]
col2 = [3,6,9]
matrix = [[1,2,3],[4,5,6],[7,8,9]]
raise "Hell" if !(new_matrix_from_cols(col0,col1,col2) == matrix)

in_matrix =  [[1,2,3],[4,5,6],[7,8,9]]
out_matrix = [[7,4,1],[8,5,2],[9,6,3]]
raise "Hell" if !(rotate_2(in_matrix) == out_matrix)

in_matrix =  [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
out_matrix = [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
raise "Hell" if !(rotate_2(in_matrix) == out_matrix)

in_matrix =  [[1,2,3],[4,5,6],[7,8,9]]
out_matrix = [[7,4,1],[8,5,2],[9,6,3]]
raise "Hell" if !(rotate_3(in_matrix) == out_matrix)

in_matrix =  [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
out_matrix = [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
raise "Hell" if !(rotate_3(in_matrix) == out_matrix)

matrix = [[12]]
rotate(matrix)
raise "Hell" if !(matrix == [[12]])

matrix = [[1,2],[3,4]]
rotate(matrix)
raise "Hell" if !(matrix == [[3,1],[4,2]])

matrix = [[1,2,3],[4,5,6],[7,8,9]]
rotate(matrix)
raise "Hell" if !(matrix == [[7,4,1],[8,5,2],[9,6,3]])

matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
rotate(matrix)
raise "Hell" if !(matrix == [[13,9,5,1],[14,10,6,2],[15,11,7,3],[16,12,8,4]])

100.times do
    matrix = [
        [rand(4), rand(4), rand(4)],
        [rand(4), rand(4), rand(4)],
        [rand(4), rand(4), rand(4)]
    ]
    matrix2 = [matrix[0][0..], matrix[1][0..], matrix[2][0..]]
    rotate(matrix)
    raise "Hell" if !(matrix == rotate_2(matrix2))
end

100.times do
    matrix = [
        [rand(7), rand(7), rand(7), rand(7)],
        [rand(7), rand(7), rand(7), rand(7)],
        [rand(7), rand(7), rand(7), rand(7)],
        [rand(7), rand(7), rand(7), rand(7)],
    ]
    matrix2 = [matrix[0][0..], matrix[1][0..], matrix[2][0..], matrix[3][0..]]
    rotate(matrix)
    raise "Hell" if !(matrix == rotate_3(matrix2))
end
