require './unbalanced_search_tree'
require './red_black_tree'
require './heap'
require 'benchmark'

class MendianMaintenanceBaseTree
  def insert(number)
    @elements.insert(number, number)
    median = if @elements.root.size.even?
               @elements.root.size / 2
             else
               (@elements.root.size + 1) / 2
             end
    @elements.select(median)
  end
end

class MendianMaintenanceUnbalanced < MendianMaintenanceBaseTree
  def initialize
    @elements = UnbalancedSearchTree.new(nil)
  end
end

class MendianMaintenanceRedAndBlack < MendianMaintenanceBaseTree
  def initialize
    @elements = RedBlackTree.new(nil)
  end
end

class MendianMaintenanceHeap
  def initialize
    @smallerHeap = Heap.new # maximal heap, which is a miniminal with negative keys
    @biggerHeap = Heap.new # minimal heap
    @numberOfRounds = 0
  end

  def insert(number)
    insertNumber(number)
    @numberOfRounds += 1
    balanceHeaps
    getMedian
  end

  :private

  def insertNumber(number)
    negativeNumber = number * -1
    return @biggerHeap.insert([number, number]) if @biggerHeap.elements.empty?

    biggerHeapMin = @biggerHeap.findMin[1]

    if number < biggerHeapMin
      @smallerHeap.insert([negativeNumber, number])
    else
      @biggerHeap.insert([number, number])
    end
  end

  def balanceHeaps
    return unless @numberOfRounds.even?

    smallerHeapSize = @smallerHeap.elements.size
    biggerHeapSize = @biggerHeap.elements.size

    return if smallerHeapSize == biggerHeapSize

    if smallerHeapSize < biggerHeapSize
      element = @biggerHeap.extractMin
      negativeNumber = element[0] * -1
      @smallerHeap.insert([negativeNumber, element[1]])
    else
      element = @smallerHeap.extractMin
      @biggerHeap.insert([element[1], element[1]])
    end
  end

  def getMedian
    if @smallerHeap.elements.size < @biggerHeap.elements.size
      @biggerHeap.findMin[1]
    else
      @smallerHeap.findMin[1]
    end
  end
end

def testMedian
  timeHeapAscending = runTestAscending(MendianMaintenanceHeap.new)
  timeUnbalancedAscending = runTestAscending(MendianMaintenanceUnbalanced.new)
  timeRedAndBlackAscending = runTestAscending(MendianMaintenanceRedAndBlack.new)

  puts 'Ascending test:'
  puts "heap: #{timeHeapAscending} - Unbalanced: #{timeUnbalancedAscending} - Red and Black: #{timeRedAndBlackAscending}"

  timeHeapDescending = runTestDescending(MendianMaintenanceHeap.new)
  timeUnbalancedDescending = runTestDescending(MendianMaintenanceUnbalanced.new)
  timeRedAndBlackDescending = runTestDescending(MendianMaintenanceRedAndBlack.new)

  puts 'Descending test:'
  puts "heap: #{timeHeapDescending} - Unbalanced: #{timeUnbalancedDescending} - Red and Black: #{timeRedAndBlackDescending}"

  timeHeapRandom = 0.0
  timeUnbalancedRandom = 0.0
  timeRedAndBlackRandom = 0.0

  15.times do
    timeHeapRandom += runTestRandom(MendianMaintenanceHeap.new)
    timeUnbalancedRandom += runTestRandom(MendianMaintenanceUnbalanced.new)
    timeRedAndBlackRandom += runTestRandom(MendianMaintenanceRedAndBlack.new)
  end

  timeHeapRandom /= 15
  timeUnbalancedRandom /= 15
  timeRedAndBlackRandom /= 15

  puts 'Random test:'
  puts "heap: #{timeHeapRandom} - Unbalanced: #{timeUnbalancedRandom} - Red and Black: #{timeRedAndBlackRandom}"
end

def runTestAscending(medianMaintenance)
  Benchmark.measure do
    4501.times do |i|
      medianMaintenance.insert(i)
    end
  end.real
end

def runTestDescending(medianMaintenance)
  Benchmark.measure do
    4500.downto(0) do |i|
      medianMaintenance.insert(i)
    end
  end.real
end

def runTestRandom(medianMaintenance)
  Benchmark.measure do
    10_001.times do
      i = rand(-100_000_000..100_000_000)
      medianMaintenance.insert(i)
    end
  end.real
end

def gettingModulosOfMedians
  sumHeap = 0
  sumUnbalanced = 0
  sumRedAndBlack = 0

  heap = MendianMaintenanceHeap.new
  unbalanced = MendianMaintenanceUnbalanced.new
  redAndBlack = MendianMaintenanceRedAndBlack.new

  File.open('median_maintenance.txt').each_line do |line|
    number = line.to_i
    sumHeap += heap.insert(number)
    sumUnbalanced += unbalanced.insert(number).key
    sumRedAndBlack += redAndBlack.insert(number).key
  end

  puts "sums:\nheap: #{sumHeap} -- unbalanced: #{sumUnbalanced} -- red and black: #{sumRedAndBlack}"

  moduloHeap = sumHeap.modulo(10_000)
  moduloUnbalanced = sumUnbalanced.modulo(10_000)
  moduloRedAndBlack = sumRedAndBlack.modulo(10_000)

  puts "modulos:\nheap: #{moduloHeap} -- unbalanced: #{moduloUnbalanced} -- red and black: #{moduloRedAndBlack}"
end
gettingModulosOfMedians
# testMedian
