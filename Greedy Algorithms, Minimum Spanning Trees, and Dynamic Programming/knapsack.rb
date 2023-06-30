class Knapsack
  attr_reader :items, :size

  def initialize(items, size)
    @items = items
    @size = size
  end

  def getIterativeSolution
    getIterativeSolutionValue
    reconstructKnapsacIterative
  end

  def getRecursiveSolution
    getRecursiveSolutionValue
    reconstructKnapsacRecursive
  end

  def getIterativeSolutionValue
    puts 'generating subproblems solutions array'
    @subproblemsSolutions = Array.new(@items.size + 1)
    (0..@subproblemsSolutions.size - 1).each do |i|
      @subproblemsSolutions[i] = Array.new(size + 1)
    end
    puts "subproblems solutions array size: #{@subproblemsSolutions.size * @subproblemsSolutions[0].size}"
    puts 'solving base case i = 0'
    # base case (i = 0)
    (0..size).each do |c|
      @subproblemsSolutions[0][c] = 0
    end

    # systematically solve all problems
    puts 'solving all problems systemativally'
    (1..@subproblemsSolutions.size - 1).each do |i|
      (0..size).each do |c|
        if items[i - 1].size > c
          @subproblemsSolutions[i][c] = @subproblemsSolutions[i - 1][c]
        else
          @subproblemsSolutions[i][c] =
            [@subproblemsSolutions[i - 1][c],
             (@subproblemsSolutions[i - 1][c - @items[i - 1].size] + @items[i - 1].value)].max
        end
      end
    end

    @subproblemsSolutions[-1][-1]
  end

  def getRecursiveSolutionValue
    @recursiveSubproblemsSolutions = {}
    result = getIterativeSolutionValueHelper(@items.size, size)
    puts "recursive subproblems size: #{@recursiveSubproblemsSolutions.size}" 
    result
  end

  def to_s
    "Knapsack:[size: #{@size}, number of items: #{@items.size}, items:\n#{@items.map(&:to_s)}]"
  end

  def getInfo
    "Knapsack:[size: #{@size}, number of items: #{@items.size}]"
  end

  private

  def reconstructKnapsacIterative
    reconstructKnapsac {|i, c| @subproblemsSolutions[i][c]}
  end

  def reconstructKnapsacRecursive
    reconstructKnapsac {|i, c| @recursiveSubproblemsSolutions["#{i}-#{c}"]}
  end

  def reconstructKnapsac
    solutionItems = []
    c = size

    @items.size.downto(1).each do |i|
      if @items[i - 1].size <= c && (yield((i - 1), (c - @items[i - 1].size)) + @items[i - 1].value) >= yield((i - 1),c)
        solutionItems.push(items[i - 1])
        c -= @items[i - 1].size
      end
    end

    solutionItems
  end

  def getIterativeSolutionValueHelper(n, c)
    return @recursiveSubproblemsSolutions["#{n}-#{c}"] if @recursiveSubproblemsSolutions.include? "#{n}-#{c}"

    return 0 if n == 0

    if @items[n - 1].size > c
      result = getIterativeSolutionValueHelper(n - 1, c)
    else
      case1 = getIterativeSolutionValueHelper(n - 1, c)
      case2 = getIterativeSolutionValueHelper(n - 1, c - @items[n - 1].size) + @items[n - 1].value

      result = [case1, case2].max
    end

    @recursiveSubproblemsSolutions["#{n}-#{c}"] = result
    result
  end
end

class Item
  attr_reader :key, :value, :size

  def initialize(key, value, size)
    @key = key
    @value = value
    @size = size
  end

  def to_s
    "Item[key: #{@key}, value: #{@value}, size: #{@size}]"
  end
end

def getKnapsackFromFile(file)
  items = []
  size = 0
  i = 0
  File.open(file).each_line do |line|
    values = line.strip.split(' ')
    if i == 0
      i += 1
      size = values[0].to_i
      next
    end
    items.push(Item.new(i, values[0].to_i, values[1].to_i))
    i += 1
  end
  Knapsack.new(items, size)
end

def test1
  knapsack = getKnapsackFromFile('knapsack_file_1.txt')
  puts "testing file 1 - #{knapsack.getInfo}"
  puts "iterative value: #{knapsack.getIterativeSolutionValue}"
  puts "recursive value: #{knapsack.getRecursiveSolutionValue}"
  puts "iterative soltuion: #{knapsack.getIterativeSolution.map(&:key).sort.to_s}"
  puts "recursive soltuion: #{knapsack.getRecursiveSolution.map(&:key).sort.to_s}"
end

def test2
  knapsack = getKnapsackFromFile('knapsack_file_2.txt')
  puts "testing file 2 - #{knapsack.getInfo}"
  puts "recursive value: #{knapsack.getRecursiveSolutionValue}"
  # result = 4243395
  # used 10 623 872 subproblems, instead of the 4 002 002 001 of the iterative solution.
end

test1