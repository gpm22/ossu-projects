require 'set'
require 'benchmark'

def two_sum(arr, t, set)
  arr.each do |x|
    y = t - x
    next if y == x
    return true if set.include?(y.to_s)
  end
  false
end

def two_sum_hash(arr, t)
  hash = Hash[arr.collect { |n| [n.to_s, n] }]
  two_sum(arr, t, hash)
end

def two_sum_set(arr, t)
  set = arr.map(&:to_s).to_set
  two_sum(arr, t, set)
end

def getListOfRandomIntegers
  arr = []
  1_000_000.times { arr.push(rand(-100_000_000_000..100_000_000_000)) }
  arr
end

def getNumbersFromFile
  arr = []
  File.open('two_sum_numbers.txt').each_line { |line| arr.push(line.to_i) }
  arr
end

def countTargets(arr)
  count = 0
  a = 0.0
  #    (-10_000..10_000).each do |i|
  (-100..100).each do |i|
    puts "counting step: #{a} - percentage #{(a * 100) / 201} %" if a % 20 < 1
    a += 1
    count += (yield(arr, i) ? 1 : 0)
  end
  count
end

def countTargetsWithSet(arr, set)
  count = 109 #109 at t -4860
  a = 5140.0#0.0
  #  (-100..-50).each do |i|
  (-4_860..10_000).each do |i|
    puts "current t: #{i} - counting step: #{a} - percentage #{(a * 100) / 20_001} % - current count: #{count}" if a % 20 < 1
    a += 1
    count += (two_sum(arr, i, set) ? 1 : 0)
  end
  count
end

def test(arr, t, result)
  puts "hash test - arr=#{arr.size} - t: #{t} - expected result: #{result} - passed? #{if result == two_sum_hash(
    arr, t
  )
                                                                                         'yes!'
                                                                                       else
                                                                                         'non ):'
                                                                                       end}"
  puts "set test - arr=#{arr.size} - t: #{t} - expected result: #{result} - passed? #{if result == two_sum_set(arr,
                                                                                                               t)
                                                                                        'yes!'
                                                                                      else
                                                                                        'non ):'
                                                                                      end}"
end

def tests
  test([1, 1], 2, false)
  test([0, 1, 2], 2, true)
  test([-2, 1, 4], 0, false)
end

def compareSetAndHash
  # puts "getting list of random integers"
  # arr = getListOfRandomIntegers
  puts 'getting list from file'
  arr = getNumbersFromFile
  puts 'starting hash'
  hash_count = 0
  hash_time = Benchmark.measure do
    hash_count = countTargetsWithSet(arr, Hash[arr.collect { |n| [n.to_s, nil] }])
  end
  puts "hash count: #{hash_count} - hash time: #{hash_time.real}"

  puts 'starting set'
  set_count = 0
  set_time = Benchmark.measure do
    set_count = countTargetsWithSet(arr, arr.map(&:to_s).to_set)
  end
  puts "set count: #{set_count} - set time: #{set_time.real}"
end

def solveProblem
  puts 'getting numbers from file'
  arr = getNumbersFromFile
  puts 'starting counting'
  set = Hash[arr.collect { |n| [n.to_s, n] }]
  count = countTargetsWithSet(set.values, set)
  puts "counting result: #{count}"
end

solveProblem #result is 427