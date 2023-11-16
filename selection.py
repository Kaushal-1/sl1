def selection_sort(arr):
    n = len(arr)

    for i in range(n):
        # Find the minimum element in the unsorted part
        min_index = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_index]:
                min_index = j

        # Swap the minimum element with the first element of the unsorted part
        arr[i], arr[min_index] = arr[min_index], arr[i]

    return arr

# Get user input for array elements
user_input = input("Enter the array elements separated by spaces: ")
array_to_sort = list(map(int, user_input.split()))

# Call the selection_sort function with the user-input array
sorted_array = selection_sort(array_to_sort)

# Display the sorted array
print("Sorted Array:", sorted_array)
