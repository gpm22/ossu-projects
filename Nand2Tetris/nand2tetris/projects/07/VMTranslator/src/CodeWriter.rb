class CodeWriter
    def initialize(outputFile)
        @file = File.new(outputFile)
        @file.truncate(0)
    end

    def writeArithmetic(command)

    end

    def writePushPop(command, segment, index)
    end

    def close
        @file.close
    end
end