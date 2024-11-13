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
