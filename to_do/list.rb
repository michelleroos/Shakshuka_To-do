require_relative "./item.rb"
require_relative "./list.rb"

class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="") # "2020-03-05"
        if Item.valid_date?(deadline) == false # "2010-03-05"
            return false
        else
            @items << Item.new(title, deadline, description)
        end
        true
    end

    def size
        @items.size
    end

    def valid_index?(index)
        return false if self.items[index].nil?
        true
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            false
        end
    end

    def [](index)
        if valid_index?(index)
            @items[index]
        else
            nil
        end
    end

    def priority
        @items.first
    end

    def print
        puts "----------------"
        puts @label
        puts "----------------"
        @items.each_with_index do |item, idx|
            puts "Index #{idx}"
            puts "Title #{item.title}"
            puts "Deadline #{item.deadline}"
            puts "----------------"
            true
        end
    end

    def print_full_item(index)
        puts "----------------"
        puts @items[index].title
        if @items[index].description == ""
            puts "No description available"
        else
            puts @items[index].description
        end
        puts @items[index].deadline
        puts "----------------"
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=+1)
        # Check if the index is valid
        # If true, move the item up (unless the item is first) and return true
        # If false, return false and do nothing
        if index == 0
            return true
        elsif valid_index?(index)
            # Move the item up amount times. 
            #  @items =
  [#<Item:0x00007ffda1ad4110 @deadline="2020-05-05", @description="", @title="Sleep">,
   #<Item:0x00007ffda1ab71c8 @deadline="2020-03-05", @description="", @title="Relax">]
            @items[index]
        else
            return false
        end
    end

    def down(index, amount=-1)
    end

end

list_1 = List.new("My to-do list")
list_1.add_item("Sleep", "2020-05-05", "")
list_1.add_item("Relax", "2020-03-05", "")