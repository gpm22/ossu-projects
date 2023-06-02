require_relative '../src/AddressesTable'

def tests
    addresses = AddressesTable.new("Foo")

    testGetAddress(addresses, "static", 16, "Foo.16")
    testGetAddress(addresses, "pointer", 0, "THIS")
    testGetAddress(addresses, "pointer", 1, "THAT")
    testGetAddress(addresses, "temp", 1, "@6")
    testGetAddress(addresses, "local", 1, "LCL")
end

def testGetAddress(addresses, value, index, expected)
    result = addresses.getAdress(value, index)

    puts "address for #{value} - #{index.to_s} is #{result}"
    raise "fail test" if result != expected
end

tests