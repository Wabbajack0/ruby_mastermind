class Hint
  attr_accessor :colors

  @@colors_reference = {
    :empty => 0,
    :black => 1,
    :white => 2,
  }

  def initialize(arr)
    @colors = [0, 0 , 0, 0]
    i = 0
    arr.each do |num|   # Moves blacks and whites to the right of the array
      if num != 0
        @colors[i] = num
        i += 1
      end
    end
  end

  def to_string
    return "#{@@colors_reference.key(@colors[0])} - #{@@colors_reference.key(@colors[1])} - " \
    "#{@@colors_reference.key(@colors[2])} - #{@@colors_reference.key(@colors[3])}"
  end
end
