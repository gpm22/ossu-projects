def quickSort (arr, l, r, choosePivot, count)
    if l >= r  # 0- or 1-element subarray
    	return
    end
    i = choosePivot.call(arr, l, r, count)
    arr[l], arr[i] = arr[i], arr[l] # make pivot first
    j = partition(arr, l, r, count) # j =new pivot position
    quickSort(arr, l, j - 1, choosePivot, count) # recurse on first part
    quickSort(arr, j + 1, r, choosePivot, count) # recurse on second part
    return
end
    
def partition(arr, l, r, count)
    p = arr[l]
    i = l + 1
    for j in (l + 1)..r
    	if arr[j] < p # if arr[j] > p do nothing
    		arr[j], arr[i] = arr[i], arr[j]
    		i = i + 1 # restores invariant
             count.next
        end
    end
    arr[l], arr[i - 1] = arr[i - 1], arr[l] # place pivot correctly
    i - 1 # report final pivot position
end
    
def choosePivotFirstElement(arr, l, r, count)
    count.next
    l
end
 
def choosePivotLastElement(arr, l, r, count)
    count.next
    r
end

def choosePivotRandomElement(arr, l, r, count)
    count.next
    rand(l..r)
end

def choosePivotMedianOfThree(arr, l, r, count)
    if l >= r or ((r-l) == 1) # 0-, 1-, 2-element subarray
        count.next
    	return l
    end
    
    half = ((r-l)/2).floor
    count.next
    first = arr[l]
    second = arr[half]
    third = arr[r]
    count.next
    if (first >= second and first <= third) or (first <= second and first >= third)
        return l
    end
    count.next
    if (second >= first and second <= third) or (second <= first and second >= third)
        return half
    end
    count.next
    r 
end
    
def quickSortFirstElement(arr, l, r)
    count = Enumerator.new { |y| i = -1; loop { y << (i+=1) } } 
	quickSort(arr, l, r, method(:choosePivotFirstElement), count)
    count.next - 1
end
    
def quickSortLastElement(arr, l, r)
    count = Enumerator.new { |y| i = -1; loop { y << (i+=1) } } 
    quickSort(arr, l, r, method(:choosePivotLastElement), count)
    count.next - 1
end
    
def quickSortRandomElement(arr, l, r)
    count = Enumerator.new { |y| i = -1; loop { y << (i+=1) } } 
	quickSort(arr, l, r, method(:choosePivotRandomElement), count)
    count.next - 1
end
    
def quickSortMedianOfThree(arr, l, r)
    count = Enumerator.new { |y| i = -1; loop { y << (i+=1) } } 
	quickSort(arr, l, r, method(:choosePivotMedianOfThree), count)
    count.next - 1
end    

def testCase(arr)
    header = "Array: " + arr.to_s

    arr1 = Array.new(arr)
    count1 = quickSortFirstElement(arr1, 0, arr1.length-1)

    arr2 = Array.new(arr)
    count2 = quickSortLastElement(arr2, 0, arr2.length-1)

    count3 = 0
    for i in 1..50
        arr3 = Array.new(arr)
        count3 = count3 + quickSortRandomElement(arr3, 0, arr3.length-1)
    end

    count3 = count3/50

    arr4 = Array.new(arr)
    count4 = quickSortMedianOfThree(arr4, 0, arr4.length-1)

    arrSorted = arr.sort

    
    firstElement = "firstElement - is correct? " + (arr1 == arrSorted).to_s + " - count: " + count1.to_s 
    lastElement = "lastElement - is correct? " + (arr2 == arrSorted).to_s + " - count: " + count2.to_s 
    randomElement = "randomElement - is correct? " + (arr3 == arrSorted).to_s + " - count: " + count3.to_s 
    medianOfThree = "medianOfThree - is correct? " + (arr4 == arrSorted).to_s + " - count: " + count4.to_s 

    header + "\n" + firstElement + "\n" + lastElement + "\n" + randomElement + "\n" + medianOfThree + "\n"
end

def test()
    arrays = [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                [10, 4, 56, 129, 1, 3],
                [10, 9, 8, 7, 6, 5 ,4 ,3 ,2 ,1],
                [121, 4343, 12, 33, -1, 10, 21]]

    arrays.each { |a| puts testCase(a)}
end

def getArrayFromFile()
    arr = File.open("quicksort_array.txt").readlines.map(&:chomp).map(&:to_i)
end

def testCaseFile(arr, arrSorted)
    arr1 = Array.new(arr)
    count1 = quickSortFirstElement(arr1, 0, arr1.length-1)

    puts "firstElement - is correct? " + (arr1 == arrSorted).to_s + " - count: " + count1.to_s
    arr2 = Array.new(arr)
    count2 = quickSortLastElement(arr2, 0, arr2.length-1)

    puts "lastElement - is correct? " + (arr2 == arrSorted).to_s + " - count: " + count2.to_s
    count3 = 0
    for i in 1..50
        arr3 = Array.new(arr)
        count3 = count3 + quickSortRandomElement(arr3, 0, arr3.length-1)
    end
    count3 = count3/50

    puts "randomElement - is correct? " + (arr3 == arrSorted).to_s + " - count: " + count3.to_s
    arr4 = Array.new(arr)
    count4 = quickSortMedianOfThree(arr4, 0, arr4.length-1)

    puts "medianOfThree - is correct? " + (arr4 == arrSorted).to_s + " - count: " + count4.to_s
end
puts "file test"

testCaseFile(getArrayFromFile, getArrayFromFile.sort)

puts "\n my test"

test