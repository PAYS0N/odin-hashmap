# frozen_string_literal: true

require_relative("linked_list")

module OdinHashmap
  # string hashmap implementation
  class Hashmap
    attr_reader :length

    def initialize
      @load_factor = 0.8
      @length = 0
      @capacity = 16
      create_buckets(@capacity)
    end

    def hash(key)
      key.chars.reduce(0) { |acc, char| ((83 * acc) + (7 * char.ord)) % @capacity }
    end

    def create_buckets(num)
      @buckets = []
      num.times do
        @buckets.push(OdinLinkedList::LinkedList.new)
      end
    end

    def set(key, value)
      hash_v = hash(key)
      list = @buckets[hash_v]
      index = list.find_key(key)
      unless index.nil?
        list.remove_at(index)
        @length -= 1
      end
      @length += 1
      resize if @length > @capacity * @load_factor
      list.append([key, value])
    end

    def get(key)
      hash_v = hash(key)
      list = @buckets[hash_v]
      index = list.find_key(key)
      index.nil? ? nil : list.at(index)[1]
    end

    def has?(key)
      hash_v = hash(key)
      list = @buckets[hash_v]
      index = list.find_key(key)
      !index.nil?
    end

    def remove(key)
      hash_v = hash(key)
      list = @buckets[hash_v]
      index = list.find_key(key)
      unless index.nil?
        val = list.at(index)[1]
        list.remove_at(index)
        @length -= 1
        return val
      end
      nil
    end

    def keys
      key_list = []
      @buckets.each do |list|
        list.size.times do |i|
          key_list.push(list.at(i)[0])
        end
      end
      key_list
    end

    def values
      value_list = []
      @buckets.each do |list|
        list.size.times do |i|
          value_list.push(list.at(i)[1])
        end
      end
      value_list
    end

    def entries
      entry_list = []
      @buckets.each do |list|
        list.size.times do |i|
          entry_list.push(list.at(i))
        end
      end
      entry_list
    end

    def clear
      @length = 0
      create_buckets(@capacity)
    end

    def resize
      curr_entries = entries
      @capacity *= 2
      clear
      curr_entries.each do |key, value|
        set(key, value)
      end
    end

    def display
      @capacity.times do |i|
        puts "Bucket #{i}: #{@buckets[i]}"
      end
      puts "num of entries: #{@length}"
    end
  end
end
