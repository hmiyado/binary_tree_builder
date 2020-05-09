RSpec.describe BinaryTreeBuilder do
  it "has a version number" do
    expect(BinaryTreeBuilder::VERSION).not_to be nil
  end

  it "output 6 for {left: nil, right: nil}" do
    expect(BinaryTreeBuilder::Main.new().output_each(0, {
      left: nil,
      right: nil
    })).to eq(6)
  end

  it "output 26 for {left: {left: nil, right: nil}, right: nil}" do
    expect(BinaryTreeBuilder::Main.new().output_each(0, {
      left: {
        left: nil,
        right: nil
      },
      right: nil
    })).to eq(26)
  end

  it "output 28 for {left: nil, right: {left: nil, right: nil}}" do
    expect(BinaryTreeBuilder::Main.new().output_each(0, {
      left: nil,
      right: {
        left: nil,
        right: nil
      }
    })).to eq(28)
  end

  it "should answer that node num is 1 when tree num is 6" do
    expect(BinaryTreeBuilder::Main.new().num_of_nodes(6)).to eq(1)
  end

  it "should answer that node num is 2 when tree num is 26" do
    expect(BinaryTreeBuilder::Main.new().num_of_nodes(26)).to eq(2)
  end

  it "should answer that node num is 2 when tree num is 28" do
    expect(BinaryTreeBuilder::Main.new().num_of_nodes(28)).to eq(2)
  end
end
