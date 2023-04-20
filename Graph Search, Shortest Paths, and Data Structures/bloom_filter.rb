require 'digest'

class BlooomFilter


    def initialize
        @md5 = Digest::MD5.new
        @functionsSize =  10**2#10**39
        @elements = Hash.new
    end

    def insert(key)
        (1..6).each do |i|
            @elements[hashFunctionGenerator(key, i)] = true
        end
    end

    def lookUp(key)
        (1..6).each do |i|
           return false unless @elements.include?(hashFunctionGenerator(key, i))
        end
        true
    end


    def printElements
        puts @elements.keys.to_s
    end

    :private

    def hashFunctionGenerator(key, i)
        hash = @md5.hexdigest(key).to_i(16)
        (hash + (i-1) * hash).modulo(@functionsSize).to_s(16)
    end

end


def test(bloom, key)
    bloom.insert(key)
    bloom.printElements
end

bloom = BlooomFilter.new

puts bloom.lookUp("Hola")

bloom.printElements
test(bloom, "Hola")

puts bloom.lookUp("Hola")

test(bloom, "auai")

bloom.printElements

test(bloom, "aa")
test(bloom, "bb")
test(bloom, "cc")

puts bloom.lookUp("dd") #false positive