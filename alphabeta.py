MAX = 1000
MIN = -1000

def minimax(depth, node_index, maximizing_player, values, alpha, beta):
    if depth == 3:
        return values[node_index]

    if maximizing_player:
        best = MIN
        for i in range(2):
            val = minimax(depth + 1, node_index * 2 + i, False, values, alpha, beta)
            best = max(best, val)
            alpha = max(alpha, best)
            if beta <= alpha:
                break
        return best
    else:
        best = MAX
        for i in range(2):
            val = minimax(depth + 1, node_index * 2 + i, True, values, alpha, beta)
            best = min(best, val)
            beta = min(beta, best)
            if beta <= alpha:
                break
        return best

def main():
    # Take user input for values
    values = []
    for i in range(8):
        value = int(input(f"Enter value for node {i}: "))
        values.append(value)

    # Print the user-input values
    print("User-input values:", values)

    # Call the minimax function with user-input values
    result = minimax(0, 0, True, values, MIN, MAX)
    print("The optimal value is:", result)

if __name__ == "__main__":
    main()
