# frozen_string_literal: true

require_relative("hashmap")

hash = OdinHashmap::Hashmap.new
hash.set("Hi", "There")
hash.set("My", "Friend")
hash.set("erverte", "rand")
hash.set("erverteev", "rand")
hash.set("erverte", "ruby")
hash.set("This is ", "here")
hash.display
puts "Key: \"Hi\" returns #{hash.get('Hi')}"
puts "Key: \"My\" returns #{hash.get('My')}"
puts "Key: \"erverteev\" returns #{hash.get('erverteev')}"
puts "Key: \"hihi\" returns #{hash.get('hihi')}"
puts "Has: \"My\" returns #{hash.has?('My')}"
puts "Has: \"erverteev\" returns #{hash.has?('erverteev')}"
puts "Has: \"hihi\" returns #{hash.has?('hihi')}"
puts "Keys: #{hash.keys}"
puts "Values: #{hash.values}"
puts "Entries: #{hash.entries}"
puts "Remove: \"erverte\" returns #{hash.remove('erverte')}"
puts "Remove: \"hihi\" returns #{hash.remove('hihi')}"
hash.display
puts hash.length
hash.clear
hash.display
