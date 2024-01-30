from numbers import Real 

def merge_sort(nums: list[Real]) -> list[Real]:
    """Merge sort algorithm implementation in Python.
    This is a recursive algorithm that divides the list in half until each half 
    has 1 element, then merges the lists back together in a sorted order.
    """
    
    if not isinstance(nums, list):
        raise TypeError("not a list")
        
    for num in nums:
        if not isinstance(num, Real):
            raise TypeError(f"Element {str(num)} is not a real number.")
    
    # Base case - list of 1 element is already sorted
    if len(nums) <= 1:
        return nums
    
    # Find the middle index and divide the list into two halves
    mid = len(nums) // 2
    
    # Sort the left half 
    left = merge_sort(nums[:mid])
    
    # Sort the right half
    right = merge_sort(nums[mid:])
    
    # Merge the sorted left and right halves 
    return merge(left, right)

def merge(left: list[Real], right: list[Real]) -> list[Real]:
    """Merge two sorted lists left and right, and return a sorted result"""
    result = []
    i, j = 0, 0
    
    # While there are elements in the left or right lists:
    while i < len(left) and j < len(right): 
        # If left element is smaller than right, add left element
        # to the result and move to the next left element 
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            # Add right element to result and move to the next right element 
            result.append(right[j])
            j += 1
            
    # Add any remaining elements from the left or right list
    result += left[i:]
    result += right[j:]
    return result 
