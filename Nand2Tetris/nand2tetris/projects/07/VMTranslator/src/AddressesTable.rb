class AddressesTable

    def initialize(fileName)
        @segments = {"argument" => "ARG", "local" => "LCL", "static" => fileName.to_s,
                     "constant" => "@", "this" => "THIS" , "that" => "THAT",
                     "pointer" => nil , "temp" => "@", "translator" => "R"}
    end

    def getAdress(segment, index)
        raise "segment #{segment} invalid " unless @segments.include?(segment)

        segmentSymbol = @segments[segment]

        if segment == "local" || segment == "this" || segment == "that" || segment == "argument"
            return segmentSymbol
        end

        if segment == "translator"  
            raise "VM translator variable index must be 0, 1, or 2 and not #{index}" if index < 0 && index > 2 

            return "#{segmentSymbol}#{(index+13).to_s}"
        end

        if segment == "temp"
            raise "Temp variable index must be between 0 and 7 and cannot be #{index}" if index <0 && index > 7

            return "#{segmentSymbol}#{(index+5).to_s}"
        end

        if segment == "constant"
            return "#{segmentSymbol}#{index.to_s}"
        end

        if segment == "static"
            return "#{segmentSymbol}.#{index.to_s}"
        end

        if segment == "pointer"
            raise "Pointer variables index must be 0 or 1 and not #{index}"  if index !=0 && index !=1

            return @segments["this"] if index == 0 
            return @segments["that"] if index == 1 
        end
        nil
    end
end