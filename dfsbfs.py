from collections import defaultdict, deque

# Function to add an edge to the graph
def add_edge(graph, u, v):
    graph[u].append(v)
    graph[v].append(u)

# Depth-First Search (DFS) function
def dfs(graph, node, visited):
    if node not in visited:
        print(node, end=' ')  # Print the current node
        visited.add(node)  # Mark the node as visited
        for neighbor in graph[node]:
            dfs(graph, neighbor, visited)

# Breadth-First Search (BFS) function
def bfs(graph, start):
    visited = set()
    queue = deque([start])
    while queue:
        node = queue.popleft()
        if node not in visited:
            print(node, end=' ')  # Print the current node
            visited.add(node)
            queue.extend(neighbor for neighbor in graph[node] if neighbor not in visited)

# Get the number of vertices and edges from the user
num_vertices = int(input("Enter the number of vertices: "))
num_edges = int(input("Enter the number of edges: "))

# Create an empty graph as an adjacency list
graph = defaultdict(list)

# Input edges
for _ in range(num_edges):
    u, v = input("Enter an edge (format: u v): ").split()
    add_edge(graph, u, v)

# Choose a starting node for DFS and BFS
start_node = input("Enter the starting node: ")

# Initialize visited sets
visited_dfs = set()
visited_bfs = set()

# Perform DFS and BFS
print("Depth-First Search (DFS):")
dfs(graph, start_node, visited_dfs)
print("\n")
print("Breadth-First Search (BFS):")
bfs(graph, start_node)
