class BloomFilter
  attr_reader :size, :hashes

  def initialize(size, num_hashes)
    @size = size
    @hashes = num_hashes
    @bit_array = Array.new(size, 0)
  end

  def add(element)
    hashes.times do |i|
      index = hash(element, i) % size
      @bit_array[index] = 1
    end
  end

  def contains?(element)
    hashes.times do |i|
      index = hash(element, i) % size
      return false if @bit_array[index].zero?
    end
    true
  end

  private

  def hash(element, index)
    # Using the hashcode function in Ruby for simplicity
    element.hash ^ index
  end
end
