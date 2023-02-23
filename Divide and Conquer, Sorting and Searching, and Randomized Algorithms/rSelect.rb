def rSelect (arr, i, l, r)
    if l >= r  # 0- or 1-element subarray
    	return arr[l]
    end
    pivot_position = choosePivot(arr, l, r)
    new_pivot_position = partition(arr, pivot_position, l, r)
	
    if new_pivot_position == i # you got lucky!
        return arr[new_pivot_position]
    elsif new_pivot_position > i
        return rSelect(arr, i, l, new_pivot_position-1)
    else
    	return rSelect(arr, i, new_pivot_position+1, r)
    end
end
    
def partition(arr, pivot_position, l, r)
    arr[l], arr[pivot_position] = arr[pivot_position], arr[l] # make pivot first
    p = arr[l]
    i = l + 1
    for j in (l + 1)..r
    	if arr[j] < p # if arr[j] > p do nothing
    		arr[j], arr[i] = arr[i], arr[j]
    		i = i + 1 # restores invariant
        end
    end
    arr[l], arr[i - 1] = arr[i - 1], arr[l] # place pivot correctly
    i - 1 # report final pivot position
end

def choosePivot(arr, l, r)
    rand(l..r)
end

def testCase(arr, i, expected_value)
    real_value = rSelect(Array.new(arr), i, 0, arr.length-1)
    ans = "arr: " + arr.to_s + " - i: " + i.to_s + " - expected: " + expected_value.to_s + " - real: " + real_value.to_s  + " - is correct? " + (expected_value == real_value).to_s

    puts ans
end

def test()
    arr_1 = [9, 8, 4, 11, 2, 7]
    i_ans_1 = [[0, 2], [5, 11], [2, 7], [1, 4], [3, 8], [4, 9]]

    i_ans_1.each {|x| testCase(arr_1, x[0], x[1])}

end

test()