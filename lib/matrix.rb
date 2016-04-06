class Matrix
  attr_accessor :values
  
  def initialize(values)
    @values = values
  end

  def ==(other)
    @values == other.values
  end

  def num_rows
    @values.length
  end

  def num_cols
    @values[0].length
  end

  def *(other)
    Matrix.new(
      @values.map do |this_row|
        other.values.transpose.map do |that_col|
          this_row.zip(that_col).map do |x, y|
            x*y
          end.reduce(0) do |memo, x|
            memo+x
          end
        end
      end
    )
  end
end
