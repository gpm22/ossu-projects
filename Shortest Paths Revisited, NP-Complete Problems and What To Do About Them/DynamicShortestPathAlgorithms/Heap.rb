class Heap
  attr_accessor :elements

  def initialize
    @elements = []
    @positions = Hash.new
  end

  def findMin
    @elements[0]
  end

  def getElement(element)
    position = @positions[element]
    @elements[position]
  end

  def extractMin
    self.delete(@elements[0][1])
  end

  def heapify(arr)
    @elements = arr
    @positions = Hash[@elements.collect.with_index { |e, i| [e[1], i] }]
    arr.size.times.each do |i|
      self.bubbleDown(i)
    end
    arr.size.times.each do |i|
      self.bubbleUp(i)
    end
  end

  def insert(element)
    @elements.push(element)
    position = (@elements.size) - 1
    @positions[element[1]] = position
    self.bubbleUp(position)
    element
  end

  def delete(element)
    position = @positions[element]
    @elements[position], @elements[-1], @positions[element], @positions[@elements[-1][1]] = @elements[-1], @elements[position], @positions[@elements[-1][1]], @positions[element]
    deleted = @elements.pop
    @positions.delete(element)
    solveConflicts(position)
    deleted
  end

  def update(element)
    position = @positions[element[1]]
    return if element[0] == @elements[position][0]
    @elements[position] = element
    solveConflicts(position)
  end

  def to_s
    "elements: #{@elements.map { |pair| "heap key: #{pair[0]} - position #{@positions[pair[1]]} - element: #{pair[1].to_s}" }.to_s}"
  end

  def empty?
    @elements.empty?
  end

  def size
    @elements.size
  end

  def include?(element)
    @positions.has_key?(element)
  end

  private

  def solveConflicts(position)
    parentPosition = getParentPosition(position)
    if isRoot?(position) || @elements[parentPosition][0] < element[0]
      self.bubbleDown(position)
    else
      self.bubbleUp(position)
    end
  end

  def bubbleUp(startPosition)
    position = startPosition
    parentPosition = getParentPosition(position)
    while !self.isRoot?(position) && @elements[parentPosition][0] > @elements[position][0]
      @elements[parentPosition], @elements[position], @positions[@elements[parentPosition][1]], @positions[@elements[position][1]] = @elements[position], @elements[parentPosition], @positions[@elements[position][1]], @positions[@elements[parentPosition][1]]
      position = parentPosition
      parentPosition = getParentPosition(position)
    end
  end

  def bubbleDown(startPosition)
    position = startPosition
    smallerChildPosition = getSmallerChildPosition(position)
    while smallerChildPosition < @elements.size && @elements[smallerChildPosition][0] < @elements[position][0]
      @elements[smallerChildPosition], @elements[position], @positions[@elements[smallerChildPosition][1]], @positions[@elements[position][1]] = @elements[position], @elements[smallerChildPosition], @positions[@elements[position][1]], @positions[@elements[smallerChildPosition][1]]
      position = smallerChildPosition
      smallerChildPosition = getSmallerChildPosition(position)
    end
  end

  def getParentPosition(position)
    (position / 2.0).ceil - 1
  end

  def getLeftChildPosition(position)
    2 * position + 1
  end

  def getRightChildPosition(position)
    2 * position + 2
  end

  def isRoot?(position)
    position == 0
  end

  def getSmallerChildPosition(position)
    left = getLeftChildPosition(position)
    right = getRightChildPosition(position)

    return left if right > (@elements.size - 1)

    if @elements[left][0] < @elements[right][0]
      left
    else
      right
    end
  end
end
