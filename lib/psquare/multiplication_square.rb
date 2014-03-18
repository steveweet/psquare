require 'matrix'
class MultiplicationSquare

  attr_reader :axes

  def initialize(axes, out = STDOUT)
    @axes = axes
    @out = out
  end

  def display
    @out.puts(self.to_s)
  end

  def grid
    @grid ||= Matrix.build(axes.size) {|row,col| axes[row] * axes[col]}.to_a
  end

  def to_s
    maximum_width = grid.flatten.max.to_s.length
    output = ([ " " * maximum_width ] + [axes.each.map {|element| "%#{maximum_width}d" % element}]).join(" ") + "\n"
    grid.each_with_index do |row, index|
      output +=  ([axes[index]] + row).each.map {|element| "%#{maximum_width}d" % element}.join " "
      output += "\n"
    end

    output
  end

  
end

