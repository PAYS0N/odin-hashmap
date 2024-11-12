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

    def pop
      return if @size.zero?

      curr = @head
      curr = curr.next until curr.next.next.nil?
      curr.next = nil
      @tail = curr
      @size -= 1
    end

    def find(val)
      curr = @head
      i = -1
      until curr.next.nil?
        return val[1] if curr.val == val[0]

        curr = curr.next
        i += 1
      end
      return val[1] if curr.val == val[0]

      nil
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
  end
end
