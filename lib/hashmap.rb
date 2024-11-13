# frozen_string_literal: true

require_relative("linked_list")

module OdinHashmap
  # string hashmap implementation
  class Hashmap
    def initialize
      @load_factor = 0.8
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
      @entries += 1
      resize if @entries > @capacity * @load_factor
      hash_v = hash(key)
      list = @buckets[hash_v]
      index = list.find_key(key)
      list.remove_at(index) unless index.nil?
      list.append([key, value])
    end

    def get(key)
      hash_v = hash(key)
      list = @buckets[hash_v]
      index = list.find_key(key)
      index.nil? ? nil : list.at(index)[1]
    end

    def resize
      puts "resize unimplemented"
    end

    def display
      @capacity.times do |i|
        puts "Bucket #{i}: #{@buckets[i]}"
      end
      puts "num of entries: #{@entries}"
    end
  end
end
