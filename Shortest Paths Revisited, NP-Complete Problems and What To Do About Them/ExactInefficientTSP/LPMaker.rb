class LPMaker

    def initialize(graph, name, improvement=false)
        @graph = graph
        @outputFile = File.new(name + ".lp", "w")
        @outputFile.truncate(0) 
        @improvement = improvement
        @vertices = @graph.vertices.keys
    end

    def createFile
        addObjectiveFunction
        addConstraints
        addBounds
        addInteger
        @outputFile.puts("End")
        @outputFile.close
    end

    private

    def addObjectiveFunction
        # add minimize TSP:
        @outputFile.puts("Minimize")
        @outputFile.print("TSP: ")
        generateObjectiveFunction
    end

    def generateObjectiveFunction
        
        # sum from i=1 to n sum from j=1 to n, j != i c_ij*x_ij
        value = ""
        @vertices.each do |vertex_i|
            @vertices.each do |vertex_j|
                next if vertex_i == vertex_j

                x = "x_#{vertex_i}#{vertex_j}"
                c = @graph.getEdgeValue(vertex_i, vertex_j)
                value += "#{c} #{x} + "
            end
        end
        value = value.chomp(" + ")

        @outputFile.puts(value)
    end

    def addConstraints
        # add subject to
        @outputFile.puts("Subject to")
        generateConstraintsToX
        generateConstraintsToY
    end

    def generateConstraintsToX

        # for every vertex i \sum from j=1 to n, j != i x_ij = 1
        @vertices.each do |vertex_i|
            value = ""
            @vertices.each do |vertex_j|
                next if vertex_i == vertex_j

                x = "x_#{vertex_i}#{vertex_j}"
                value += "#{x} + "
            end
            value = value.chomp(" + ")
            value += " = 1"
            @outputFile.puts("x1_#{vertex_i}: #{value}")
        end

        # for every vertex i \sum from j=1 to n, j != i x_ji = 1
        @vertices.each do |vertex_i|
            value = ""
            @vertices.each do |vertex_j|
                next if vertex_i == vertex_j

                x = "x_#{vertex_j}#{vertex_i}"
                value += "#{x} + "
            end
            value = value.chomp(" + ")
            value += "  = 1"
            @outputFile.puts("x2_#{vertex_i}: #{value}")
        end

        return unless @improvement

        # IMPROVEMENT for all i != j x_ij + x_ji <= 1

        @vertices.each do |vertex_i|
            @vertices.each do |vertex_j|
                next if vertex_i == vertex_j

                x_1 = "x_#{vertex_j}#{vertex_i}"
                x_2 = "x_#{vertex_i}#{vertex_j}"
                value = "#{x_1} + #{x_2} <= 1"
                @outputFile.puts(value)
                @outputFile.puts("x3_#{vertex_i}#{vertex_j}: #{value}")
            end
        end
    end

    def generateConstraintsToY

        # for all j in V-{1} y_1j = (n-1)x_1j
        firstVertex = @vertices[0]
        nonFirstVertices = @vertices.drop(1)
        
        nonFirstVertices.each do |vertex|
            y = "y_#{firstVertex}#{vertex}"
            x = "x_#{firstVertex}#{vertex}"
            value = "#{y} - #{nonFirstVertices.size} #{x} = 0"
            @outputFile.puts("y1_#{vertex}: #{value}")
        end 

        # for all j != j y_ij <= (n-1)x_ij
        nonFirstVertices.each do |vertex_i|
            @vertices.each do |vertex_j|
                next if vertex_i == vertex_j

                y = "y_#{vertex_i}#{vertex_j}"
                x = "x_#{vertex_i}#{vertex_j}"
                value = "#{y} - #{nonFirstVertices.size} #{x} <= 0"
                @outputFile.puts("y2_#{vertex_i}#{vertex_j}: #{value}")
            end
        end

        # for all i in V-{1} sum j =! i y_ji - \sum j != i y_ij = 1
        nonFirstVertices.each do |vertex_i|
            value = ""
            @vertices.each do |vertex_j|
                next if vertex_i == vertex_j

                y_1 = "y_#{vertex_j}#{vertex_i}"
                y_2 = "y_#{vertex_i}#{vertex_j}"
                value += "#{y_1} - #{y_2} + "
            end

            value = value.chomp(" + ")
            value += " = 1"
            @outputFile.puts("y3_#{vertex_i}: #{value}")
        end
    end

    def addBounds
        @outputFile.puts("Bounds")
        generateBoundsToX
        generateBoundsToY
    end

    def generateBoundsToX
        # x_ij in {0, 1} -> 0 <= x_ij <=1
        @vertices.each do |vertex_i|
            @vertices.each do |vertex_j|
                next if vertex_i == vertex_j

                x = "x_#{vertex_i}#{vertex_j}"
                value = "0 <= #{x} <= 1"
                @outputFile.puts(value)
            end
        end
    end

    def generateBoundsToY
        # y_ij in {0, 1, ..., n-1} for all i != j -> 0 <= y_ij <= n-1

        yUpperBond = @vertices.size - 1
        @vertices.each do |vertex_i|
            @vertices.each do |vertex_j|
                next if vertex_i == vertex_j

                y = "y_#{vertex_i}#{vertex_j}"
                value = "0 <= #{y} <= #{yUpperBond}"
                @outputFile.puts(value)
            end
        end
    end

    def addInteger
        @outputFile.puts("Integer")
        generateInteger
    end

    def generateInteger
        @vertices.each do |vertex_i|
            @vertices.each do |vertex_j|
                next if vertex_i == vertex_j

                x = "x_#{vertex_i}#{vertex_j}"
                @outputFile.puts(x)
                y = "y_#{vertex_i}#{vertex_j}"
                @outputFile.puts(y)
            end
        end
    end

end