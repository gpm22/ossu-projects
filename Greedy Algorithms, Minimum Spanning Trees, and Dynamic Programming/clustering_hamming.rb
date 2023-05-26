STDOUT.sync = true

require_relative './unionFind'

def getNodesFromFile
    puts "getting nodes from file"
    Hash[File.readlines('clustering_big.txt').drop(1).collect {|n| [n.gsub(/\s+/, ""), nil]}]
end

def main
    puts "starting"
    nodes = getNodesFromFile
    puts "creating the union find"
    unionFind = UnionFind.new(nodes.keys)
    puts "executing main loops"
    nodes.keys.each_with_index do |node, k|
        binary = node.to_i(2)
        puts "node #{k}/#{nodes.size}" if k % 2_000 == 0 
        (24).times do |i|
            distance_1 = '%024b' % (binary ^ (1 << i))
            if nodes.include?(distance_1)
                unionFind.union(node, distance_1)
            end
            (24).times do |j|
                distance_2 = '%024b' % (binary ^ (1 << i) ^ (1 << j))
                if nodes.include?(distance_2)
                    unionFind.union(node, distance_2)
                end
            end
        end
    end
    puts "number of Roots: #{unionFind.numberOfRoots}"
end

main 