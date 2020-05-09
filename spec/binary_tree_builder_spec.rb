RSpec.describe BinaryTreeBuilder do
  it "has a version number" do
    expect(BinaryTreeBuilder::VERSION).not_to be nil
  end

  it "output 6 for {left: nil, right: nil}" do
    expect(BinaryTreeBuilder::Main.new().tree_hash_to_tree_num(0, {
      left: nil,
      right: nil
    })).to eq(6)
  end

  it "output 26 for {left: {left: nil, right: nil}, right: nil}" do
    expect(BinaryTreeBuilder::Main.new().tree_hash_to_tree_num(0, {
      left: {
        left: nil,
        right: nil
      },
      right: nil
    })).to eq(26)
  end

  it "output 28 for {left: nil, right: {left: nil, right: nil}}" do
    expect(BinaryTreeBuilder::Main.new().tree_hash_to_tree_num(0, {
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

  it "should answer that node num is 5 when tree num is 1706" do
    expect(BinaryTreeBuilder::Main.new().num_of_nodes(1706)).to eq(5)
  end

  it "should answer that node num is 5 when tree num is 1834" do
    expect(BinaryTreeBuilder::Main.new().num_of_nodes(1834)).to eq(5)
  end

  it "should return correct tree hash when tree_num is 6(1 node)" do
    residue, tree_hash = BinaryTreeBuilder::Main.new().tree_num_to_tree_hash(6)
    expect(tree_hash).to eq({left: nil, right: nil})
  end

  it "should return correct tree hash when tree_num is 26(2 node)" do
    residue, tree_hash = BinaryTreeBuilder::Main.new().tree_num_to_tree_hash(26)
    expect(tree_hash).to eq({
      left: {
        left: nil,
        right: nil
      },
      right: nil
    })
  end
  it "should return correct tree hash when tree_num is 28(2 node)" do
    residue, tree_hash = BinaryTreeBuilder::Main.new().tree_num_to_tree_hash(28)
    expect(tree_hash).to eq( {
      left: nil,
      right: {
        left: nil,
        right: nil
      }
    })
  end
end
