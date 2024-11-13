# frozen_string_literal: true

require_relative("node")

# module to store linked lists implementation for odin
module OdinLinkedList
  # linked list of nodes with vals
  class LinkedList
    attr_accessor :size, :head, :tail

    def initialize
      @head = OdinLinkedList::Node.new(nil)
      @tail = @head
      @size = 0
    end

    def append(val)
      @tail.next = OdinLinkedList::Node.new(val)
      @tail = @tail.next
      @size += 1
    end

    def prepend(val)
      @head.next = OdinLinkedList::Node.new(val, @head.next)
      @size += 1
    end

    def at(index)
      return nil if index.negative?
      return nil unless index < size

      curr = @head
      (index + 1).times do
        curr = curr.next
      end
      curr.val
    end

    def pop
      return if @size.zero?

      curr = @head
      curr = curr.next until curr.next.next.nil?
      curr.next = nil
      @tail = curr
      @size -= 1
    end

    def shift
      @head = @head.next
      @head.val = nil
    end

    def contains?(val)
      curr = @head
      until curr.next.nil?
        return true if curr.val == val

        curr = curr.next
      end
      return true if curr.val == val

      false
    end

    def find_key(val)
      return nil if @size < 1

      curr = @head.next
      i = 0
      until curr.next.nil?
        return i if curr.val[0] == val

        curr = curr.next
        i += 1
      end
      return i if curr.val[0] == val

      nil
    end

    def insert_at(val, index)
      if index.zero?
        prepend(val)
      elsif index == (size + 1)
        append(val)
      elsif index.between?(0, size + 1)
        insert_at_helper(val, index)
      else
        puts "error enter valid index"
      end
    end

    def remove_at(index)
      if index.zero?
        shift
      elsif index == (size)
        pop
      elsif index.between?(0, size)
        remove_at_helper(index)
      else
        puts "error enter valid index"
      end
    end

    def display
      puts self
    end

    def to_s
      arr = []
      curr = @head
      until curr.next.nil?
        arr << "(#{curr.val}) -> "
        curr = curr.next
      end
      arr << "(#{curr.val}) -> nil"
      arr.join
    end

    private

    def insert_at_helper(val, index)
      curr = @head
      index.times do
        curr = curr.next
      end
      curr.next = OdinLinkedList::Node.new(val, curr.next)
    end

    def remove_at_helper(index)
      curr = @head
      index.times do
        curr = curr.next
      end
      curr.next = curr.next.next
    end
  end
end
