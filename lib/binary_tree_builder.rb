require "binary_tree_builder/version"

module BinaryTreeBuilder
  class Main
    attr_accessor :root, :num_of_nodes

    def create_new_binary_tree
      @root = {      }
      add_node_to_binary_tree(@root)
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
          output_all()
          node[branch] = nil
        end
      end
    end

    def output_each(current_num, node)
      tmp = current_num
      if !node[:left].nil?
        tmp = output_each(tmp, node[:left])
      else 
        tmp = tmp << 1
        tmp += 1
      end
      if !node[:right].nil?
        tmp = output_each(tmp, node[:right])
      else 
        tmp = tmp << 1
        tmp += 1
      end
      tmp = tmp << 1
      return tmp
    end

    def output_all()
      all_num = output_each(0, @root)
      File.open("result.txt", "a+") { |f|
        f.puts(all_num)
      }
    end
  end
end
