def two_sum_fast_counting(arr, t_low, t_high)
    puts "ordering and removing duplicates from the array"
    orderedArr = arr.sort.uniq
    targets = Hash.new

    puts "starting the counting"
    orderedArr.each do |num|
        low = bisect_left(orderedArr, t_low-num) 
        high = bisect_right(orderedArr, t_high-num)
        yRange = if (high > low)
            orderedArr.slice(low..(high-1))  
        else [] 
        end
        yRange.each do |y|
            targets[(num+y).to_s] = num+y if y != num
        end
    end
    targets.size
end

def bisect_left(arr, num)
    bisect(arr, num, true, 0)
end

def bisect_right(arr, num)
    bisect(arr, num, false, 0)
end

def bisect(arr, num, left, correcting)
    return correcting if arr.empty?

    middle = (arr.size/2.0).ceil-1

    if arr[middle] == num
        if left
            return correcting if middle == 0
            return middle + correcting
        else
            return middle + 1 + correcting
        end
    end

    return bisect(arr.drop(middle+1), num, left, correcting+middle+1) if num > arr[middle]
    bisect(arr.take(middle), num, left, correcting) if num < arr[middle]
end

def getNumbersFromFile
  arr = []
  File.open('two_sum_numbers.txt').each_line { |line| arr.push(line.to_i) }
  arr
end

def bissec_tests
    arr = [0, 1, 2]

    puts " 1 == #{bisect_left(arr, 1)}"
    puts " 0 == #{bisect_left(arr, -1)}"
    puts " 3 == #{bisect_left(arr, 3)}"
    puts " 2 == #{bisect_right(arr, 1)}"
    puts " 0 == #{bisect_right(arr, -1)}"
    puts " 3 == #{bisect_right(arr, 3)}"
    arr = [0, 1, 3, 5, 12 ,14, 51]
    puts " 5 == #{bisect_right(arr, 12)}"
    arr = [-51, -12, -1, 0, 3, 5, 14]
    puts " 3 == #{bisect_left(arr, 0)}"
    puts " 1 == #{bisect_left([0, 1, 2], 1)}"
    puts " 7 == #{bisect_left(arr, 28)}"
    puts " 0 == #{bisect_left(arr, -53)}"
    puts " 0 == #{bisect_left(arr, -51)}"
    puts " 6 == #{bisect_left(arr, 14)}"
    puts " 2 == #{bisect_left(arr, -2)}"
   
    puts " 4 == #{bisect_right(arr, 0)}"
    puts " 7 == #{bisect_right(arr, 28)}"
    puts " 0 == #{bisect_right(arr, -53)}"
    puts " 1 == #{bisect_right(arr, -51)}"
    puts " 7 == #{bisect_right(arr, 14)}"
    puts " 2 == #{bisect_right(arr, -2)}"

    arr = [-51, -12, -1, 0, 2, 3, 5, 14]

    puts " 3 == #{bisect_left(arr, 0)}"
    puts " 8 == #{bisect_left(arr, 28)}"
    puts " 0 == #{bisect_left(arr, -53)}"
    puts " 0 == #{bisect_left(arr, -51)}"
    puts " 7 == #{bisect_left(arr, 14)}"
    puts " 2 == #{bisect_left(arr, -2)}"
   
    puts " 4 == #{bisect_right(arr, 0)}"
    puts " 8 == #{bisect_right(arr, 28)}"
    puts " 0 == #{bisect_right(arr, -53)}"
    puts " 1 == #{bisect_right(arr, -51)}"
    puts " 8 == #{bisect_right(arr, 14)}"
    puts " 2 == #{bisect_right(arr, -2)}"

end

def solveProblem
    puts two_sum_fast_counting(getNumbersFromFile, -10_000, 10_000)
end

def test(arr, t_low, t_high, expected)
    puts "arr: #{arr} - t_low: #{t_low} - t_high: #{t_high} - expected: #{expected} - real: #{two_sum_fast_counting(arr, t_low, t_high)}"
end

def tests
    arr = [1, 3, 5, 0, 12 ,14, 51]
    test(arr, 26, 31, 1)
    test(arr, 1, 12, 7)

    arr = [-1, 3, 5, 0, -12 ,14, -51]
    test(arr, 1, 12, 5)
    test(arr, -12, 12, 9)
    arr = [-1, 3, 5, 0, 2, -12 ,14, -51]
    test(arr, 1, 12, 7)
    test(arr, -12, 12, 12)
    arr = [-1, 3, 5, 0, 2, 2, -12 ,14, -51]
    test(arr, 1, 12, 7)
    test(arr, -12, 12, 12)
    test(arr, -24, 30, 18)
    arr = [-1, -3, -5, -0, -2, -2, -12 ,-14, -51]
    test(arr, 1, 12, 0)
    test(arr, -12, 12, 9)
    test(arr, -24, 30, 15) 
end

def bissec_tests_big
    arr = getNumbersFromFile.sort.uniq

    bissect_test_big(arr, -99999376014, 999749, 999751)
    bissect_test_big(arr, -99997376372, 999741, 999742)
    bissect_test_big(arr, -99997042493, 999741, 999741)

end

def bissect_test_big(arr, num, expected_low, expected_right)
    l = -10_000-num
    h = 10_000-num

    low = bisect_left(arr, l)
    high = bisect_right(arr, h)

    puts "num: #{num} - expected low: #{expected_low} - low: #{low} - expected high: #{expected_right} - high :#{high}"
    puts "num at low: #{arr[low]} - num at low left: #{arr[low-1]} - num at low right #{arr[low+1]}"
    puts "num at high: #{arr[high]} - num at high left: #{arr[high-1]} - num at high right #{arr[high+1]}"
end

solveProblem