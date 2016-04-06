require_relative "../lib/matrix"

describe Matrix do
  context "1x1" do
    it "can retrieve size" do
      m = Matrix.new([[0]])
      expect(m.num_rows).to eq 1
      expect(m.num_cols).to eq 1
    end

    it "can be multiplied by a 1x1" do
      expect(Matrix.new([[2]])*Matrix.new([[3]])).to eq Matrix.new([[6]])
      expect(Matrix.new([[4]])*Matrix.new([[5]])).to eq Matrix.new([[20]])
    end
  end

  context "2x1" do
    it "can retrieve size" do
      m = Matrix.new([[0],
                      [0]])
      expect(m.num_rows).to eq 2
      expect(m.num_cols).to eq 1
    end
  end

  context "1x2" do
    it "can retrieve size" do
      m = Matrix.new([[0, 0]])
      expect(m.num_rows).to eq 1
      expect(m.num_cols).to eq 2
    end
  end

  context "2x2" do
    it "can retrieve size" do
      m = Matrix.new([[0, 0],
                      [0, 0]])
      expect(m.num_rows).to eq 2
      expect(m.num_cols).to eq 2
    end

    it "can be multiplied by a 2x2" do
      expect(
        Matrix.new([[1, 1],
                    [1, 1]]) *
        Matrix.new([[1, 1],
                    [1, 1]])
      ).to eq Matrix.new([[2, 2],
                          [2, 2]])

      expect(
        Matrix.new([[0, -1],
                    [1, 0]]) *
        Matrix.new([[0, -1],
                    [1, 0]])
      ).to eq Matrix.new([[-1, 0],
                          [0, -1]])
    end
  end
end
