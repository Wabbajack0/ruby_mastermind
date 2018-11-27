class Combination
  attr_accessor :colors

  @@colors_reference = {
    :yellow => 1,
    :orange => 2,
    :red => 3,
    :green => 4,
    :blue => 5,
    :purple => 6
  }

  def initialize(arr)
    @colors = []
    arr.each_with_index { |col,i| @colors[i] = @@colors_reference[col.to_sym] }
  end

  def to_string
    return "#{@@colors_reference.key(@colors[0])} - #{@@colors_reference.key(@colors[1])} - " \
    "#{@@colors_reference.key(@colors[2])} - #{@@colors_reference.key(@colors[3])}"
  end
end

class Solution < Combination
  def initialize
    @colors = []
    @colors[0] = rand(6) + 1
    @colors[1] = rand(6) + 1
    @colors[2] = rand(6) + 1
    @colors[3] = rand(6) + 1
  end
end

class Guess < Combination
end
