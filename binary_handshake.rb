# Binary Handshake Rules

# 1 = "wink"
# 10 = "double blink"
# 100 = "close your eyes"
# 1000 = "jump"
# 10000 = Reverse the order of the operations in the secret handshake.

# http://calleerlandsson.com/2014/02/06/rubys-bitwise-operators/
# ...had some bitwise operator help :)

class SecretHandshake
  RESPONSES = {
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }
  
  def initialize(bits_string)
    @bits_value = bits_string.to_i(2)
  end

  def commands
    output = []

    RESPONSES.each do |k, v|
      if (@bits_value & k) > 0
        output << v
      end
    end

    if @bits_value & 16 > 0
      output.reverse!
    end

    output
  end
end
