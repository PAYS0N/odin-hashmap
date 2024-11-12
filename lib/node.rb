# frozen_string_literal: true

# module to store linked lists implementation for odin
module OdinLinkedList
  # nodes with vals
  class Node
    attr_accessor :val, :next

    def initialize(val = nil, nextv = nil)
      @val = val
      @next = nextv
    end
  end
end
