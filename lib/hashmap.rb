# frozen_string_literal: true

require_relative("linked_list")

module OdinHashmap
  # string hashmap implementation
  class Hashmap
    def initialize
      @max_load_factor = 0.8
      @entries = 0
      @capacity = 16
      create_buckets(@capacity)
    end

    def hash(key)
      key.chars.reduce(0) { |acc, char| ((83 * acc) + char.ord) % @capacity }
    end

    def create_buckets(num)
      @buckets = []
      num.times do
        @buckets.push(OdinLinkedList::LinkedList.new)
      end
    end

    def set(key, value)
      hash_v = hash(key)
      @buckets[hash_v].append([key, value])
      @entries += 1
    end

    def display
      @capacity.times do |i|
        puts "Bucket #{i}: #{@buckets[i]}"
      end
      puts "num of entries: #{@entries}"
    end
  end
end
