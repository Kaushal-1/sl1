def is_safe(board, row, col, N):
    # Check for queens in the same row on the left side
    for i in range(col):
        if board[row][i] == 1:
            return False
    
    # Check for queens in the upper diagonal on the left side
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        if board[i][j] == 1:
            return False
    
    # Check for queens in the lower diagonal on the left side
    for i, j in zip(range(row, N, 1), range(col, -1, -1)):
        if board[i][j] == 1:
            return False
    
    return True

def solve_nqueens_util(board, col, N):
    if col == N:
        # All queens are placed successfully
        return True

    for i in range(N):
        if is_safe(board, i, col, N):
            # Place queen and check for the next column
            board[i][col] = 1

            if solve_nqueens_util(board, col + 1, N):
                return True

            # If placing queen in the current position doesn't lead to a solution,
            # backtrack and try the next row
            board[i][col] = 0

    # If no row in the current column is suitable, return False
    return False

def solve_nqueens(N):
    # Initialize the chessboard
    board = [[0 for _ in range(N)] for _ in range(N)]

    if not solve_nqueens_util(board, 0, N):
        print("Solution does not exist.")
        return

    # Print the solution
    for i in range(N):
        for j in range(N):
            print(board[i][j], end=" ")
        print()

# Example usage for a 4x4 chessboard
solve_nqueens(5)
