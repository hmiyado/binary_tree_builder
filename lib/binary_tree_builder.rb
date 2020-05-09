require "binary_tree_builder/version"

module BinaryTreeBuilder
  class Main
    FILE_NAME='result.txt'
    NODE_BIT = 0
    LEAF_BIT = 1

    attr_accessor :root

    def create_new_binary_tree
      tree_nums, num_of_nodes = extract_tree_nums_with_max_num_of_nodes()
      p tree_nums
      puts "num of trees: #{tree_nums.length}"

      @memo = []
      tree_nums.each do |e|
        residue, @root = tree_num_to_tree_hash(e)
        add_node_to_binary_tree(@root)
      end
      @memo = @memo.sort.uniq
      p @memo
      puts "num of new trees: #{@memo.length}"
      output_all_tree_num()
      output_tree_num_by_num_of_nodes(num_of_nodes + 1)
    end

    def add_node_to_binary_tree(node)
      for branch in [:left, :right] do
        if !node[branch].nil?
          add_node_to_binary_tree(node[branch])
        else 
          node[branch] = {
            left: nil,
            right: nil
          }
          add_tree_num_to_memo()
          node[branch] = nil
        end
      end
    end

    def tree_hash_to_tree_num(current_num, node)
      tmp = current_num
      if !node[:left].nil?
        tmp = tree_hash_to_tree_num(tmp, node[:left])
      else 
        tmp = tmp << 1
        tmp += LEAF_BIT
      end
      if !node[:right].nil?
        tmp = tree_hash_to_tree_num(tmp, node[:right])
      else 
        tmp = tmp << 1
        tmp += LEAF_BIT
      end
      tmp = tmp << 1
      return tmp
    end

    def add_tree_num_to_memo()
      @memo << tree_hash_to_tree_num(0, @root)
    end

    def extract_tree_nums_with_max_num_of_nodes()
      max_num_of_nodes = 0
      # 6 はノードが1個のときの tree_num
      tree_nums = [6]
      File.open(FILE_NAME, "r") { |f| 
        f.each { |line|
          tree_num = line.to_i
          num_of_nodes = num_of_nodes(tree_num)
          if num_of_nodes > max_num_of_nodes
            # 更新
            max_num_of_nodes = num_of_nodes
            tree_nums = [tree_num]
          elsif num_of_nodes == max_num_of_nodes
            # 追加
            tree_nums << tree_num
          end
        }
      }
      [tree_nums, max_num_of_nodes]
    end

    def num_of_nodes(tree_num)
      # 立っている bit の個数: 葉の個数
      # ノードの個数: 葉の個数 - 1
      pop_count(tree_num) - 1
    end

    # 立っている bit の個数を数える
    def pop_count(x)
      b = 0
      while x > 0
        x &= x - 1
        b += 1
      end
      return b
    end

    def tree_num_to_tree_hash(tree_num)
      mask = 1
      tmp_tree_num = tree_num

      this_node_num = tree_num[0]
      right_num = tmp_tree_num[1]
      left_num = tmp_tree_num[2]
      tmp_tree_num = tmp_tree_num >> 3

      tmp_tree_num, right = if right_num == NODE_BIT
        # right 自身を表す bit (0) を付け加えておく
        tree_num_to_tree_hash(tmp_tree_num << 1)
      else
        [tmp_tree_num, nil]
      end

      tmp_tree_num, left = if left_num == NODE_BIT
        # left 自身を表す bit (0) を付け加えておく
        tree_num_to_tree_hash(tmp_tree_num << 1)
      else
        [tmp_tree_num, nil]
      end
      

      return [
        tmp_tree_num,{
          right: right,
          left: left
        }
      ]
    end

    def output_all_tree_num()
      File.open(FILE_NAME, "a+") { |f|
        @memo.each do |tree_num|
          f.puts(tree_num)
        end
      }
    end

    def output_tree_num_by_num_of_nodes(num_of_nodes)
      File.open("tree_num_with_nodes_#{num_of_nodes}.txt", "w") { |f|
        @memo.each do |tree_num|
          f.puts(tree_num)
        end
      }
    end
  end
end
