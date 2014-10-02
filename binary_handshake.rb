# Binary Handshake Rules

# 1 = "wink"
# 10 = "double blink"
# 100 = "close your eyes"
# 1000 = "jump"
# 10000 = Reverse the order of the operations in the secret handshake.

class SecretHandshake
  RESPONSES = [
    "wink",
    "double blink",
    "close your eyes",
    "jump"
  ]

  def initialize(bits)
    # @bits = bits.rjust(5, '0').chars
    # p "bits: #{@bits}"
    @bits = bits.to_i(2)
  end

  def commands
    output = []
    @bits.each_with_index do |bit, i|
      output << RESPONSES[i] if bit == '1'
      p "output: #{output}"
    end

    return output

    case @bits
    when "1", "10", "100", "1000"
      [RESPONSES[@bits]]
    when "11"
      ["wink", "double blink"]
    when "10011"
      ["double blink", "wink"]
    when "11111"
      ["jump", "close your eyes", "double blink", "wink"]
    else
      []
    end
  end
end
