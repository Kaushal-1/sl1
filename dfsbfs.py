def dfs(graph, start, visited=None):
    if visited is None:
        visited = set()
    visited.add(start)
    print(start, end=" ")

    for neighbor in graph[start]:
        if neighbor not in visited:
            dfs(graph, neighbor, visited)


def bfs(graph, start):
    visited = set()
    queue = [start]
    visited.add(start)

    while queue:
        vertex = queue.pop(0)
        print(vertex, end=" ")

        for neighbor in graph[vertex]:
            if neighbor not in visited:
                queue.append(neighbor)
                visited.add(neighbor)


# Example usage:
graph = {0: [1, 2, 3], 1: [0], 2: [0, 4, 3], 3: [0, 2], 4: [2]}

print("Graph: ")
print(graph)
print("DFS starting from vertex 2:")
dfs(graph, 0)
print("\nBFS starting from vertex 2:")
bfs(graph, 0)
