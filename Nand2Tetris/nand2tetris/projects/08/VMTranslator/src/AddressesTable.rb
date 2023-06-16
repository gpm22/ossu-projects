class AddressesTable
  def initialize(fileName)
    @segments = { 'argument' => '@ARG', 'local' => '@LCL', 'static' => "@#{fileName}",
                  'constant' => '@', 'this' => '@THIS', 'that' => '@THAT',
                  'pointer' => nil, 'temp' => '@', 'translator' => '@R' }
  end

  def getAddress(segment, index)
    raise "segment #{segment} invalid " unless @segments.include?(segment)

    @segmentSymbol = @segments[segment]
    @index = index

    return getAddressForBaseAddresses if AddressesTable.isABaseAddress?(segment)

    return getTranslatorAddress if segment == 'translator'

    return getTemporaryAddress if segment == 'temp'

    return getConstantAddress if segment == 'constant'

    return getStaticAddress if segment == 'static'

    getPointerAddress
  end

  def self.isABaseAddress?(segment)
    %w[local this that argument].include?(segment)
  end

  private

  def getTranslatorAddress
    raise "VM translator variable index must be 0, 1, or 2 and not #{@index}" if @index < 0 && @index > 2

    "#{@segmentSymbol}#{@index + 13}"
  end

  def getTemporaryAddress
    raise "Temp variable index must be between 0 and 7 and cannot be #{@index}" if @index < 0 && @index > 7

    "#{@segmentSymbol}#{@index + 5}"
  end

  def getConstantAddress
    "#{@segmentSymbol}#{@index}"
  end

  def getStaticAddress
    "#{@segmentSymbol}.#{@index}"
  end

  def getAddressForBaseAddresses
    "#{@segmentSymbol}\nD=M\n@#{@index}"
  end

  def getPointerAddress
    raise "Pointer variables index must be 0 or 1 and not #{@index}" if @index != 0 && @index != 1

    @index == 0 ? @segments['this'] : @segments['that']
  end
end
